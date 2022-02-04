class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog       = cog
    @rim       = rim
    @tire      = tire
  end

  # ＜わしはWheelインスタンスのインチしか計算をせんぞい！
  def gear_inches
    ratio * Wheel.new(rim, tire).diameter #ここで直接インスタンスを呼び出したらまずいよなあ？
  end

  def ratio
    chainring / cog.to_f
  end
# ...
end

class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @cog = cog
  end

  def diameter
    rim + (tire * 2)
  end
#...
end

Gear.new(52, 11, 26, 1.5).gear_inches
# Wheelの変更によってGearへの変更が強制される状況は？
#  GearはWheelが存在することを知っている
#  GearはWheelにdiameterが存在することを知っている
#  GearはWheelをnewするのにrimとtireが必要な事を知っている
#  GearはWheelをnewするための引数の順番を知っている
#  __Wheel__が変更したらGearも変更しなくちゃいけなくなるよなあ？？？
#  GearがWheelを知れば知るほど1つのエンティティのように振る舞うよなあ？

class Gear2
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog       = cog
    @wheel     = wheel ＃Has Aすればいいよなあ？
  end

  # ＜わしはwheelならなんでもよびだすぞい？
  def gear_inches
    ratio * wheel.diameter
  end

  def ratio
    chainring / cog.to_f
  end
# ...
end

class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @cog = cog
  end

  def diameter
    rim + (tire * 2)
  end
#...
end

Gear.new(52, 11, 26, 1.5).gear_inches

class Gear3
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(args)
    @chainring = args[:chainring]
    @cog       = args[:cog]
    @wheel     = args[:wheel] ＃Has Aすればいいよなあ？
  end

  # ＜わしはwheelならなんでもよびだすぞい？
  def gear_inches
    ratio * wheel.diameter
  end

  def ratio
    chainring / cog.to_f
  end
# ...
end

class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim   = rim
    @cog   = cog
  end

  def diameter
    rim + (tire * 2)
  end
#...
end

Gear.new(
  :chainring => 52,
  :cog       => 11,
  :wheel     => Wheel.new(26, 1.5)
).gear_inches
