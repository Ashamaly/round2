# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Purchase.destroy_all
Rating.destroy_all
Book.destroy_all
User.destroy_all

# Create Users
User.create(
  (1..9).map do |i|
    {
      email: "foo#{i}@bar.com",
      password: 'password',
      password_confirmation: 'password',
      first_name: 'user',
      last_name: i,
      username: "username#{i}"
    }
  end
)

# Create Books
User.all.each do |user|
  user.books.create(
    (1..9).map do |i|
      {
        title: "book#{i}",
        price: (1 + i) * 10
      }
    end
  )
end

# Create purchases
books = Book.all
User.all.each.with_index do |user, index|
  break if index > 4

  bought_books = books.sample(3)

  user.purchases.create(
    (1..3).map do
      {
        books: bought_books
      }
    end
  )

  bought_books.each do |book|
    book.ratings.create(user: user, comment: '', value: rand(1..5))
  end
end
