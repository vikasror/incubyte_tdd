# frozen_string_literal: true

require 'rails_helper'
require 'string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    it 'output should be 0 for an empty string' do
      expect(subject.add("")).to eq(0)
    end

    it 'output should be 1 for an 1 string' do
      expect(subject.add("1")).to eq(1)
    end

    it 'output the number itself if only one input is given' do
      expect(subject.add("2")).to eq(2)
    end

    it 'output the sum of two numbers separated by a comma' do
      expect(subject.add("1,5")).to eq(6)
    end
  end
end
