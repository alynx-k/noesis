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

const form = document.getElementById('waitlistForm');
const success = document.getElementById('formSuccess');
form.addEventListener('submit', (e) => {
  e.preventDefault();
  // TODO: wire this up to a real waitlist endpoint (e.g. a Supabase table)
  // once one exists — for now it just confirms locally.
  form.style.display = 'none';
  success.style.display = 'block';
});
