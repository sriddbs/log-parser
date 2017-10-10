class Report
  def initialize urls
    @urls = urls
  end

  def display_statistics
    @urls.map do |u|
      puts "*" * 50
      puts "#{u.method} #{u.uri}"
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
  end
end
