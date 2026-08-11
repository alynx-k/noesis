document.getElementById('year').textContent = new Date().getFullYear();

/* ---------- Theme toggle ---------- */
const themeToggle = document.getElementById('themeToggle');
const root = document.documentElement;
const savedTheme = localStorage.getItem('noesis-theme');
if (savedTheme) root.setAttribute('data-theme', savedTheme);
themeToggle.addEventListener('click', () => {
  const current = root.getAttribute('data-theme') || (window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light');
  const next = current === 'dark' ? 'light' : 'dark';
  root.setAttribute('data-theme', next);
  localStorage.setItem('noesis-theme', next);
});

/* ---------- Mobile nav ---------- */
const navToggle = document.getElementById('navToggle');
const navLinks = document.querySelector('.nav-links');
navToggle.addEventListener('click', () => navLinks.classList.toggle('open'));

/* ---------- Scroll progress ---------- */
const scrollProgress = document.getElementById('scrollProgress');
function updateScrollProgress() {
  const h = document.documentElement;
  const scrolled = (h.scrollTop) / (h.scrollHeight - h.clientHeight) * 100;
  scrollProgress.style.width = `${scrolled}%`;
}
document.addEventListener('scroll', updateScrollProgress, { passive: true });
updateScrollProgress();

/* ---------- Header shrink on scroll ---------- */
const header = document.getElementById('siteHeader');
document.addEventListener('scroll', () => {
  header.style.boxShadow = window.scrollY > 8 ? '0 8px 24px -20px rgba(0,0,0,0.3)' : 'none';
}, { passive: true });

/* ---------- Reveal on scroll ---------- */
const revealTargets = document.querySelectorAll('.reveal-up');
const revealObserver = new IntersectionObserver((entries) => {
  entries.forEach((entry) => {
    if (entry.isIntersecting) {
      entry.target.classList.add('in-view');
      revealObserver.unobserve(entry.target);
    }
  });
}, { threshold: 0.15, rootMargin: '0px 0px -60px 0px' });
revealTargets.forEach((el) => revealObserver.observe(el));

document.querySelector('.hero-title').classList.add('in-view');

/* ---------- Counters ---------- */
const counters = document.querySelectorAll('.counter');
const counterObserver = new IntersectionObserver((entries) => {
  entries.forEach((entry) => {
    if (!entry.isIntersecting) return;
    const el = entry.target;
    const target = parseInt(el.dataset.count, 10);
    const duration = 1400;
    const start = performance.now();
    function tick(now) {
      const p = Math.min((now - start) / duration, 1);
      const eased = 1 - Math.pow(1 - p, 3);
      el.textContent = Math.round(eased * target);
      if (p < 1) requestAnimationFrame(tick);
    }
    requestAnimationFrame(tick);
    counterObserver.unobserve(el);
  });
}, { threshold: 0.5 });
counters.forEach((el) => counterObserver.observe(el));

/* ---------- Steps progress line ---------- */
const stepsTrack = document.getElementById('stepsTrack');
const stepsLineFill = document.getElementById('stepsLineFill');
if (stepsTrack) {
  const stepsObserver = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        stepsLineFill.style.width = '100%';
        stepsObserver.unobserve(entry.target);
      }
    });
  }, { threshold: 0.4 });
  stepsObserver.observe(stepsTrack);
}

/* ---------- Accordion ---------- */
document.querySelectorAll('.accordion-trigger').forEach((btn) => {
  btn.addEventListener('click', () => {
    const item = btn.closest('.accordion-item');
    const wasOpen = item.classList.contains('open');
    item.parentElement.querySelectorAll('.accordion-item').forEach((i) => i.classList.remove('open'));
    if (!wasOpen) item.classList.add('open');
  });
});

/* ---------- Custom cursor ---------- */
const cursorDot = document.getElementById('cursorDot');
const isFinePointer = window.matchMedia('(hover: hover) and (pointer: fine)').matches;
if (isFinePointer) {
  let cx = window.innerWidth / 2, cy = window.innerHeight / 2, dx = cx, dy = cy;
  document.addEventListener('mousemove', (e) => { cx = e.clientX; cy = e.clientY; });
  function followCursor() {
    dx += (cx - dx) * 0.18;
    dy += (cy - dy) * 0.18;
    cursorDot.style.transform = `translate(${dx}px, ${dy}px) translate(-50%, -50%)`;
    requestAnimationFrame(followCursor);
  }
  followCursor();

  document.querySelectorAll('a, button, [data-cursor="link"]').forEach((el) => {
    el.addEventListener('mouseenter', () => cursorDot.classList.add('hovering'));
    el.addEventListener('mouseleave', () => cursorDot.classList.remove('hovering'));
  });
}

/* ---------- Magnetic buttons ---------- */
if (isFinePointer) {
  document.querySelectorAll('.magnetic').forEach((el) => {
    el.addEventListener('mousemove', (e) => {
      const rect = el.getBoundingClientRect();
      const relX = e.clientX - rect.left - rect.width / 2;
      const relY = e.clientY - rect.top - rect.height / 2;
      el.style.transform = `translate(${relX * 0.25}px, ${relY * 0.4}px)`;
    });
    el.addEventListener('mouseleave', () => { el.style.transform = 'translate(0, 0)'; });
  });
}

