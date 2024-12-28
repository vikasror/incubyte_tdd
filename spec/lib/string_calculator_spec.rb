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

    it 'returns the sum of all the comma separated numbers' do
      expect(subject.add("1,2,3,4")).to eq(10)
    end

    it 'returns the sum of all the numbers with new lines between numbers (instead of commas)' do
      expect(subject.add("1\n2,3")).to eq(6)
    end

    it 'returns the sum of all the numbers with new lines between numbers (instead of commas)' do
      expect(subject.add("1\n2,\n3,2")).to eq(8)
    end

    it 'support different delimiters(;)' do
      expect(subject.add("//;\n1;2")).to eq(3)
    end

    it 'support different delimiters(:)' do
      expect(subject.add("//:\n1:2:6")).to eq(9)
    end

    it 'throw an exception with a negative number' do
      expect { subject.add("1,-5") }.to raise_error("negative numbers not allowed -5")
    end

    it 'throw an exception with a negative numbers' do
      expect { subject.add("//;\n1;2;-3;-7") }.to raise_error("negative numbers not allowed -3, -7")
    end

    it 'numbers bigger than 1000 should be ignored' do
      expect(subject.add("2,1001")).to eq(2)
    end

    it 'support any length with delimiters(//[delimiter]\n)' do
      expect(subject.add("//[***]\n1***2***3")).to eq(6)
    end

    it 'allow multiple delimiters like this: (//[delim1][delim2]\n)' do
      expect(subject.add("//[*][%]\n1*2%3")).to eq(6)
    end
  end
end
