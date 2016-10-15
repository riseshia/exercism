function isLeapYear(year) {
  const isDividedBy4 = year % 4 == 0
  const isDividedBy100 = year % 100 == 0
  const isDividedBy400 = year % 400 == 0
 
  return isDividedBy4 && (isDividedBy400 || !isDividedBy100)
}

export default isLeapYear
