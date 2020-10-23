# frozen_string_literal: true

RSpec.describe Cars::DefectsProbability do
  subject(:defects_probability) { described_class }

  describe '.build' do
    it 'returns valid result' do
      result = defects_probability.build

      expect(result).to respond_to(:defect_found?)
      expect(result).to respond_to(:defected_part)
    end
  end
end
