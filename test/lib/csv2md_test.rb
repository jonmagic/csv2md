require_relative "../test_helper"

class Csv2mdTest < Minitest::Test
  def test_find_column_widths_returns_array_of_column_widths
    csv = File.read(fixture_path_helper("sample.csv"))
    subject = Csv2md.new(csv: csv)
    assert_equal [12, 5, 14], subject.find_column_widths
  end

  def test_gfm_returns_csv_converted_to_pretty_gfm_table
    csv = File.read(fixture_path_helper("sample.csv"))
    expected = File.read(fixture_path_helper("sample.gfm"))
    subject = Csv2md.new(csv: csv)
    assert_equal expected, subject.gfm
  end
end
