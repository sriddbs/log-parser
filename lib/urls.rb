require_relative "url_statistics"

class Urls
  attr_accessor :endpoints, :uri, :method, :stats

  def initialize uri
    @method, @uri = uri.split
    @stats = UrlStatistics.new
  end

  def self.endpoints
    @endpoints ||= [
      "GET /api/users/{user_id}/count_pending_messages",
      "GET /api/users/{user_id}/get_messages",
      "GET /api/users/{user_id}/get_friends_progress",
      "GET /api/users/{user_id}/get_friends_score",
      "POST /api/users/{user_id}",
      "GET /api/users/{user_id}"
    ].map do |u|
      new(u)
    end
  end

  def self.get uri, method
    @endpoints.detect { |e| e.uri == uri && e.method == method }
  end
end
