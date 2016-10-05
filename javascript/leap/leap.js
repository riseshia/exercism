class Year {
  constructor(year) {
    this.isDividedBy4 = year % 4 == 0
    this.isDividedBy100 = year % 100 == 0
    this.isDividedBy400 = year % 400 == 0
  }

  isLeap() {
    return this.isDividedBy4 && (this.isDividedBy400 || !isDividedBy100)
  }
}

module.exports = Year
