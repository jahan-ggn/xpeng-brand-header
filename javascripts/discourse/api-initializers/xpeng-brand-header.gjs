import { apiInitializer } from "discourse/lib/api";
import LightDarkToggle from "../components/light-dark-toggle";

export default apiInitializer((api) => {
  api.renderInOutlet("header-contents__after", LightDarkToggle);
  const setActiveLink = () => {
    const links = document.querySelectorAll(
      ".custom-header-links .headerLink a"
    );
    links.forEach((a) =>
      a.classList.toggle("active", a.pathname === window.location.pathname)
    );
  };

  api.onPageChange(setActiveLink);
  setActiveLink();
});
