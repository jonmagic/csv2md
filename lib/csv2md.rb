require "csv"

class Csv2md
  class UnableToParseCsv < StandardError; end

  # Public: Public interface to Csv2md converter.
  #
  # csv - String csv formatted data.
  #
  # Returns a String.
  def self.convert_csv_to_gfm(csv)
    new(csv: csv).gfm
  end

  def initialize(csv:)
    @csv = csv
  end

  attr_reader :csv

  def find_column_widths
    parsed_csv.inject(Array.new(parsed_csv[0].length, 0)) do |result, line|
      line.each_with_index do |column, i|
        if column.length > result[i]
          result[i] = column.length
        end
      end

      result
    end
  rescue
    raise UnableToParseCsv
  end

  def parsed_csv
    @parsed_csv ||= CSV.parse(csv)
  end

  def gfm
    result = ""
    widths = find_column_widths
    number_of_columns = widths.length
    total_width = widths.inject(0) {|sum, n| sum += n } + widths.length * 2

    parsed_csv.each_with_index do |line, row_index|
      line.each_with_index do |column, column_index|
        result += "| "
        result += column.ljust(widths[column_index] + 1, " ")
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
end
