# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

(1..9).each do |i|
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
book_lines[1..20].each do |line|
  columns = line.split(',')
  next unless columns[5].include?('.jpg')

  book = Book.create ISBN: columns[0], title: columns[1], author: columns[2], publication_year: columns[3],
                     publisher: columns[4], image_url_S: columns[5], image_url_M: columns[6], image_url_L: columns[7]

  rand(2..5).times do
    book.items.create
  end
end

# orders
# t.datetime :order_date
# t.datetime :delivery_date
# t.datetime :pickup_date
# t.datetime :return_date

# UNAVAILABLE
Order.create user: User.first, item: Book.find(2).items.first, order_date: (Time.now - 5.days)
Order.create user: User.first, item: Book.find(3).items.first, order_date: (Time.now - 5.days)

Order.create user: User.find(2), item: Book.find(5).items.first, order_date: (Time.now - 15.days),
             delivery_date: (Time.now - 14.days), pickup_date: (Time.now - 13.days), return_date:(Time.now - 12.days)

Order.create user: User.find(2), item: Book.find(1).items.first, order_date: (Time.now - 15.days),
             delivery_date: (Time.now - 14.days), pickup_date: (Time.now - 13.days), return_date:(Time.now - 12.days)

Order.create user: User.find(2), item: Book.find(1).items.first, order_date: (Time.now - 5.days),
             delivery_date: (Time.now - 4.days), pickup_date: (Time.now - 3.days)

# Order.create user: User.first, item: Book.find(2).items.first, order_date: (Time.now - 5.days)

# Order.create user: User.find(2), item: Book.find(3).items.first, order_date: (Time.now - 5.days)
