class School
  def initialize
    @students = {}
  end

  def students(grade)
    @students.fetch(grade, [])
  end

  def add(name, grade)
    students_in_grade = students(grade)
    students_in_grade << name
    @students[grade] = students_in_grade.sort
    true
  end

  def students_by_grade
    @students.map do |grade, students|
      { grade: grade, students: students }
    end.sort_by { |el| el[:grade] }
  end
end

module BookKeeping
  VERSION = 3
end
