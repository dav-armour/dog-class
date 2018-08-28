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
    @walks << { :location => location, :distance => distance, :time => Time.now.strftime("%d/%m/%Y %I:%M%p") }
    self
  end

  def display_walks
    walk_count = @walks.length
    puts "I have been for #{walk_count} walks today"
    @walks.each do |walk_hash|
      output = "Time: #{walk_hash[:time]}".ljust(30)
      output += "Location: #{walk_hash[:location]}".ljust(25)
      output += "Distance: #{walk_hash[:distance]}km"
      puts output
    end
  end

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
oldDog.display_walks
puts "Total Distance: #{oldDog.total_distance}km"
