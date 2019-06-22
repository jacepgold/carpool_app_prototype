# Carpool App Prototype
# Copyright (C) Jace P. Gold
# June 21st, 2019

require 'colorize'

class Rider
  
  def initialize(name, dob, gender)
    @name = name
    @dob = dob
    @active = true
  end # end initialize

  def printName
    print @name
  end # end printName

  def printDOB
    print @dob
  end # end printDOB

  def printGender
    print @gender
  end # end printGender

end # end class Rider