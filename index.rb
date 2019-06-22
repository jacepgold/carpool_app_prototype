# Carpool App Prototype
# Copyright (C) Jace P. Gold
# June 21st, 2019

require 'pry'
require 'colorize'
require_relative './classes/carpool.rb'

@carpools = [
  Carpool.new('Spectrum Academy NSL', 'School'),
  Carpool.new('Spectrum Academy PG', 'School')
] # Temp storage since there is no DB

@selected = nil # Carpool selected
#----------------------------------------------

puts "Carpool Application Loaded Successfully".colorize(:green)

def mainMenu
  puts "\n\nWelcome to Carpool Prototype. Choose a selection...".colorize(:blue)
  puts "1. Create Carpool".colorize(:light_blue)
  puts "2. List Carpools".colorize(:light_blue)
  puts "3. Access Carpool".colorize(:light_blue)
  puts "4. Exit".colorize(:red)

  selection = gets.strip.to_i
  puts "\n\n"

  case selection
    when 1
      # Create a new instance of the Carpool class
      createCarpool()
    when 2
      # List All Carpools
      listCarpools()
      mainMenu()
    when 3
      # Access a Carpool
      puts "Select a Carpool".colorize(:green)
      listCarpools()
      selected = gets.strip.to_i
      selected = selected - 1
      puts "#{@carpools[selected].showName} Selected"

      # Go into the Carpool class
      @carpools[selected].carpoolMenu()
      mainMenu()
    when 4
      # Exit the program
      puts "Goodbye".colorize(:green)
      exit
  end # end case statement

end # end mainMenu

# Create a new Carpool instance
def createCarpool
  puts "Create a New Carpool"
  print "Name: "
  name = gets.strip

  print "Type (school, personal, work): "
  type = gets.strip

  puts "\n\n"
  @carpools << Carpool.new(name, type)
  puts "Creating carpool #{name}"

  # Back to Main Menu
  mainMenu()
end # end createCarpool

# list all Carpool instances
def listCarpools
  puts "Listing All Carpools"
  # binding.pry
  @carpools.map.with_index { |carpool, index|
    print "#{index + 1} - "
    carpool.showDetails
  }
end # end listCarpools

mainMenu()