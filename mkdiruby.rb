# Vérifier si l'utilisateur a passé un nom de projet
if ARGV.empty? || ARGV.length > 1
    puts "Usage: mkdiruby NOM_DU_PROJET"
    puts "Exemple: mkdiruby mon_projet_ruby"
    exit
  end
  
  project_name = ARGV[0]
  
  # Créer le dossier du projet
  Dir.mkdir(project_name)
  
  # Changer de répertoire vers le dossier du projet
  Dir.chdir(project_name)
  
  # Initialiser un dépôt Git
  system("git init")
  
  # Créer un fichier Gemfile avec les gems de base pour THP
  File.open("Gemfile", "w") do |file|
    file.puts("source 'https://rubygems.org'")
    file.puts("gem 'rspec'")
    file.puts("gem 'launchy'")
  end
  
  # Initialiser rspec
  system("rspec --init")
  
  # Créer un fichier .env
  File.open(".env", "w") do |file|
    file.puts("# Variables d'environnement")
  end
  
  # Ajouter .env au .gitignore
  File.open(".gitignore", "w") do |file|
    file.puts(".env")
  end
  
  # Créer le dossier lib
  Dir.mkdir("lib")
  
  # Créer un fichier Readme.md
  File.open("README.md", "w") do |file|
    file.puts("# #{project_name}")
    file.puts("C'est un programme Ruby créé avec mkdiruby.")
  end
  
  puts "Le projet Ruby '#{project_name}' a été créé avec succès."
  