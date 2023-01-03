import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calculate-price"
export default class extends Controller {
  static targets = ["bedroom", "bathroom", "size", "cleaning", "estimatedtime", "estimatedprice", "sumbed", "sumbat", "sumtyp", "sumtim", "sumnum", "sumdat", "sumhou", "sumtot"]

  connect() {
    this.calculateestimation()
  }

  calculateestimation() {
    const estimatedprice = this.bedroomprice() + this.bathroomprice() + this.sizeprice() + this.cleaningprice()
    this.estimatedpriceTarget.innerHTML = estimatedprice + "€"
    this.sumtotTarget.innerHTML = estimatedprice + "€"
    const estimatedtime = this.bedroomtime() + this.bathroomtime() + this.sizetime() + this.cleaningtime()
    this.estimatedtimeTarget.innerHTML = estimatedtime + "hr(s)"
    this.sumtimTarget.innerHTML = estimatedtime + "hr(s)"
  }

  bedroomprice() {
    const selected = this.bedroomTargets.find(function (target) {
      return target.checked
    })
    if (selected.value == "Studio") {
      return 0
    }
    if (selected.value == "1") {
      return 10
    }
    if (selected.value == "2") {
      return 20
    }
    if (selected.value == "3") {
      return 30
    }
    if (selected.value == "4") {
      return 40
    }
    if (selected.value == "5") {
      return 50
    }
  }

  bedroomtime() {
    const selected = this.bedroomTargets.find(function (target) {
      return target.checked
    })
    if (selected.value == "Studio") {
      return 0
    }
    if (selected.value == "1") {
      return 0.5
    }
    if (selected.value == "2") {
      return 1
    }
    if (selected.value == "3") {
      return 1.5
    }
    if (selected.value == "4") {
      return 2
    }
    if (selected.value == "5") {
      return 3
    }
  }

  bathroomprice() {
    const selected = this.bathroomTargets.find(function (target) {
      return target.checked
    })
    if (selected.value == "1") {
      return 0
    }
    if (selected.value == "2") {
      return 25
    }
    if (selected.value == "3") {
      return 50
    }
    if (selected.value == "4") {
      return 80
    }
    if (selected.value == "5") {
      return 120
    }
    if (selected.value == "6+") {
      return 150
    }
  }

  bathroomtime() {
    const selected = this.bathroomTargets.find(function (target) {
      return target.checked
    })
    if (selected.value == "1") {
      return 0
    }
    if (selected.value == "2") {
      return 0.5
    }
    if (selected.value == "3") {
      return 1
    }
    if (selected.value == "4") {
      return 1.5
    }
    if (selected.value == "5") {
      return 2
    }
    if (selected.value == "6+") {
      return 2.5
    }
  }

  sizeprice() {
    const selected = this.sizeTargets.find(function (target) {
      return target.checked
    })
    if (selected.value == "0 < 25m²") {
      return 0
    }
    if (selected.value == "25 < 35") {
      return 10
    }
    if (selected.value == "35 < 55") {
      return 20
    }
    if (selected.value == "55 < 80") {
      return 30
    }
    if (selected.value == "80 < 120") {
      return 40
    }
    if (selected.value == "120m² +") {
      return 50
    }
  }

  sizetime() {
    const selected = this.sizeTargets.find(function (target) {
      return target.checked
    })
    if (selected.value == "0 < 25m²") {
      return 0
    }
    if (selected.value == "25 < 35") {
      return 0.5
    }
    if (selected.value == "35 < 55") {
      return 1
    }
    if (selected.value == "55 < 80") {
      return 1.5
    }
    if (selected.value == "80 < 120") {
      return 2
    }
    if (selected.value == "120m² +") {
      return 2.5
    }
  }

  cleaningprice() {
    const selected = this.cleaningTargets.find(function (target) {
      return target.checked
    })
    if (selected.value == "Standard") {
      return 50
    }
    if (selected.value == "Standard +") {
      return 100
    }
    if (selected.value == "Deep") {
      return 250
    }
  }

  cleaningtime() {
    const selected = this.cleaningTargets.find(function (target) {
      return target.checked
    })
    if (selected.value == "Standard") {
      return 2
    }
    if (selected.value == "Standard +") {
      return 5
    }
    if (selected.value == "Deep") {
      return 8
    }
  }
}
