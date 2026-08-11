document.getElementById('year').textContent = new Date().getFullYear();

const navToggle = document.getElementById('navToggle');
const navLinks = document.querySelector('.nav-links');
navToggle.addEventListener('click', () => {
  navLinks.classList.toggle('open');
});

// Black panther paw-print trail following the cursor (desktop only —
// disabled on touch devices via the `(hover: none)` media query in CSS).
const PAW_SVG = `<svg viewBox="0 0 100 100" fill="#0B0B0B">
  <ellipse cx="50" cy="62" rx="24" ry="20"/>
  <ellipse cx="20" cy="30" rx="11" ry="14" transform="rotate(-15 20 30)"/>
  <ellipse cx="44" cy="16" rx="11" ry="14"/>
  <ellipse cx="68" cy="18" rx="11" ry="14" transform="rotate(10 68 18)"/>
  <ellipse cx="86" cy="38" rx="10" ry="13" transform="rotate(30 86 38)"/>
</svg>`;

let lastPaw = 0;
let pawFlip = 1;
document.addEventListener('mousemove', (e) => {
  const now = Date.now();
  if (now - lastPaw < 140) return;
  lastPaw = now;
  pawFlip *= -1;

  const paw = document.createElement('div');
  paw.className = 'paw-print';
  paw.innerHTML = PAW_SVG;
  paw.style.left = `${e.clientX - 8 + pawFlip * 10}px`;
  paw.style.top = `${e.clientY - 8}px`;
  paw.style.transform = `rotate(${pawFlip * 20}deg) scaleX(${pawFlip})`;
  document.body.appendChild(paw);
  setTimeout(() => paw.remove(), 950);
});

// Reactive "black panther coat" surface in the hero visual — a dark
// grainy panel that catches light where the cursor moves, echoing the
// sand-ripple effect from the reference (github.com/... instagram reel)
// but as a lightweight 2D canvas instead of a WebGL displacement shader.
const pantherCanvas = document.getElementById('pantherCanvas');
if (pantherCanvas && !window.matchMedia('(hover: none)').matches) {
  const ctx = pantherCanvas.getContext('2d');
  const card = pantherCanvas.closest('.orbit-card');
  let grain;
  let ripples = [];
  let dpr = Math.min(window.devicePixelRatio || 1, 2);

  function buildGrain(w, h) {
    const g = document.createElement('canvas');
    g.width = w;
    g.height = h;
    const gctx = g.getContext('2d');
    const img = gctx.createImageData(w, h);
    for (let i = 0; i < img.data.length; i += 4) {
      const shade = 8 + Math.random() * 14; // near-black fur speckle
      img.data[i] = shade;
      img.data[i + 1] = shade;
      img.data[i + 2] = shade;
      img.data[i + 3] = 255;
    }
    gctx.putImageData(img, 0, 0);
    return g;
  }

  function resize() {
    const rect = card.getBoundingClientRect();
    if (rect.width < 1 || rect.height < 1) {
      requestAnimationFrame(resize);
      return;
    }
    pantherCanvas.width = rect.width * dpr;
    pantherCanvas.height = rect.height * dpr;
    grain = buildGrain(pantherCanvas.width, pantherCanvas.height);
  }
  resize();
  window.addEventListener('resize', resize);

  function draw() {
    if (!grain) {
      requestAnimationFrame(draw);
      return;
    }
    const w = pantherCanvas.width;
    const h = pantherCanvas.height;
    ctx.clearRect(0, 0, w, h);
    ctx.drawImage(grain, 0, 0);

    const now = Date.now();
    ripples = ripples.filter((r) => now - r.t < 900);
    ctx.globalCompositeOperation = 'lighter';
    for (const r of ripples) {
      const age = (now - r.t) / 900;
      const radius = (30 + age * 70) * dpr;
      const alpha = (1 - age) * 0.35;
      const grad = ctx.createRadialGradient(r.x, r.y, 0, r.x, r.y, radius);
      grad.addColorStop(0, `rgba(200, 210, 220, ${alpha})`);
      grad.addColorStop(0.5, `rgba(120, 130, 150, ${alpha * 0.4})`);
      grad.addColorStop(1, 'rgba(0,0,0,0)');
      ctx.fillStyle = grad;
      ctx.beginPath();
      ctx.arc(r.x, r.y, radius, 0, Math.PI * 2);
      ctx.fill();
    }
    ctx.globalCompositeOperation = 'source-over';
    requestAnimationFrame(draw);
  }
  draw();

  let lastRipple = 0;
  pantherCanvas.addEventListener('mousemove', (e) => {
    const now = Date.now();
    if (now - lastRipple < 60) return;
    lastRipple = now;
    const rect = pantherCanvas.getBoundingClientRect();
    ripples.push({
      x: (e.clientX - rect.left) * dpr,
      y: (e.clientY - rect.top) * dpr,
      t: now,
    });
  });
}

const form = document.getElementById('waitlistForm');
const success = document.getElementById('formSuccess');
form.addEventListener('submit', (e) => {
  e.preventDefault();
  // TODO: wire this up to a real waitlist endpoint (e.g. a Supabase table)
  // once one exists — for now it just confirms locally.
  form.style.display = 'none';
  success.style.display = 'block';
});
