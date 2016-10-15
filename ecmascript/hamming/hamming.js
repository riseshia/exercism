class Hamming {
  compute(stringA, stringB) {
    if (stringA.length != stringB.length) {
      throw new Error('DNA strands must be of equal length.')
    }

    return stringA.split("").reduce((sum, value, index) => {
      if(value == stringB.charAt(index)) {
        return sum
      } else {
        return sum + 1
      }
    }, 0)
  }
}

export default Hamming
