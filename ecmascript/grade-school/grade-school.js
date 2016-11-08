export default class School {
  constructor() {
    this._roster = {}
  }

  roster() {
    return JSON.parse(JSON.stringify(this._roster))
  }

  add(name, grade) {
    const names = this._roster[grade] || []
    names.push(name)
    this._roster[grade] = names.sort()
  }

  grade(grade) {
    return (this._roster[grade] || []).slice()
  }
}
