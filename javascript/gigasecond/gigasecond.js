class gigasecond {
  constructor(date) {
    this.gigasecond = 1000000000000 

    this.date_after_gigasecond = new date(Number(date) + this.gigasecond)
  }

  date() {
    return this.date_after_gigasecond
  }
}

module.exports = gigasecond
