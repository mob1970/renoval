module Renoval
  module Validators
    # Base class for all the validators
    class Base
      def validate(filename)
      end

      def validate_type_line(filename, ticket_line)
        errors = []

        ticket_id = extract_ticket_id(filename)
        errors << 'Ticket definition line does not have the right format' unless ticket_line =~ /#{ticket_line_regex(ticket_id)}/

        errors
      end

      private

      def ticket_line_regex(ticket_id)
        "#{validator_type}: " + '\"\[' + ticket_id + '\]\(https:\/\/jira.sage.com\/browse\/' + ticket_id + '\) - .+\"'
      end

      def extract_ticket_id(filename)
        filename.split('.').first
      end

      def validator_type
        raise NotImplementedError
      end
    end
  end
end
