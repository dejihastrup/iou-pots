import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="drop-coins"
export default class extends Controller {
    static targets = ["container"];
    static values = { width: Number };

  connect() {
    this.widthValue = window.innerWidth - 64;
  }

  fall() {
    const left = Math.floor(Math.random() * this.widthValue);
    const img = document.createElement("img");
    img.classList.add("emoji");
    img.style.left = left + "px";
    img.src = "assets/pound-money.png";
    this.containerTarget.appendChild(img);

    const animation = img.animate(
      { top: window.innerHeight + 'px' },
      { duration: 1600 }
    );

    animation.onfinish = () => {
      img.remove();
    };

  }
}
