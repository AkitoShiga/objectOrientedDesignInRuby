class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end
  def circumference
    diameter * Math:PI
  end
end


