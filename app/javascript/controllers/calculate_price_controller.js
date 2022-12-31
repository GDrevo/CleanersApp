import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calculate-price"
export default class extends Controller {
  static targets = ["bedroom", "bathroom", "size", "cleaning", "estimatedtime", "estimatedprice"]

  connect() {
  }

  calculateprice() {
    // console.log(this.estimatedpriceTarget)
    let estimatedprice = 0
    // let bedroomprice = this.bedroom()
    console.log(this.bedroom())
    // console.log(estimatedprice)
    // this.estimatedpriceTarget.innerHTML = estimatedprice
  }

  bedroom() {
    this.bedroomTargets.forEach(target => {
      if (target.checked) {
        if (target.value == "Studio") {
          console.log(0)
          return 0
        }
        if (target.value == "1") {
          console.log(10)
          return 10
        }
        if (target.value == "2") {
          console.log(20)
          return 20
        }
        if (target.value == "3") {
          console.log(30)
          return 30
        }
        if (target.value == "4") {
          console.log(40)
          return 40
        }
        if (target.value == "5") {
          console.log(50)
          return 50
        }
      }
    });
  }

  bathroom(event) {
    if (event.srcElement.value == "1") {
      return 0
    }
    if (event.srcElement.value == "2") {
      return 25
    }
    if (event.srcElement.value == "3") {
      return 50
    }
    if (event.srcElement.value == "4") {
      return 80
    }
    if (event.srcElement.value == "5") {
      return 120
    }
    if (event.srcElement.value == "6+") {
      return 150
    }
    return 0
  }

  size(event) {
    if (event.srcElement.value == "0 < 25m²") {
      return 0
    }
    if (event.srcElement.value == "25 < 35") {
      return 25
    }
    if (event.srcElement.value == "35 < 55") {
      return 50
    }
    if (event.srcElement.value == "55 < 80") {
      return 75
    }
    if (event.srcElement.value == "80 < 120") {
      return 100
    }
    if (event.srcElement.value == "120m² +") {
      return 125
    }
    return 0
  }

  cleaning(event) {
    if (event.srcElement.value == "Standard") {
      return 50
    }
    if (event.srcElement.value == "Standard +") {
      return 100
    }
    if (event.srcElement.value == "Deep") {
      return 250
    }
    return 0
  }
}
