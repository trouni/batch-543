import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ "form" ]

  connect() {
    // data-target is the equivalent of document.querySelector
    this.formTarget.style.height = "0"
    this.formTarget.style.overflow = "hidden"
    this.formTarget.style.transition = "height 0.2s ease-in"
  }

  expandForm(event) {
    event.currentTarget.hidden = true
    this.formTarget.style.height = this.element.dataset.expandedHeight
  }

  submitOnEnter(event) {
    if (event.key === 'Enter' && !event.shiftKey) {
      event.preventDefault()
      this.formTarget.style.height = "0"
      Rails.fire(this.formTarget, 'submit')
    }
  }
}