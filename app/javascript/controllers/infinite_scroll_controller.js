import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["pagination", "loadingSpinner"];

  connect() {
    this.observer = new IntersectionObserver(this.handleIntersect.bind(this), {
      root: document.querySelector("#scrollable-container"),
      threshold: 0.5,
    });
    this.observer.observe(this.paginationTarget);
  }

  disconnect() {
    if (this.observer) {
      this.observer.disconnect();
    }
  }

  handleIntersect(entries) {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        this.loadNextPage();
      }
    });
  }

  loadNextPage() {
    const nextLink = this.paginationTarget.querySelector("a[rel='next']");
    if (nextLink) {
      this.showLoadingSpinner();
      // Turbo will handle the page fetch and DOM replacement
      Turbo.visit(nextLink.href, { frame: "catalog" });
    }
  }

  showLoadingSpinner() {
    this.loadingSpinnerTarget.classList.remove("hidden");
  }

  hideLoadingSpinner() {
    this.loadingSpinnerTarget.classList.add("hidden");
  }
}
