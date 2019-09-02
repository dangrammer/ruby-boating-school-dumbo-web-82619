class Instructor
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def boating_tests
    BoatingTest.all.select do |test|
      test.instructor == self
    end
  end

######## Code below needs to be DRYed out ########

  def pass_student(_student, _test)
    check_test = self.boating_tests.find {|boat_test| boat_test.student == _student && boat_test.test_name == _test}
    if check_test == nil
      BoatingTest.new(_test, "passed", _student, self)
    else
      check_test.test_status = "passed"
    end
  end

  def fail_student(_student, _test)
    check_test = self.boating_tests.find {|boat_test| boat_test.student == _student && boat_test.test_name == _test}
    if check_test == nil
      BoatingTest.new(_test, "failed", _student, self)
    else
      check_test.test_status = "failed"
    end
  end
      
end
