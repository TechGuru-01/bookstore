function updateNav() {
  const nav = document.querySelector("nav");
  const isProfilePage = window.location.pathname.includes("profile.php");
  if (window.scrollY > 50 || isProfilePage) {
    nav.classList.add("scrolled");
  } else {
    nav.classList.remove("scrolled");
  }
}
window.addEventListener("scroll", updateNav);
window.addEventListener("DOMContentLoaded", updateNav);
