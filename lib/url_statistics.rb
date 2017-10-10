class UrlStatistics
  attr_accessor :dyno, :response_time

  def empty?
    self.dyno.nil?
  end
end

class Array
  def sum
    inject(0.0) { |result, el| result + el }
  end

  def mean
    sum / size
  end

  def median
    sorted = self.sort
    len = sorted.length
    len % 2 == 1 ? sorted[len/2] : (sorted[len/2 - 1] + sorted[len/2]).to_f / 2
  end

  def mode
    frequencies = inject(Hash.new(0)) { |h, n| h[n] += 1; h }
    modes = nil
    frequencies.each_pair do |item, times|
      modes << item if modes && times == modes[0]
      modes = [times, item] if (!modes && times > 1) or (modes && times > modes[0])
    end
    return modes ? modes[1...modes.size].first : modes
  end
end
