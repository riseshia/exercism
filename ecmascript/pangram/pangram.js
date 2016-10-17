class Pangram {
  constructor(string) {
    const set = new Set(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
                         "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
                         "w", "x", "y", "z"])
    const chars = [...string.toLowerCase()]
    chars.forEach(el => set.delete(el))
    this.remainedSet = set
  }

  isPangram() {
    if (this.remainedSet.size === 0) {
      return true
    }
    return false
  }
}

export default Pangram

