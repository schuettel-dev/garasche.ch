import './index.css'

import { Application, Controller } from "https://unpkg.com/@hotwired/stimulus/dist/stimulus.js"
window.Stimulus = Application.start()

Stimulus.register("ashraf", class extends Controller {
  static targets = ["image", "previousButton", "nextButton"];
  static values = { currentIndex: Number }

  connect() {
    this.render();
  }

  render() {
    this.handleImages();
    this.handleButtons();
  }

  // actions
  previous() {
    if(this.canDecrease) {
      this.currentIndexValue--;
      this.render();
    }
  }

  next() {
    if (this.canIncrease) {
      this.currentIndexValue++;
      this.render();
    }
  }

  // render image
  handleImages() {
    this.hideAllImages();
    this.showCurrentImage();
  }

  hideAllImages() {
    this.imageTargets.forEach(image => image.classList.add('hidden'));
  }

  showCurrentImage() {
    this.imageTargets[this.currentIndexValue].classList.remove('hidden');
  }

  // render buttons
  handleButtons() {
    this.renderButton(this.previousButtonTarget, this.canDecrease());
    this.renderButton(this.nextButtonTarget, this.canIncrease());
  }

  renderButton(button, canShow) {
    if (canShow) {
      button.classList.remove('hidden');
    } else {
      button.classList.add('hidden');
    }
  }

  canDecrease() {
    return this.currentIndexValue > 0;
  }

  canIncrease() {
    return this.currentIndexValue < this.imageTargets.length - 1;
  }
})

Stimulus.register("hours", class extends Controller {
  connect() {
    const weekday = new Date().toLocaleString('en-US', { weekday: 'short', timeZone: 'Europe/Zurich' });
    this.element.querySelectorAll(`.${weekday.toLowerCase()}`).forEach((element) => element.classList.add('highlighted'));

  }
})
