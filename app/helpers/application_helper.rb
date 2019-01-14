module ApplicationHelper
  def bootstrap_class_for_flash(flash_type)
    case flash_type
    when 'success'
      'alert-success'
    when 'error'
      'alert-danger'
    when 'alert'
      'alert-warning'
    when 'notice'
      'alert-info'
    else
      flash_type.to_s
    end
  end

  def show_path(path, tour)
    case path
    when 'sea_tour_path'
      sea_tour_path(tour)
    when 'land_tour_path'
      land_tour_path(tour)
    when 'evening_show_path'
      evening_show_path(tour)
    when 'phuket_tour_path'
      phuket_tour_path(tour)
    when 'avia_tour_path'
      avia_tour_path(tour)
    when 'boat_path'
      boat_path(tour)
    when 'shop_path'
      shop_path(tour)
    else
      sea_tour_path(tour)
    end
  end

  def find_tour(product_id, product_type)
    case product_type
    when 'SeaTour'
      SeaTour.find(product_id)
    when 'LandTour'
      LandTour.find(product_id)
    when 'EveningShow'
      EveningShow.find(product_id)
    when 'PhuketTour'
      PhuketTour.find(product_id)
    when 'AviaTour'
      AviaTour.find(product_id)
    when 'Boat'
      Boat.find(product_id)
    when 'Shop'
      Shop.find(product_id)
    when 'StaticPage'
      StaticPage.find(product_id)
    end
  end

  def ferries_path
    tour = SeaTour.where(title: "Паромы на острова").first
    if tour != nil
      sea_tour_path(tour)
    else
      sea_tour_path(SeaTour.first)
    end
  end

  def show_svg(path)
    File.open("app/assets/images/#{path}", "rb") do |file|
      raw file.read
    end
  end
end
