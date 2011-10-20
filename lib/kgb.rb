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

      @class.capture :methods => @class.instance_methods(false) do |info|
        @invocations[info.method] ||= 0
        @invocations[info.method] += 1
      end
    end

    def report
      max_length = @invocations.keys.map { |key| key.length }.max
      max_length = 6 if max_length < "method".length

      say
      say "#{@class}:"
      say

      say "method" + " " * (max_length - 2) + "invocations"
      @invocations.sort { |a, b| b[1] <=> a[1] }.each do |method, times|
        say method.to_s + " " * (max_length - method.length + 4) + times.to_s
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
