require_relative "file_parser"
require_relative "report"

class LogAnalyser
  endpoints = Urls.endpoints

  file = FileParser.new(File.expand_path("../../log.txt", __FILE__))
  file.parse

  Report.new(endpoints).display_statistics
end
