document.addEventListener("DOMContentLoaded", () => {
  const hamburger = document.querySelector(".hamburger");
  const menuLinks = document.querySelector(".menu-links");

  if (hamburger && menuLinks) {
    hamburger.addEventListener("click", () => {
      hamburger.classList.toggle("active");
      menuLinks.classList.toggle("active");
    });
  }
});

document.addEventListener("DOMContentLoaded", () => {
  const currentPage = window.location.pathname.split("/").pop();
  const navLinks = document.querySelectorAll(".menu-links ul a");

  navLinks.forEach((link) => {
    const linkPage = link.getAttribute("href").split("/").pop();
    if (currentPage === linkPage) {
      link.closest(".menu-links-container").classList.add("active-page");
    }
  });
});
