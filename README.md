# CSV to GitHub Flavored Markdown Table Converter

Convert [csv formatted data](http://en.wikipedia.org/wiki/Comma-separated_values) to a [GitHub Flavored Markdown table](https://help.github.com/articles/github-flavored-markdown/#tables).

## Installation

```bash
$ gem install csv2md
Successfully installed csv2md-1.0.0
1 gem installed
```

## Usage

```bash
$ csv2md
Usage: csv2md [options] results.csv
       cat results.csv | csv2md [options]

Options:
    -r Reverses conversion, takes a GitHub Flavored
       Markdown table as input and outputs csv.

$ cat foo.csv
Name,Title,Email Address
Jane Atler,CEO,jane@acme.com
John Doherty,CTO,john@acme.com
Sally Smith,CFO,sally@acme.com

$ csv2md foo.csv
| Name         | Title | Email Address  |
|--------------|-------|----------------|
| Jane Atler   | CEO   | jane@acme.com  |
| John Doherty | CTO   | john@acme.com  |
| Sally Smith  | CFO   | sally@acme.com |

$ cat foo.csv | csv2md
| Name         | Title | Email Address  |
|--------------|-------|----------------|
| Jane Atler   | CEO   | jane@acme.com  |
| John Doherty | CTO   | john@acme.com  |
| Sally Smith  | CFO   | sally@acme.com |
```

It supports one option right now, `-r`:

```bash
$ cat foo.csv | csv2md | csv2md -r
Name,Title,Email Address
Jane Atler,CEO,jane@acme.com
John Doherty,CTO,john@acme.com
Sally Smith,CFO,sally@acme.com
```

## Contributors

* [Jonathan Hoyt](https://github.com/jonmagic)
* [Jiri Nemecek](https://github.com/geronime)
* [Will Fitzgerald](https://github.com/willf)

## License

The MIT License (MIT)

Copyright (c) 2015 Jonathan Hoyt

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
