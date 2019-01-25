require 'spec_helper'

describe Renoval::Validators::Base do
  describe '#validate' do
    let(:content) {}
      let(:type) {}
      let(:klass) { double(type) }

    before :each do
      allow(File).to receive(:open).with(anything, 'r').and_return(content)
    end

    context 'bug' do
      let(:type) { 'Bug' }
      let(:content) { "Bugs: [AC-1111]()https://jira.sage.com/browse/AC-1111 - Test text" }

    before :each do
      allow(Renoval::Validators::Bug).to receive(:new).and_return(klass)
    end

      it 'uses the Bug class' do
        expect(klass).to receive(:validate_type_line)
        subject.validate('AC-1111.yml')
      end
    end

    context 'improvement' do
      let(:klass) { double('Improvement') }
      let(:content) { "Improvements: [S1PRT-1111]()https://jira.sage.com/browse/S1PRT-1111 - Test text" }

    before :each do
      allow(Renoval::Validators::Improvement).to receive(:new).and_return(klass)
    end

      it 'uses the Improvement class' do
        expect(klass).to receive(:validate_type_line)
        subject.validate('S1PRT-1111.yml')
      end
    end

    context 'minor improvement' do
      let(:klass) { double('Minor Improvement') }
      let(:content) { "Minor Improvements: [S1PRT-1111]()https://jira.sage.com/browse/S1PRT-1111 - Test text" }

    before :each do
      allow(Renoval::Validators::MinorImprovement).to receive(:new).and_return(klass)
    end

      it 'uses the MinorImprovement class' do
        expect(klass).to receive(:validate_type_line)
        subject.validate('S1PRT-1111.yml')
      end
    end
  end
end
