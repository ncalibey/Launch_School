# easy_207.rb
module PetManagement
  def add_pet(pet)
    pets << pet
  end

  def number_of_pets
    pets.size
  end
end

class Pet
  attr_reader :type, :name

  def initialize(animal, name)
    @type = animal
    @name = name
  end

  def to_s
    "a #{type} named #{name}"
  end
end

class Owner
  include PetManagement

  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def print_pets
    pets.each { |pet| puts pet }
  end
end

class Shelter
  include PetManagement

  attr_reader :owners, :pets, :name

  def initialize(name)
    @name = name
    @pets = []
    @owners = []
  end

  def adopt(owner, pet)
    owner.add_pet(pet)
    owners << owner if owners.include?(owner) == false
  end

  def print_available_pets
    puts "#{name} has the following unadopted pets:"
    pets.each { |pet| puts pet }
    puts
  end

  def print_adoptions
    owners.each do |owner|
      puts "#{owner.name} has adopted the following pets:"
      owner.print_pets
      puts
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new('The Animal Shelter')
shelter.add_pet(asta)
shelter.add_pet(laddie)
shelter.add_pet(fluffy)
shelter.add_pet(kat)
shelter.add_pet(ben)
shelter.add_pet(chatterbox)
shelter.add_pet(bluebell)

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

shelter.print_available_pets
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "#{shelter.name} has #{shelter.number_of_pets} unadopted pets."
