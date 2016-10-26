class PhoneNumber {
  constructor(string) {
    const filteredNumber = this.filterNumber(string)

    if (filteredNumber.length == 10) {
      this._number = filteredNumber
    } else if (filteredNumber.length == 11 && filteredNumber[0] == "1") {
      this._number = filteredNumber.slice(1, 11)
    } else {
      this._number = "0000000000"
    }
  }

  filterNumber(string) {
    return [...string].filter((char) => {
             switch(char) {
               case "(":
               case ")":
               case " ":
               case "-":
               case ".":
                 return false
               default:
                 return true
             }
           }).join("")
  }

  number() {
    return this._number
  }

  areaCode() {
    return this._number.slice(0, 3)
  }

  first() {
    return this._number.slice(3, 6)
  }

  last() {
    return this._number.slice(6, 10)
  }

  toString() {
    return `(${this.areaCode()}) ${this.first()}-${this.last()}`
  }
}

export default PhoneNumber
