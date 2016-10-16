class Words {
  count(string) {
    return string.trim().toLowerCase().split(/\s+/).reduce((dic, word) => {
      dic[word] = Number.isInteger(dic[word]) ? dic[word] + 1 : 1
      return dic
    }, {})
  }
}

export default Words
