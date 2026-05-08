import { apiInitializer } from "discourse/lib/api";
import LightDarkToggle from "../components/light-dark-toggle";

export default apiInitializer((api) => {
  api.renderInOutlet("header-contents__after", LightDarkToggle);
  api.replaceIcon("magnifying-glass", "xk-search-icon");
  const setActiveLink = () => {
    const links = document.querySelectorAll(
      ".custom-header-links .headerLink a"
    );

    links.forEach((a) => {
      const href = a.getAttribute("href");

      const isActive =
        href && href !== "#" && a.pathname === window.location.pathname;

      a.classList.toggle("active", isActive);
    });
  };
  setActiveLink();
});
