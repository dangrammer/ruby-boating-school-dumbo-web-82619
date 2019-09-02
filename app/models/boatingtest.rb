class BoatingTest
  attr_reader :student, :instructor
  attr_accessor :test_name, :test_status
  @@all = []

  def initialize(test_name, test_status, student, instructor)
    @student = student
    @instructor = instructor
    @test_name = test_name
    @test_status = test_status
    @@all << self
  end

  def self.all
    @@all
  end

end
