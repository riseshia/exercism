export default {
  sing(start=99, end=0) {
    const array = []
    for(let i = start; i >= end; i--) {
      array.push(this.verse(i))
    }
    return array.join("\n")
  },

  verse(number) {
    switch(number) {
      case 0: 
        return `No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
`
      case 1: 
        return `1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
`
      case 2: 
        return `2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.
`
      default:
        return `${number} bottles of beer on the wall, ${number} bottles of beer.
Take one down and pass it around, ${number - 1} bottles of beer on the wall.
`
    }
  }
}
