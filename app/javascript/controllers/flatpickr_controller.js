import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  // Inform the controller that it has two targets in the form, which are our inputs
  static targets = [ "startTime", "endTime" ]

  connect() {
    flatpickr(this.startTimeTarget, {
      altInput: true,
      enableTime: true,
      plugins: [new rangePlugin({ input: "#end_time"})]
    })
    flatpickr(this.endTimeTarget, {})
  }
}
