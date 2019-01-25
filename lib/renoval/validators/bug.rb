module Renoval
  module Validators
    # Base class for all the validators
    class Bug
      def validate_type_line(filename, ticket_line)
        errors = []
        ticket_id = extract_ticket_id(filename)

        errors << 'Bug must be an AC ticket' unless ticket_id.match(/\[AC-.+\].+/)
        errors << 'Ticket line does not have the right format' unless ticket_line.match(ticket_line_regex)

        errors
      end

      private

      def validator_type
        'Bug'
      end
    end
  end
end
