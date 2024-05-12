import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["tabs"];

  initialize() {
    console.log(this.tabsTarget);
    M.Tabs.init(this.tabsTarget, {});
  }

  disconnect() {
    M.Tabs.getInstance(this.tabsTarget).destroy();
  }
}
