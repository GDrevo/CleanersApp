# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Booking.destroy_all
House.destroy_all
Cleaner.destroy_all
User.destroy_all

john = User.create(email: "john@john.com", password: "john@john.com", name: "John Doe", phone: "0751236595")

leon = Cleaner.create(email: "leon@leon.com", password: "leon@leon.com", name: "Léon", description: "Nettoyeur efficace, souvent confondu avec Jean Réno", phone: "0625456523", gender: "male", location: "Berlin", experience: "10 years +", days_per_week: "5", work_permit?: true, full_time?: true, confirmed?: true)

mary = Cleaner.create(email: "mary@mary.com", password: "mary@mary.com", name: "Mary", description: "Petite description de Mary, qui travaille très très bien.", phone: "0625456523", gender: "female", location: "Berlin", experience: "1 - 5 years", days_per_week: "4", work_permit?: true, full_time?: false, confirmed?: true)

michel = Cleaner.create(email: "michel@michel.com", password: "michel@michel.com", name: "Michel", description: "Petite description de Michel, qui travaille très très bien.", phone: "0625456523", gender: "male", location: "Berlin", experience: "1 - 5 years", days_per_week: "6", work_permit?: true, full_time?: true, confirmed?: true)
