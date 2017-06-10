object Bob {
  def response(statement: String): String = {
    val stripedStmt = statement trim

    if (stripedStmt isEmpty) {
      "Fine. Be that way!"
    } else if (stripedStmt.toUpperCase == stripedStmt &&
               stripedStmt.toLowerCase != stripedStmt) {
      "Whoa, chill out!"
    } else if (stripedStmt endsWith "?") {
      "Sure."
    } else {
      "Whatever."
    }
  }
}
