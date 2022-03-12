import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ["section", "button", "garageA", "garageB", "garageC"]
  static values = { currentFacility: String, initialFacility: String }

  connect() {
    this.render();
  }

  render() {
    this.handleSections();
    this.handleButtons();
  }

  get storageCurrentFacility() {
    return window.localStorage.getItem("currentFacility");
  }

  set storageCurrentFacility(value) {
    window.localStorage.setItem("currentFacility", value);
  }

  handleSections() {
    this.sectionTargets.forEach(section => section.classList.add('hidden'));
    const currentSection = this.findCurrentSection();
    currentSection.classList.remove('hidden');
  }

  findCurrentSection() {
    return this.findSectionForFacility(this.currentFacilityValue) ||
      this.findSectionForFacility(this.storageCurrentFacility) ||
      this.findSectionForFacility(this.initialFacilityValue);
  }

  handleButtons() {
    this.buttonTargets.forEach(section => {
      section.classList.remove('current-facility-button');
      section.classList.add('not-current-facility-button');
    });
    const currentButton = this.findCurrentButton();
    currentButton.classList.add('current-facility-button');
    currentButton.classList.remove('not-current-facility-button');
  }

  findCurrentButton() {
    return this.findButtonForFacility(this.currentFacilityValue) ||
         this.findButtonForFacility(this.storageCurrentFacility) ||
         this.findButtonForFacility(this.initialFacilityValue);
  }

  showFacility(event) {
    this.currentFacilityValue = event.target.dataset.showFacility;
    this.storageCurrentFacility = this.currentFacilityValue;
    this.render();
  }

  findSectionForFacility(name) {
    return this.sectionTargets.find(section => {
      return section.dataset.facilitiesTarget.split(' ').includes(name);
    })
  }

  findButtonForFacility(name) {
    return this.buttonTargets.find(button => {
      return button.dataset.facilitiesTarget.split(' ').includes(name);
    })
  }
}
