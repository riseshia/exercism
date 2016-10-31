class Anagram {
  constructor(string) {
    this.raw = string
    this.chars = this.build(string)
  }

  matches(...strings) {
    const flattened = Array.isArray(strings[0]) ? strings[0] : strings
    return flattened.filter(string => this.isAnagram(string))
  }

  isAnagram(string) {
    if (this.raw.toLowerCase() === string.toLowerCase()) { return false }
    const expected = this.chars
    if (expected.length !== string.length) { return false }
    const actual = this.build(string)

    for(let i = 0; i != expected.length; i++) {
      if (actual[i] !== expected[i]) { return false }
    }

    return true
  }

  build(string) {
    return [...string.toLowerCase()].sort()
  }
}

export default Anagram
