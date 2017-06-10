object SumOfMultiples {
  def sumOfMultiples(factors: Set[Int], limit: Int): Int = {
    (1 until limit) filter(isMultiple(factors) _) sum
  }

  def isMultiple(factors: Set[Int]) (num: Int): Boolean = {
    factors exists { factor: Int => num % factor == 0 }
  }
}

