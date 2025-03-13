# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
10.times do |i|
  image = Image.create!(
    name: "Image #{i+1}"
  )

  picture_path = Rails.root.join("app/assets/images/seed_images/#{i+1}.jpeg")

  if File.exist?(picture_path)
    image.picture.attach(
      io: File.open(picture_path),
      filename: "#{i+1}.jpeg",
      content_type: "image/jpeg"
    )
    puts "Attached picture to Image ##{i+1}"
  else
    puts "Picture not found at #{picture_path}"
  end
end

puts "Created #{Image.count} Images with pictures"
