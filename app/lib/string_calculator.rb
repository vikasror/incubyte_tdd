# frozen_string_literal: true
class StringCalculator
  def add(input)
    return 0 if input.empty?

    input, delimiter = fetch_delimiter_and_input(input)

    input_num = input.split(delimiter).map(&:to_i)

    neg_nums = input_num.select { |num| num < 0 }
    raise "negative numbers not allowed #{neg_nums.join(', ')}" if neg_nums.present?

    input_num.reject! { |num| num > 1000 }

    input_num.sum
  end

  private

  def fetch_delimiter_and_input(input)
    if input.start_with?("//") # delimiters type input start with //
      delimiter_string, input = input.split("\n")
      delimiter_sub_str = delimiter_string.split("//").last
      if delimiter_sub_str.start_with?('[') # multiple delimiters pattern
        delimiter = /#{delimiter_string.scan(/\[(.*?)\]/).flatten.map { |d| Regexp.escape(d) }.join('|')}/
      else
        delimiter = /#{delimiter_sub_str}/
      end
    else
      delimiter = /[,\n]/ # default delimiters
    end

    [input, delimiter]
  end
end
