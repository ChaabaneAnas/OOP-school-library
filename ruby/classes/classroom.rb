class Classroom
  attr_accessor :label

  def intialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student)
    student.Classroom = self
  end
end
