require_relative "../lib/file_parser"

RSpec.describe FileParser do
  before(:each) do
    @f = FileParser.new(File.expand_path("../test_log.txt", __FILE__))
  end

  describe "#initialize" do
    it "initializes with file path" do
      expect(@f.file_path).to eql(File.expand_path("../test_log.txt", __FILE__))
    end
  end

  describe "#parse" do
    it "reads the content of the log file and build statistics" do
      endpoints = Urls.endpoints

      @f.parse

      endpoints.map do |u|
        expect(u.stats).to respond_to(:dyno)
        expect(u.stats).to respond_to(:response_time)

        expect(u.stats.dyno).to be_an_instance_of(Array)
        expect(u.stats.response_time).to be_an_instance_of(Array)

        expect(u.stats.dyno).not_to be_empty
        expect(u.stats.response_time).not_to be_empty
      end
    end
  end
end
