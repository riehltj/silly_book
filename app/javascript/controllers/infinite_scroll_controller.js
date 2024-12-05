import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["pagination"];

  connect() {
    this.observer = new IntersectionObserver(this.handleIntersect.bind(this), {
      threshold: 1.0,
    });
    this.observer.observe(this.paginationTarget);
  }

  disconnect() {
    this.observer.disconnect();
  }

  handleIntersect(entries) {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        this.loadMore();
      }
    });
  }

  loadMore() {
    const nextLink = this.paginationTarget.querySelector("a[rel='next']");
    if (nextLink) {
      fetch(nextLink.href, {
        headers: { Accept: "text/vnd.turbo-stream.html" },
      });
    }
  }
}
