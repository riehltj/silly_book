import { Controller } from "@hotwired/stimulus";
import { Turbo } from "@hotwired/turbo-rails";

export default class extends Controller {
  static targets = ["image", "placeholder"];

  connect() {
    // Initially hide the image and show the placeholder
    this.imageTarget.style.display = "none";
  }

  imageLoaded() {
    // Hide the placeholder and show the full image once it's loaded
    this.placeholderTarget.style.display = "none";
    this.imageTarget.style.display = "block";

    // // Optionally, you can trigger a Turbo Stream action if needed
    // const turboStreamAction = Turbo.stream.replace(this.element, {
    //   target: this.element.id,
    //   html: this.imageTarget.outerHTML,
    // });
    // Turbo.navigator.history.push(turboStreamAction);
  }
}
