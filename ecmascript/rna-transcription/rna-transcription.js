const translation = {C: "G", G: "C", A: "U", T: "A"}

class Transcriptor {
  toRna(dna) {
    return [...dna].map(one => translation[one]).join("")
  }
}

export default Transcriptor

