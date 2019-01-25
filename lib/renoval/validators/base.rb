module Renoval
  module Validators
    # Base class for all the validators
    class Base
      def validate(filename)
        errors = []

        File.open(filename, 'r').each_line do |line|
          errors << validate_first_line(filename, line) if line =~/#{types_regex}/
        end

        errors
      end

      def validate_type_line(filename, ticket_line)
        errors = []

        ticket_id = extract_ticket_id(filename)
        errors << 'Ticket definition line does not have the right format' unless ticket_line =~ /#{ticket_line_regex(ticket_id)}/

        errors
      end

      private

      def types_regex
        'Bugs|Improvements|Minor Improvements'
      end

      def validate_first_line(filename, ticket_line)
        line_type = ticket_line.split(':').first
        validator = case line_type
                    when 'Bugs'
                      Renoval::Validators::Bug.new
                    when 'Improvements'
                      Renoval::Validators::Improvement.new
                    when 'Minor Improvements'
                      Renoval::Validators::MinorImprovement.new
                    end
        validator.__send__(:validate_type_line, filename, ticket_line)
      end

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
