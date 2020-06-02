module MapsHelper


  def traffic_volume 
    if @map_show.traffic.volume == true
      p '交通量が多い'
    end
  end

  def traffic_speed
    if @map_show.traffic.speed == true
      p '車の速度が速い'
    end
  end

  def traffic_large_car
    if @map_show.traffic.large_car == true
      p '大型車の交通量が多い'
    end
  end
end
