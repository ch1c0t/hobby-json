require 'hobby'
require 'hobby/json'
require 'hobby/test'
require 'puma'

require_relative 'setup/power_assert'
require_relative 'setup/mutant'

SOURCE = IO.read 'spec/apps/echo.rb'

module AppRunning
  def self.included group
    group.class_eval do
      before :each do |example|
        @socket = "app.for.#{example}.socket"
        @pid = fork do
          server = Puma::Server.new eval SOURCE
          server.add_unix_listener @socket
          server.run
          sleep
        end

        sleep 0.01 until File.exist? @socket

        test = described_class
        @report = test[@socket]
      end

      after :each do 
        `kill #{@pid}`
      end
    end
  end
end

RSpec.configure do |config|
  config.expect_with :rspec, :minitest

  require 'timeout'
  config.around :each do |example|
    Timeout.timeout 3, &example
  end

  config.after :suite do
    `rm *.socket` unless Dir['*.socket'].empty?
  end
end

