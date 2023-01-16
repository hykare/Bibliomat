# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

(1..4).each do |i|
  User.create email: 'user' + i.to_s + '@gmail', password: '123123123'
end

lorem = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis magni, obcaecati facere alias unde maxime! Alias, maiores facilis eaque nesciunt, fugiat libero aut repellendus minus et modi ex voluptas eos illo rem quibusdam ducimus natus necessitatibus, adipisci architecto maxime perferendis qui. Omnis labore maxime, neque aliquam numquam recusandae ab asperiores officia non fugit voluptatibus eius eum, sint, facere dolore mollitia sequi consectetur reiciendis tempora! Laborum fuga debitis iste voluptatem modi, nisi dolore necessitatibus ea omnis expedita commodi dolores, ad porro dicta voluptates ducimus minima non delectus est eum nam dolor nulla fugit repellat! Voluptatibus aliquam sapiente tenetur natus consequuntur voluptates excepturi provident nulla ea veniam fuga quisquam consectetur velit rem non, expedita quis illo dicta hic quia beatae. Distinctio, itaque?'
Update.create title: 'Reprehenderit veritatis', description: lorem
Update.create title: 'Veniam fuga', description: lorem
Update.create title: 'Vitae nulla ut est minima', description: lorem
Update.create title: 'Itaque laboriosam voluptas', description: lorem
Update.create title: 'Magnam sequi libero', description: lorem

# books dataset
# ISBN,Book-Title,Book-Author,Year-Of-Publication,Publisher,Image-URL-S,Image-URL-M,Image-URL-L

book_lines = File.readlines('lib/datasets/books_5000_replaced.csv')
book_lines[1..100].each do |line|
  columns = line.split(',')
  book = Book.create ISBN: columns[0], title: columns[1], author: columns[2], publication_year: columns[3],
                     publisher: columns[4]

  rand(1..5).times do
    book.items.create
  end
end
