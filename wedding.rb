require_relative "testing_library"

unless File.exists?(".name")
  print "Please enter your name\n"
  name = $stdin.gets.chomp
  File.open((".name"), "w") do |f|
    f.puts name
  end
end

people = {
  "joe" => {
    first_name: "Joe",
    last_name: "Jenkins",
    preferences: {
      meal: "meat",
      favorite_genres: ["jazz", "soul"],
    },
    sitting_next_to: :sue,
    correspondence: [
      {date: "11/4/2014", description: "sent invitation"},
      {date: "12/2/2014", description: "replied yes"},
    ],
  },
  "sue" => {
    :first_name => "Sue",
    :last_name => "Summers",
    :preferences => {
      :meal => "fish",
      :favorite_genres => ["funk", "blues"],
    },
    sitting_next_to: :joe,
    correspondence: [
      {date: "11/7/2014", description: "sent invitation"},
      {date: "12/8/2014", description: "replied yes + 1"},
    ],
  },
}

def joes_last_name(people)
  people["joe"][:last_name]
end

def last_names(people)
    each_last_name =[]
    people.each do |key,value|
    each_last_name << value[:last_name]
    end
    each_last_name
end

def first_fav_genre(people)
  f_genre = {}
  first_f_genre = []
  people.each do |key,value|
    f_genre = value[:preferences][:favorite_genres]
    first_f_genre << f_genre[0]
  end
  first_f_genre
end

def joes_neighbor(people)
  neighbor = []
  people.each do |key,value|
    if value[:sitting_next_to].to_s == "joe"
      neighbor << value[:last_name]
    else
    end
  end
  neighbor[0]
end

def sues_meal(people)
  meal = []
  people.each do |key,value|
    if value[:first_name] == "Sue"
      meal << value[:preferences][:meal]
    else
    end
  end
  meal[0]
end

def joes_first_letter_date(people)

  cor_dates = {}
  date = []
  people.each do |key,value|
    if key == "joe"
      cor_dates = value[:correspondence]
    else
    end
  end
    cor_dates.each do |key,value|
    date << key[:date]
    end
  date.first
end

def sues_last_letter_desc(people)
  cor_value = {}
  cor = []
  people.each do |key,value|
    if key == "sue"
      cor_value = value[:correspondence]
    else
    end
  end
  cor_value.each do |key,value|
    cor << key[:description]
    end
  cor.last
end

puts "*"*80
puts "Make each method return the correct value"
puts "The check method will run and tell you if the answer is correct"
puts "*"*80

results = []

results << check("joes_last_name", joes_last_name(people), "Jenkins")
results << check("last_names", last_names(people), ["Jenkins", "Summers"])
results << check("first_fav_genre", first_fav_genre(people), ["jazz", "funk"])
results << check("joes_neighbor", joes_neighbor(people), "Summers")
results << check("sues_meal", sues_meal(people), "fish")
results << check("joes_first_letter_date", joes_first_letter_date(people), "11/4/2014")
results << check("sues_last_letter_desc", sues_last_letter_desc(people), "replied yes + 1")

send_results(results)
