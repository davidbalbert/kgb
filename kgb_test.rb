$:.unshift "lib"
require 'kgb'

class Winston
  def pretend_to_be_a_sheep
    puts "Big Brother knows best"
  end

  def think_for_yourself!
    puts "Freedom is the freedom to say two plus two equals four"
  end
end

KGB.spy_on(Winston)

winston = Winston.new
winston.pretend_to_be_a_sheep
winston.pretend_to_be_a_sheep
winston.pretend_to_be_a_sheep
winston.think_for_yourself!
winston.pretend_to_be_a_sheep
