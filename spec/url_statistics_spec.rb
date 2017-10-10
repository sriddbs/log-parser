require_relative "../lib/urls"

RSpec.describe "UrlStatistics" do
  describe "#empty?" do
    it "checks if stats is empty based on the value of dyno" do
      @endpoints = Urls.endpoints

      file = FileParser.new(File.expand_path("../test_log.txt", __FILE__))
      file.parse

      @endpoints.map { |e| expect(e.stats.empty?).to eql(false) }
    end
  end

  context "statistics" do
    context "mean" do
      it "returns the average for the array" do
        expect([2, 4, 6, 8, 10, 12].mean).to eql(7.0)
        expect([48, 29, 26, 19, 3].mean).to eql(25.0)
      end
    end

    context "median" do
      it "returns the middle of the set if array length is odd" do
        expect([1, 2, 15, 22, 38].median).to eql(15)
      end

      it "returns the average of the middle of the set if array length is even" do
        expect([1, 6, 14, 22].median).to eql(10.0)
      end

      it "sorts an array before calculating the median" do
        expect([1, 20, 50, 60, 10].median).to eql(20)
      end
    end

    context "mode" do
      it "returns the most popular item(the item that appears most often) in the array" do
        expect([1, 1, 2, 3, 4].mode).to eql(1)
        expect([1, 1, 2, 2, 3, 4, 4, 4, 4, 4].mode).to eql(4)
      end
    end
  end
end
