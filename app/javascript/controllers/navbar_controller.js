import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  initialize() {
    M.AutoInit();
  }

  disconnect() {
    M.Sidenav._sidenavs = [];
  }
}
