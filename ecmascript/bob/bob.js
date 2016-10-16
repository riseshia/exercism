//
// This is only a SKELETON file for the 'Bob' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

class Bob {
  hey(msg) {
    if (msg.trim() === "") {
      return "Fine. Be that way!"
    } else if (msg.toLowerCase() !== msg &&
               msg.toUpperCase() === msg) {
      return "Whoa, chill out!"
    } else if (msg.endsWith("?")) {
      return "Sure."
    }
    return "Whatever."
  }
}

export default Bob

