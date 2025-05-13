require 'launchy'

# Vérifie si l'utilisateur a entré une recherche
if ARGV.empty?
  puts "Usage: ruby google_searcher.rb votre recherche ici"
  puts "Exemple: ruby google_searcher.rb how to center a div"
  exit
end

# Récupère la recherche (ARGV est un tableau, on le transforme en string avec des +)
search_query = ARGV.join('+')

# Construit l'URL de recherche Google
url = "https://www.google.com/search?q=#{search_query}"

# Ouvre l'URL dans le navigateur par défaut
Launchy.open(url)