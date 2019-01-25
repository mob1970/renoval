module Renoval
  module Validators
    # Base class for all the validators
    class Bug < Base
      def validate_type_line(filename, ticket_line)
        errors = []
        ticket_id = extract_ticket_id(filename)
        errors << 'Bug must be an AC ticket' unless ticket_id =~ /AC-.+/

        errors.concat(super)
      end

      private

      def validator_type
        'Bug'
      end
    end
  end
end
