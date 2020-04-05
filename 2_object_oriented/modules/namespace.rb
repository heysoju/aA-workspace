module A
  def self.make_bacon
    ...
  end
end

module B
  def self.make_bacon
    ...
  end
end

require "A"
require "B"

a_grade_bacon = A.make_bacon
b_grade_bacon = B.make_bacon