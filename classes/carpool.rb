# Carpool App Prototype
# Copyright (C) Jace P. Gold
# June 21st, 2019

require 'colorize'

class Carpool

  puts "Carpool class connected".colorize(:green)

  def initialize(name, type)
    @name = name
    @type = type
    @riders = [] # Riders that belong to this exact Carpool
  end # end initialize

  def showDetails
    puts "Name: #{@name}, Type: #{@type}\n"
  end # end showDetails

  def showName 
    print @name
  end # end showName

  def showType
    print @type
  end # end showType

  def rename
    puts "Enter new name: "
    @name = gets.strip
  end # end rename

  # --------
  def carpoolMenu
    puts "\n\n#{@name}, #{@type} | Menu".colorize(:blue)
    puts "1 - Change Name".colorize(:light_blue)
    puts "2 - Change Type".colorize(:light_blue)
    puts "3 - View Riders".colorize(:light_blue)
    puts "4 - Create Rider".colorize(:light_blue)
    puts "8 - Return".colorize(:red)
    selection = gets.strip.to_i

    case selection
      when 1
        changeName()
        carpoolMenu()
      when 2
        changeType()
        carpoolMenu()
      when 3
        displayRiders()
        carpoolMenu();
      when 8
        puts "Leaving #{@name} Menu...".colorize(:green)
        return
    end # end case statement
  end # end carpoolMenu

  def changeName
    oldName = @name
    puts "Change name of #{@name}".colorize(:red)
    @name = gets.strip
    puts "#{oldName} renamed to #{@name}".colorize(:green)
  end # end changeName

  def changeType
    oldType = @type
    puts "Change type of #{@name}".colorize(:red)
    @type = gets.strip
    puts "#{oldType} changed to #{@type}".colorize(:green)
  end # end changeType

  def createRider()
    puts "Creating a New Rider".colorize(:green)
    print "Name: "
    name = gets.strip

    print "Date of Birth: "
    dob = gets.strip

    print "\nGender: "
    gender = gets.strip

    print "\nTeacher: "
    teacher = gets.strip

    print "\nGrade: "
    grade = gets.strip.to_i

    print "\nGaurdian Name: "
    gaurdian = gets.strip

    @riders << Rider.new(name, dob, gender, teacher, grade, gaurdian)

    puts "Rider Created Successfully!".colorize(:green)
  end # end createRider

  def displayRiders

    if (@rider.length == 0)
      puts "There are no riders"
    else {
      @riders.map.with_index { |name, index|
        print "#{index + 1} - "
        name.printName() # print name from the Riders class
      }
    end # end if statement

  end # end displayRiders

end # end class Carpool