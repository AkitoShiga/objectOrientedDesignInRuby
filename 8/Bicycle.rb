class Bicycle
  attr_reader :size, :parts

  def initialize(args={})
    @size  = args[:size]
    @parts = args[:parts] # hasしてる
  end

  def spares
    parts.spares # 移譲している
  end
end
