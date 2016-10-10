const translation = {"C": "G", "G": "C", "A": "U", "T": "A"}
class DnaTranscriber {
  toRna(dna) {
    return dna.split("").map(one => translation[one]).join("")
  }
}

module.exports = DnaTranscriber
