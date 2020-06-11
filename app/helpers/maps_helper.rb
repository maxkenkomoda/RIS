module MapsHelper
#traffic model boolean check
  def traffic_details
    traffic_detail = []

    if @map.traffic.volume == true
      traffic_detail<< '交通量が多い'
    end

    if @map.traffic.speed == true
      traffic_detail << '車の速度が速い'
    end

    if @map.traffic.volume == true
      traffic_detail << '交通量が多い'
      end

    if @map.traffic.large_car == true
      traffic_detail <<  '大型車の交通量が多い'
      end

    if @map.traffic.people == true
      traffic_detail << '歩行者が多い'
    end

    if @map.traffic.stop == true
      traffic_detail << '自転車通行禁止もしくは行き止まり'
   end

    if traffic_detail.empty?
      traffic_detail << '特になし'
    end
    
    return traffic_detail
  end

#road model boolean check
  def road_details
    road_detail = []
    
    if @map.road.condition == true
      road_detail << '路面が荒れている'
      end

    if @map.road.sidewalk == true
      road_detail << '避難用の歩道がない'
      end

    if @map.road.narrow == true
      road_detail <<  '道が狭い'
    end

    if road_detail.empty?
      road_detail << '特に無し'
    end

    return road_detail
  end

#shop model boolean check
  def shop_details
    shop_detail = []
      
    if @map.shop.no_shop == true
      shop_detail << '近くにコンビニ・レストランがない'
    end

    if @map.shop.no_vending_machine == true
      shop_detail << '近くに自動販売機がない'
    end

    if shop_detail.empty?
      shop_detail << '特に無し'
    end

    return shop_detail
  end
end
