namespace :dev do

  tack rack_city: :environment do
    ShopCity.destroy_all

    ShopCity.create!(city: "taipei")
    ShopCity.create!(city: "keelung")
    ShopCity.create!(city: "taoyuan")
    ShopCity.create!(city: "hsinchu")
    ShopCity.create!(city: "taichung")
    ShopCity.create!(city: "changhua")
    ShopCity.create!(city: "yunlin")
    ShopCity.create!(city: "chiayu")
    ShopCity.create!(city: "tainan")
    ShopCity.create!(city: "kaohsiung")
    ShopCity.create!(city: "pingtung")
    ShopCity.create!(city: "taitung")
    ShopCity.create!(city: "hualien")
    ShopCity.create!(city: "yilan")

    puts ShopCity.count

  end

  task fetch_shop: :environment do
    Shop.destroy_all

    url = "https://cafenomad.tw/api/v1.2/cafes"
    response = RestClient.get(url)
    data = JSON.parse(response.body)
      
    data.each do |i|
      shopcity = ShopCity.find_by(city: i["city"])

      if shopcity == nil
        next
      end
      shop = shopcity.shops.create!(
        name: i["name"],
        address: i["address"],
        latitude: i["latitude"],
        longitude: i["longitude"],
        open_time: i["open_time"],
        limited_time: i["linited_time"],
        wifi: i["wifi"],
        link: i["url"]
      )
    end
    puts Shop.count
  end

end