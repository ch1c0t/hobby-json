if defined? Mutant::CLI
  module Mutant
    class Selector::Expression
      def call _subject
        integration.all_tests
      end
    end
  end
end
