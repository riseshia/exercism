const names = []
const alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
const number = "0123456789"

function random(max) {
    return Math.floor(Math.random() * (max - 1));
}

class Robot {
  constructor() {
    this._name = Robot.newName()
  }

  reset() {
    this._name = Robot.newName()
  }

  get name() {
    return this._name
  }

  static newName() {
    let name = Robot.generateName()

    while(names.indexOf(name) != -1) {
      name = Robot.generateName()
    }
    names.push(name)
    return name
  }

  static generateName() {
    let name = ""
    name += alphabet[random(26)]
    name += alphabet[random(26)]
    name += number[random(10)]
    name += number[random(10)]
    name += number[random(10)]
    return name 
  }
}

export default Robot
