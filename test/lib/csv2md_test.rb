require_relative "../test_helper"

class Csv2mdTest < Minitest::Test
  def test_find_column_widths_returns_array_of_column_widths
    csv = File.read(fixture_path_helper("sample.csv"))
    subject = Csv2md.new(input: csv)
    assert_equal [12, 5, 14], subject.find_column_widths
  end

  def test_find_column_widths_raises_error_with_malformed_data
    csv = File.read(fixture_path_helper("malformed.csv"))
    subject = Csv2md.new(input: csv)
    assert_raises(Csv2md::UnableToParseCsv) do
      subject.find_column_widths
    end
  end

  def test_gfm_returns_csv_converted_to_pretty_gfm_table
    csv = File.read(fixture_path_helper("sample.csv"))
    expected = File.read(fixture_path_helper("sample.md"))
    subject = Csv2md.new(input: csv)
    assert_equal expected, subject.gfm
  end

  def test_csv_returns_gfm_table_converted_to_csv
    md = File.read(fixture_path_helper("sample.md"))
    expected = File.read(fixture_path_helper("sample.csv"))
    subject = Csv2md.new(input: md)
    assert_equal expected, subject.csv
  end
end
