module MapsHelper
#traffic model boolean check

  def traffic_volume 
    if @map.traffic.volume == true
      p '交通量が多い'
    end
  end

  def traffic_speed
    if @map.traffic.speed == true
      p '車の速度が速い'
    end
  end

  def traffic_large_car
    if @map.traffic.large_car == true
      p '大型車の交通量が多い'
    end
  end

  def traffic_people
    if @map.traffic.people == true
      p '歩行者が多い'
    end
  end

  def traffic_stop
    if @map.traffic.stop == true
      p '自転車通行禁止もしくは行き止まり'
    end
  end

#road model boolean check

  def road_condition
    if @map.road.condition == true
      p '路面が荒れている'
    end
  end

  def road_sidewalk
    if @map.road.sidewalk == true
      p '避難用の歩道がない'
    end
  end

  def road_narrow
    if @map.road.narrow == true
      p '道が狭い'
    end
  end

#shop model boolean check

  def shop_no_shop
    if @map.shop.no_shop == true
      p '近くにコンビニ・レストランがない'
    end
  end

  def shop_no_vending_machine
    if @map.shop.no_vending_machine == true
      p '近くに自動販売機がない'
    end
  end
end
