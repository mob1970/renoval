module Renoval
  module Validators
    # Base class for all the validators
    class Dependency < Base
      private

      def validator_type
        'Dependencies'
      end
    end
  end
end
