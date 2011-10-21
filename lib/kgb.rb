require "kgb/version"
require 'rcapture'

module KGB
  def self.spy_on(*classes)
    @agents ||= []
    classes.each do |klass|
      @agents << Agent.new(klass)
    end

    nil
  end

  def self.print_reports
    @agents.each { |agent| agent.report }
  end


  class Agent
    def initialize(klass)
      @invocations = {}

      @class = klass
      @class.class_eval do
        include RCapture::Interceptable
      end

      @class.capture :methods => @class.instance_methods do |info|
        @invocations[info.method] ||= 0
        @invocations[info.method] += 1
      end
    end

    PADDING = 4

    def report
      say
      say "#{@class}:"
      say

      if @invocations.size > 0
        max_length = @invocations.keys.map { |key| key.length }.max
        max_length = 6 if max_length < "method".length

        say "method" + " " * (max_length - 6 + PADDING) + "invocations"
        @invocations.sort { |a, b| b[1] <=> a[1] }.each do |method, times|
          say method.to_s + " " * (max_length - method.length + PADDING) + times.to_s
        end
      end
    end
  end
end

END {
  KGB.print_reports
}

def say(*args)
  STDERR.puts(*args)
end
