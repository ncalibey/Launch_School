# easy_207.rb
class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

Cat.new('Cheshire')
puts Cat.cats_count

=begin
- it is a class variable that is incremented by 1 every time there is a new
  instance of the Cat class
=end
