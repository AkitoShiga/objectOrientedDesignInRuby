class Bicycle
  attr_reader :size, :tape_color

  def initialize(args)
    @size       = args[:size]
    @tape_color = args[:tape_color]
  end

  # 全ての自転車、デフォルト値として
  # 同じタイヤサイズとチェーンサイズを持つ
  def spares
    { 
      chain:      '10-speed',
      tire_size:  '23',
      tape_color: tape_color
    }
  end

  # 他のメソッド
end

bike = Bicycle.new(size: 'M', tape_color: 'red')
bike.size #-> M
bike.spares

# ここでマウンテンバイクが追加になりましたぞ

class Bicycle2
  attr_reader:size, :tape_color,
             :front_shok, :rear_shock # マウンテンバイク用。クソコードの匂いがするなあ？

  def initialize(args)
    @size        = args[:size]
    @tape_color  = args[:tape_color]
    @style       = args[:style] # クソコードの匂いがするなあ？
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
  end

  # 全ての自転車、デフォルト値として
  # 同じタイヤサイズとチェーンサイズを持つ
  def spares
    if @style == :road # クソコードの匂いがするなあ？
    { 
      chain:      '10-speed',
      tire_size:  '23',
      tape_color: tape_color
    }
    else
    { 
      chain:      '10-speed',
      tire_size:  '2.1',
      tape_color: rear_shock
    }
    end
  end
  # 他のメソッド
end

# こいつらも修正しなきゃいけなくなるよなあ？
bike = Bicycle2.new(size: 'M', tape_color: 'red')
bike.size #-> M
bike.spares

# マウンテンバイク
bike = Bicycle2.new(
  style: :mountain,
  size: 'S',
  front_shock: 'Manitou',
  rear_shock: 'Fox')
bike.spares