/* ---------- Tilt cards ---------- */
if (isFinePointer) {
  document.querySelectorAll('.tilt').forEach((el) => {
    el.addEventListener('mousemove', (e) => {
      const rect = el.getBoundingClientRect();
      const px = (e.clientX - rect.left) / rect.width - 0.5;
      const py = (e.clientY - rect.top) / rect.height - 0.5;
      el.style.transform = `perspective(600px) rotateX(${-py * 6}deg) rotateY(${px * 6}deg) translateY(-2px)`;
    });
    el.addEventListener('mouseleave', () => { el.style.transform = ''; });
  });
}

/* ---------- Floating chips parallax ---------- */
if (isFinePointer) {
  const chips = document.querySelectorAll('.floating-chip');
  document.querySelector('.orbit-wrap')?.addEventListener('mousemove', (e) => {
    const rect = e.currentTarget.getBoundingClientRect();
    const px = (e.clientX - rect.left) / rect.width - 0.5;
    const py = (e.clientY - rect.top) / rect.height - 0.5;
    chips.forEach((chip) => {
      const depth = parseFloat(chip.dataset.depth || 20);
      chip.style.transform = `translate(${px * depth}px, ${py * depth}px)`;
    });
  });
}

/* ---------- Reactive "black panther coat" hero canvas ---------- */
const pantherCanvas = document.getElementById('pantherCanvas');
if (pantherCanvas && isFinePointer) {
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
      const shade = 8 + Math.random() * 14;
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
    if (rect.width < 1 || rect.height < 1) { requestAnimationFrame(resize); return; }
    pantherCanvas.width = rect.width * dpr;
    pantherCanvas.height = rect.height * dpr;
    grain = buildGrain(pantherCanvas.width, pantherCanvas.height);
  }
  resize();
  window.addEventListener('resize', resize);

  function draw() {
    if (!grain) { requestAnimationFrame(draw); return; }
    const w = pantherCanvas.width, h = pantherCanvas.height;
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
    ripples.push({ x: (e.clientX - rect.left) * dpr, y: (e.clientY - rect.top) * dpr, t: now });
  });
}

/* ---------- Black-panther paw-print cursor trail ---------- */
const PAW_SVG = `<svg viewBox="0 0 100 100" fill="#0B0B0B">
  <ellipse cx="50" cy="62" rx="24" ry="20"/>
  <ellipse cx="20" cy="30" rx="11" ry="14" transform="rotate(-15 20 30)"/>
  <ellipse cx="44" cy="16" rx="11" ry="14"/>
  <ellipse cx="68" cy="18" rx="11" ry="14" transform="rotate(10 68 18)"/>
  <ellipse cx="86" cy="38" rx="10" ry="13" transform="rotate(30 86 38)"/>
</svg>`;

let lastPaw = 0;
let pawFlip = 1;
if (isFinePointer) {
  document.addEventListener('mousemove', (e) => {
    const now = Date.now();
    if (now - lastPaw < 140) return;
    lastPaw = now;
    pawFlip *= -1;
    const paw = document.createElement('div');
    paw.className = 'paw-print';
    paw.innerHTML = PAW_SVG;
    paw.style.cssText = `position:fixed;top:0;left:0;width:16px;height:16px;pointer-events:none;z-index:9999;opacity:0.55;animation:paw-fade 900ms ease-out forwards;left:${e.clientX - 8 + pawFlip * 10}px;top:${e.clientY - 8}px;transform:rotate(${pawFlip * 20}deg) scaleX(${pawFlip});`;
    document.body.appendChild(paw);
    setTimeout(() => paw.remove(), 950);
  });
}
const pawStyle = document.createElement('style');
pawStyle.textContent = `@keyframes paw-fade{0%{opacity:.55;transform:scale(1) translateY(0)}100%{opacity:0;transform:scale(.6) translateY(10px)}}`;
document.head.appendChild(pawStyle);

/* ---------- CTA band ambient particles ---------- */
const ctaCanvas = document.getElementById('ctaCanvas');
if (ctaCanvas) {
  const ctx2 = ctaCanvas.getContext('2d');
  let particles = [];
  let dpr2 = Math.min(window.devicePixelRatio || 1, 2);

  function resizeCta() {
    const rect = ctaCanvas.getBoundingClientRect();
    if (rect.width < 1) { requestAnimationFrame(resizeCta); return; }
    ctaCanvas.width = rect.width * dpr2;
    ctaCanvas.height = rect.height * dpr2;
    particles = Array.from({ length: 44 }, () => ({
      x: Math.random() * ctaCanvas.width,
      y: Math.random() * ctaCanvas.height,
      r: (Math.random() * 1.6 + 0.6) * dpr2,
      vy: -(Math.random() * 0.25 + 0.08) * dpr2,
      a: Math.random() * 0.5 + 0.2,
    }));
  }
  resizeCta();
  window.addEventListener('resize', resizeCta);

  function drawCta() {
    if (!particles.length) { requestAnimationFrame(drawCta); return; }
    ctx2.clearRect(0, 0, ctaCanvas.width, ctaCanvas.height);
    particles.forEach((p) => {
      p.y += p.vy;
      if (p.y < -10) p.y = ctaCanvas.height + 10;
      ctx2.beginPath();
      ctx2.fillStyle = `rgba(255,255,255,${p.a})`;
      ctx2.arc(p.x, p.y, p.r, 0, Math.PI * 2);
      ctx2.fill();
    });
    requestAnimationFrame(drawCta);
  }
  drawCta();
}

/* ---------- Waitlist form ---------- */
const form = document.getElementById('waitlistForm');
const success = document.getElementById('formSuccess');
form.addEventListener('submit', (e) => {
  e.preventDefault();
  form.style.display = 'none';
  success.style.display = 'block';
});
