class Trip
  attr_reader :bicycles, :customers, :vehicle

  def prepare(mechanic)
    mechanic.prepare_bicycles(bicycles)
    # あまり知られてほしくない
  end

end

class Mechanic
  def prepare_bicycles(bicycles)
    bicycles.each{|bicycle | prepare_bicycles(bicycle)}
  end

  def prepare_bicycle(bicycle)
  end
end


class Trip
  attr_reader :bicycles, :customers, :vehicle
  # こいつぁ〜危険ですぞ
  def prepare(prepares)
    prepares.each {|preparer|
      case preparer
      when Mechanic
        preparer.prepare_bicycles(bicycles) # 知りたくねえよなあ？
      when TripCoordinator
        preparer.buy_food(customers) # 知りたくねえよなあ？
      when Driver
        preparer.fill_water_tank(vehicle) # 知りたくねえよなあ
      end
  }
  end
end

class Mechanic
  def prepare_bicycles(bicycles)
    bicycles.each{|bicycle | prepare_bicycles(bicycle)}
  end

  def prepare_bicycle(bicycle)
  end
end
