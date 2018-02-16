namespace :dev do

  task fetch_shop: :environment do
    # Shop.destroy_all

    url = "https://cafenomad.tw/api/v1.2/cafes"
    response = RestClient.get(url)
    data = JSON.parse(response.body)
      
    data.each do |i|
      shop = Shop.create!(
        name: i["name"],
        address: i["address"],
        latitude: i["latitude"],
        longitude: i["longitude"]
      )

      puts shop.name
    end
    puts Shop.count
  end

end