require "csv"

class Csv2md
  class UnableToParseCsv < StandardError; end

  def initialize(input)
    @input = input
  end

  attr_reader :input

  def find_column_widths
    parsed_csv.inject(Array.new(parsed_csv[0].length, 0)) do |result, line|
      line.each_with_index do |column, i|
        if column.to_s.length > result[i]
          result[i] = column.length
        end
      end

      result
    end
  rescue
    raise UnableToParseCsv
  end

  def gfm
    result = ""
    widths = find_column_widths
    number_of_columns = widths.length

    parsed_csv.each_with_index do |line, row_index|
      line.each_with_index do |column, column_index|
        result += "| "
        result += column.to_s.ljust(widths[column_index] + 1, " ")
        if column_index == number_of_columns - 1
          result += "|\n"
        end
      end
      if row_index == 0
        widths.each do |width|
          result += "|".ljust(width + 3, "-")
        end
        result += "|\n"
      end
    end

    result
  end

  def csv
    result = input.split("\n").map do |line|
      row = line.scan(/\|([^\|]*)\s/).flatten.map(&:strip).join(",")
      row unless row.strip == ""
    end.compact.join("\n")
    result += "\n"
    result
  end

  private

  def parsed_csv
    @parsed_csv ||= CSV.parse(input)
  end
end
