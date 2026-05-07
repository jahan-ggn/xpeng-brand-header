import Component from "@glimmer/component";
import { action } from "@ember/object";
import { service } from "@ember/service";
import DButton from "discourse/components/d-button";

export default class UserMenuLightDarkToggle extends Component {
  @service interfaceColor;

  get currentMode() {
    return this.interfaceColor.colorMode || "light";
  }

  get label() {
    return this.currentMode === "dark" ? "Dark" : "Light";
  }

  @action
  toggle() {
    if (this.interfaceColor.darkModeForced) {
      this.interfaceColor.forceLightMode();
    } else {
      this.interfaceColor.forceDarkMode();
    }
  }

  <template>
    <div class="user-menu-light-dark-toggle">
      <DButton
        @action={{this.toggle}}
        @translatedLabel={{this.label}}
        class="user-menu-light-dark-toggle__button"
      />
    </div>
  </template>
}
