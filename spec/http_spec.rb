require 'helper'

describe Hobby::JSON do
  Dir['spec/http/*.yml'].each do |file|
    test = Hobby::Test.new file
    describe test do
      include AppRunning
      it 'works' do
        assert { @report.ok? }
      end
    end
  end
end
