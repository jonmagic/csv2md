Gem::Specification.new do |spec|
  spec.name        = "csv2md"
  spec.version     = "1.0.0"
  spec.date        = "2015-04-29"
  spec.summary     = "Convert csv into a GitHub Flavored Markdown table"
  spec.description = "Convert csv into a GitHub Flavored Markdown table"
  spec.authors     = ["Jonathan Hoyt"]
  spec.email       = "jonmagic@gmail.com"
  spec.files       = ["lib/csv2md.rb"]
  spec.homepage    = "https://github.com/jonmagic/csv2md"
  spec.license     = "MIT"
  spec.executables << "csv2md"

  spec.add_development_dependency "rake",     "~> 10.4"
  spec.add_development_dependency "minitest", "~> 5.6"
end
