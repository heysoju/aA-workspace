class Dog
  def initialize
    # dominance score is not explicitly observable
    @secret_dominance_score = rand
  end

  def dominates?(other_dog)
    self.secret_dominance_score > other_dog.secret_dominance_score
  end

  protected
  attr_reader :secret_dominance_score
end

#This way members of the Dog class can access other dominance scores, 
#but they are secret to everyone outside the Dog class.