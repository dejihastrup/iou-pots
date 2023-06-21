import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="instructions-animation"
export default class extends Controller {
  static targets = [
    "create",
    "add",
    "pay"
  ]

  connect() {
    const animationElements = [this.createTarget, this.addTarget, this.payTarget]

    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add("animate")
        } else {
          entry.target.classList.remove("animate")
        }
      })
    },
    {
      threshold: 0.8
    })

    for (let i = 0; i < animationElements.length; i++) {
      const el = animationElements[i];
      observer.observe(el);
    }
  }
}
