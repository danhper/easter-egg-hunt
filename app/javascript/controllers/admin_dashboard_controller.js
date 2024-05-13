import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  gotoAnswer(event) {
    if (window.screen.width > 768) return;
    const answerId = event.currentTarget.dataset.id;
    Turbo.visit(`/admin/answers/${answerId}`);
  }
}
