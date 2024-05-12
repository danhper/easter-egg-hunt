import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["tooltip"];

  initialize() {
    this.tooltipTargets.forEach((target) => {
      M.Tooltip.init(target, {});
    });
  }

  disconnect() {
    this.tooltipTargets.forEach((target) => {
      M.Tooltip.getInstance(target).destroy();
    });
  }
}
