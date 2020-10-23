# frozen_string_literal: true

module Cars
  module DefectsProbability
    MAX_PROBABILITY_RATE = 0.8

    extend self

    def build
      distribution = Car::PARTS.index_with { |_part| part_defect_probability }

      Result.new(distribution)
    end

    private

    def part_defect_probability
      rand(0.01..0.2).round(2)
    end

    Result = Struct.new(:distribution) do
      def defect_found?
        MAX_PROBABILITY_RATE < distribution.values.sum
      end

      def defected_part
        distribution.max_by { |_k, v| v }[0]
      end
    end
  end
end
