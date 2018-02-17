namespace :dev do

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