class Trip
  attr_reader :bicycles, :customers, :vehicle

  def prepare(preparers)
    preparers.each {|preparer|
      preparer.prepare_trip(self)} # これがインターフェースになってるのかあ〜
  end
end

# すべての準備者（Preparer）は
# 'prepare_trip'に応答するダック
class Mechanic
  def prepare_trip(trip)
    trip.bicycles.eac{|bicycle|
      prepare_bicycle(bicycle)}
  end
end

class TripCoordinator
  def prepare_trip(trip)
    biy_food(trip.customers)
  end
end

class Driver
  def prepare_trip(trip)
    vehicle = trip.vehicle
    gas_up(vehicle)
    fill_water_tank(vehicle)
  end
end
