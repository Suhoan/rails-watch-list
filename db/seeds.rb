# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Movie.destroy_all
List.destroy_all

require 'json'
require 'open-uri'

 url = "https://tmdb.lewagon.com/movie/top_rated"
 response = URI.open(url).read
 data = JSON.parse(response)
 movies_array = data["results"]
 img_url = "https://image.tmdb.org/t/p/w500"

 #creating movie objects
 movies_array.each do |movie|
   new_movie = Movie.new(
     title: movie["title"],
     overview: movie["overview"],
     poster_url:img_url+movie["poster_path"],
     rating: movie["vote_average"]
   )
   new_movie.save!
 end


Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
Movie.create(title: "Half Guard", overview: "Sensitive camera work, fantastic Mise-en-Scène", poster_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRS7V3aI9zguPVT5EmqJx5twRy4aCew5-3nGA&usqp=CAU", rating: 9.9)

list_name_array = ["Crime", "Good", "Bad", "Tense", "Chill", "Criterion", "Mubi", "New" ]
list_name_array.each do |item|
  List.create(name: item)
end
