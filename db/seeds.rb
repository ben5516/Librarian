# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


libraries = Library.create([
  {
    name: "St. Louis Public Library",
    address: "1301 Olive St",
    city: "St. Louis",
    state: "MO",
    zip: "63103"
  },
  {
    name: "Washington MO Library",
    address: "410 Lafayette St",
    city: "Washington",
    state: "MO",
    zip: "63090"
  },
  {
    name: "Jefferson County Library",
    address: "1701 Missouri State Rd",
    city: "Arnold",
    state: "MO",
    zip: "63010"
  },
  {
    name: "Scenic Regional Library",
    address: "119 West St. Louis Street",
    city: "Pacific",
    state: "MO",
    zip: "63069"
  }
])

books = Book.create([
  {
    title: "Where the Red Fern Grows",
    ISBN: "9780553255850"
  },
  {
    title: "Harry Potter and the Sorcerer's Stone",
    ISBN: "9788478888566"
  },
  {
    title: "Harry Potter and the Deathly Hallows",
    ISBN: "9780605039070"
  },
  {
    title: "Harry Potter and the Chamber of Secrets",
    ISBN: "9780747560722"
  },
  {
    title: "Bridge to Teribithia",
    ISBN: "9780884839095"
  },
  {
    title: "Sycamore Row",
    ISBN: "9780385537131"
  },
  {
    title: "Cross My Heart",
    ISBN: "0316210919"
  },
  {
    title: "The Atlantis Gene",
    ISBN: "9781940026008"
  }
])

books.first(4).each do |book|
  libraries.first.library_books.create({book_id: book.id})
end

books.last(5).each do |book|
  libraries.last.library_books.create({book_id: book.id})
end