# frozen_string_literal: true

require 'rails_helper'
require 'string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    it 'output should be 0 for an empty string' do
      expect(subject.add("")).to eq(0)
    end
  end
end
