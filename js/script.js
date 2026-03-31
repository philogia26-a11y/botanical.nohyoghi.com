/* Nohyoghi Website Interactions */

document.addEventListener("DOMContentLoaded", () => {
  // Language Switcher Logic
  const langSelector = document.getElementById("lang-selector");

  if (langSelector) {
    langSelector.addEventListener("change", (e) => {
      const selectedLang = e.target.value;
      let targetUrl = "index.html"; // Default to EN

      if (selectedLang === "id") {
        targetUrl = "id.html";
      } else if (selectedLang === "de") {
        targetUrl = "de.html";
      }

      window.location.href = targetUrl;
    });
  }

  // Mobile Menu Logic
  const mobileBtn = document.querySelector('.mobile-menu-btn');
  const navLinks = document.querySelector('.nav-links');

  if (mobileBtn && navLinks) {
    mobileBtn.addEventListener('click', () => {
      navLinks.classList.toggle('active');

      // Animate hamburger to X
      const spans = mobileBtn.querySelectorAll('span');
      if (navLinks.classList.contains('active')) {
        spans[0].style.transform = 'rotate(45deg) translate(5px, 6px)';
        spans[1].style.opacity = '0';
        spans[2].style.transform = 'rotate(-45deg) translate(5px, -6px)';
      } else {
        spans[0].style.transform = 'none';
        spans[1].style.opacity = '1';
        spans[2].style.transform = 'none';
      }
    });

    // Close menu when clicking a link
    navLinks.querySelectorAll('a').forEach(link => {
      link.addEventListener('click', () => {
        navLinks.classList.remove('active');
        const spans = mobileBtn.querySelectorAll('span');
        spans[0].style.transform = 'none';
        spans[1].style.opacity = '1';
        spans[2].style.transform = 'none';
      });
    });
  }

  // Header Scroll Effect
  const header = document.querySelector("header");
  window.addEventListener("scroll", () => {
    if (window.scrollY > 50) {
      header.style.boxShadow = "0 4px 20px rgba(0,0,0,0.1)";
    } else {
      header.style.boxShadow = "0 2px 10px rgba(0,0,0,0.05)";
    }
  });

  // Simple Form Validation Visuals
  const form = document.querySelector(".inquiry-form");
  if (form) {
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      // Simulate submission
      const btn = form.querySelector("button");
      const originalText = btn.textContent;

      btn.textContent = "Sending...";
      btn.style.backgroundColor = "#999";

      setTimeout(() => {
        alert("Thank you for your inquiry. We will contact you shortly.");
        btn.textContent = originalText;
        btn.style.backgroundColor = "";
        form.reset();
      }, 1000);
    });
  }
});
