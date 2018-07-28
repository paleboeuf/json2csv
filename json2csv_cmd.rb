require_relative 'lib/json2csv'

# MAIN
if __FILE__ == $0

  if ARGV.size != 2
    raise('Wrong args : ruby json2csv_cmd.rb input.json output.json')
  end

  converter = Json2Csv.new()
  converter.convert_file(ARGV[0], ARGV[1])

end