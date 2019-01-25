require 'spec_helper'

describe Renoval::Validators::Dependency do
  describe '#validate_type_line' do
    context 'Ticket with invalid format' do
      let(:line) { '[S1PRT-1111] - Test ticket' }

      it 'must return the right error' do
        errors = subject.validate_type_line('S1PRT-1111.yml', line)
        expect(errors).to include('Ticket definition line does not have the right format')
      end
    end

    context 'Ticket with valid format' do
      let(:line) { 'Dependencies: "[S1PRT-1111](https://jira.sage.com/browse/S1PRT-1111) - Test ticket"' }

      it 'must return the right error' do
        errors = subject.validate_type_line('S1PRT-1111.yml', line)
        expect(errors.length).to eq(0)
      end
    end
  end
end
