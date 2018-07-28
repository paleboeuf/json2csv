require 'json'
require 'csv'
require 'logger'

# Class to convert JSON to CSV
class Json2Csv
  attr_reader :logger
  protected :logger

  # Constructor to initialize logger
  def initialize(logger_level = Logger::WARN)
    @logger = Logger.new(STDOUT)
    @logger.level = logger_level
  end

  # Recursive method for flatten hash object to string
  # Inputs :
  #  - obj : object to flatten
  #  - properties : will contain the path properties
  #  - results : will contain the object values
  #  - parent : to keep properties path in recursion
  def flatten_hash_object(obj, properties, result, parent = nil)
    obj.each do |key, data|
      org_parent = parent

      # Handle properties path
      if parent.nil?
        parent = key.to_s
      elsif
      parent = parent + '.' + key.to_s
      end

      # Handle data type
      if data.kind_of?(Hash)
        flatten_hash_object(data, properties, result, parent)
      elsif data.kind_of?(Array)
        @logger.debug(parent.to_s + ':"' +data.join(',') + '"')
        properties << parent.to_s
        result << data.join(',')
      else
        @logger.debug(parent.to_s + ':' +data.to_s)
        properties << parent.to_s
        result << data.to_s
      end
      parent = org_parent
    end
  end
  protected :flatten_hash_object

  # Iterate JSON object and flatten them, if not all objects have the same properties, raise an exception
  # Inputs :
  #   - json_str : JSON string
  #   - headers : will contain all object path properties
  #   - rows : will contain all objects values
  def convert_str(json_str, headers, rows)
    # Convert JSON to Hash
    data_hash = JSON.parse(json_str)

    # For all objects flatten them
    data_hash.each do |obj|
      row_headers = []
      row = []
      flatten_hash_object(obj, row_headers, row)
      headers << row_headers
      rows << row
    end

    # Verify that all object have same properties
    headers.each do |header|
      if headers[0] != header
        raise('All objects MUST have the same properties')
      end
    end

  end

  # Wrapper of convert_str method with JSON input file and CSV output file
  # Inputs :
  #   - input_file : path of the JSON file
  #   - output_file : path of the CSV file
  def convert_file(input_file, output_file)

    # Read the file
    data_json = File.read(input_file)

    # Array of all objects path properties
    headers = []
    # Array of all objects values
    rows = []
    convert_str(data_json, headers, rows)

    # Write data to CSV
    CSV.open(output_file, "w") do |csv|
      csv << headers[0]
      rows.each do |row|
        csv << row
      end
    end

  end

end
