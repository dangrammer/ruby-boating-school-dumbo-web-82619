class Student
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_boating_test(test_name, test_status, instructor)
    BoatingTest.new(test_name, test_status, self, instructor)
  end

  def self.find_student(student_name)
    self.all.find do |student|
      student.name == student_name
    end
  end

  def boating_tests
    BoatingTest.all.select do |boat_test|
      boat_test.student == self
    end
  end

  def grade_percentage
    passing_tests = self.boating_tests.select {|boat_test| boat_test.test_status == "passed"}
    (passing_tests.count.to_f / self.boating_tests.count) * 100
  end

end
