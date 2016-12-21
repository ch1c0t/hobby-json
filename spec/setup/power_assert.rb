require 'minitest'
require 'minitest-power_assert'

assert = if ENV['PRY']
  require 'pry'
  require 'awesome_print'

  Module.new do
    def assert &block
      PowerAssert.start Proc.new, assertion_method: __method__ do |pa|
        block.binding.pry unless pa.yield
      end
    end
  end
else
  Minitest::PowerAssert::Assertions
end

Minitest::Assertions.prepend assert
