document.getElementById('year').textContent = new Date().getFullYear();

const navToggle = document.getElementById('navToggle');
const navLinks = document.querySelector('.nav-links');
navToggle.addEventListener('click', () => {
  navLinks.classList.toggle('open');
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
