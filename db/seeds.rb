Admin.create(email:"admin@admin.com", password:"123456")
publishing_company = PublishingCompany.create(name: Faker::Book.publisher)
author = Author.create(name: Faker::Book.author)
genre = Genre.create(name: Faker::Book.genre)
Book.create!(title: Faker::Book.title, genre_id: genre.id, description: "A great Book", publishing_company_id: publishing_company.id, author_id: author.id)