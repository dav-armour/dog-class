# Run 'gem install geocoder'
require 'geocoder'

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
    geocode = Geocoder.search(location).first
    @walks << {
      :location => location,
      :distance => distance,
      :time => Time.now.strftime("%d/%m/%Y %I:%M%p"),
      :geocode => geocode
    }
    self
  end

  def display_walks
    walk_count = @walks.length
    puts "I have been for #{walk_count} walks today"
    @walks.each do |walk_hash|
      output = "Time: #{walk_hash[:time]}".ljust(30)
      output += "Distance: #{walk_hash[:distance]}km".ljust(20)
      output += "Location: #{walk_hash[:location]}".ljust(20)
      output += "#{walk_hash[:geocode].coordinates}"
      puts output
    end
  end

  def total_distance
    @walks.sum { |h| h[:distance] }
  end

end

oldDog = Dog.new("Jester", 12, "Sydney")
oldDog.speak
puts "#{oldDog.name} is from #{oldDog.location}"
oldDog.walk('Sydney', 20)
oldDog.walk('Sydney', 5)
oldDog.walk('Brisbane', 30)
oldDog.display_walks
puts "Total Distance: #{oldDog.total_distance}km"
