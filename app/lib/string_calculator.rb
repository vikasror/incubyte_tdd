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
    return [input, /[,\n]/] unless input.start_with?("//") # Default delimiters if no custom delimiter

    delimiter_string, input = input.split("\n", 2)
    delimiter_sub_str = delimiter_string[2..] # Extract substring after "//"

    delimiter = if delimiter_sub_str.start_with?('[') # Multiple delimiters
                  /#{delimiter_sub_str.scan(/\[(.*?)\]/).flatten.map { |del| Regexp.escape(del) }.join('|')}/
                else # Single custom delimiter
                  Regexp.escape(delimiter_sub_str)
                end

    [input, delimiter]
  end
end
