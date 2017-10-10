require_relative "urls"

class FileParser
  attr_accessor :file_path
  
  PLACEHOLDER = "{user_id}"

  def initialize file_path
    @file_path = file_path
  end

  def parse
    contents = IO.readlines(File.open(@file_path))

    contents.each do |line|
      data = lines_to_hash(line)
      u = Urls.get(data["path"].sub(/\d+/, PLACEHOLDER), data["method"])
      next if u.nil?

      (u.stats.dyno ||= []) << data["dyno"]
      (u.stats.response_time ||= []) << data["connect"].to_i + data["service"].to_i
    end
  end

  def lines_to_hash line
    Hash[line.split.map { |a| a.split('=') }]
  end
end
