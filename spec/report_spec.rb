require_relative "../lib/file_parser"
require_relative "../lib/report"

RSpec.describe "Report" do
  describe "#display_statistics" do
    it "prints the statistics of a URL" do
      endpoints = Urls.endpoints

      file = FileParser.new(File.expand_path("../test_log.txt", __FILE__))
      file.parse

      result = Report.new(endpoints).display_statistics

      expect(result).to eql(
        endpoints.map do |u|
          puts "*" * 50
          "#{u.method} #{u.uri}"
          puts "*" * 50
          if u.stats.empty?
            puts "No requests made to the URL"
          else
            puts "Requests: #{u.stats.dyno.size}"
            puts "Mean: #{u.stats.response_time.mean}"
            puts "Median: #{u.stats.response_time.median}"
            puts "Mode: #{u.stats.response_time.mode}"
            puts "Popular dyno: #{u.stats.dyno.mode}"
          end
        end
      )
    end
  end
end
