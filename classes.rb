class Dog
  attr_accessor :name, :age, :location, :walks
  def initialize(name, age, location)
    @name = name
    @age = age
    @location = location
    @walks = []
  end

  def speak
    puts "#{@name} says woof!"
    self
  end

  def walk(location, distance)
    @walks << { :location => location, :distance => distance, :time => Time.now }
    self
  end

  def display_walks(location = nil)
    counter = 0
    distance = 0
    @walks.each do |walkHash|
      if walkHash[:location] == location || location == nil
        counter += 1
        distance += walkHash[:distance]
      end
    end
    output = "I have been for #{counter} walks and traveled #{distance}km"
    output += " at #{location.capitalize}" if location
    puts output
    self
  end

  # def display_walks2(location = nil)
  #   counter = @walks.count { |h| h[:location] == location }
  #   distance = @walks.sum { |h| h[:location] == location ? h[:distance] : 0 }
  #   output = "I have been for #{counter} walks and traveled #{distance}km"
  #   output += " at #{location.capitalize}" if location
  #   puts output
  #   self
  # end

  def total_distance
    @walks.sum { |h| h[:distance] }
  end

end

oldDog = Dog.new("Jester", 12, "Sydney")
oldDog.speak
puts oldDog.location
oldDog.walk('sydney', 20)
oldDog.walk('sydney', 5)
oldDog.walk('brisbane', 30)
oldDog.display_walks('sydney')
oldDog.display_walks('brisbane')
oldDog.display_walks
# oldDog.display_walks2('sydney')
# oldDog.display_walks2('brisbane')
# oldDog.display_walks2
puts "Total Distance: #{oldDog.total_distance}km"
# oldDog.walk.walk.display_walks
