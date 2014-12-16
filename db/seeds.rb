class Seed

  def initialize
    generate_users
    generate_businesses
  end


  def generate_users
    User.create!(full_name: "Rachel Warbelow",
                  email: "demo+rachel@jumpstartlab.com",
                  password: "password",
                  password_confirmation: "password",)

    User.create!(full_name: "Jeff",
                  email: "demo+jeff@jumpstartlab.com",
                  password: "password",
                  password_confirmation: "password")

    User.create!(full_name: "Jorge Tellez",
                  email: "demo+jorge@jumpstartlab.com",
                  password: "password",
                  password_confirmation: "password",
                  user_name: "novohispano")

    User.create!(full_name: "Josh Cheek",
                  email: "demo+josh@jumpstartlab.com",
                  password: "password",
                  password_confirmation: "password",
                  user_name: "josh",
                  admin: true)

    puts "Users have been generated."
  end

  def generate_businesses
    Business.create!(name: "Apple",
                    address: "123 Blake St.",
                    state: "CO",
                    phone: "802-123-5858",
                    email: "applesrcool@apple.com",
                    slug: "apple",
                    url: "www.apple.com",
                    description: "We make some really popular and expensive shit."
    )

    Business.create!(name: "Winos",
                    address: "444 Blake St.",
                    state: "MN",
                    phone: "444-321-5858",
                    email: "drinkallday@drunk.com",
                    slug: "wine-and-dine",
                    url: "www.wine-and-dine.com",
                    description: "It may not taste good, but it gets the job done."
    )

    Business.create!(name: "Beef and Beer",
                    address: "1431 Main St.",
                    state: "AL",
                    phone: "982-9090-9865",
                    email: "America@numberone.com",
                    slug: "beef-and-beer",
                    url: "www.beef-and-beer.com",
                    description: "What the hell is a vegetable?"
    )

    Business.create!(name: "Big Game Protection, LLC",
                    address: "1 Blake St.",
                    state: "CO",
                    phone: "802-123-5858",
                    email: "largecaliber@biggamepprotection.com",
                    slug: "big-game-protection",
                    url: "www.biggamepprotection.com",
                    description: "Does the house you live in have a room dedicated to wild or domesticated game?  Are you constantly unable to go more than a day without shooting something?  Come help us target some of the world's most elusive animals."
    )

    Business.create!(name: "Apple",
                    address: "123 Blake St.",
                    state: "CO",
                    phone: "802-123-5858",
                    email: "applesrcool@apple.com",
                    slug: "apple",
                    url: "www.apple.com",
                    description: "We make some really popular and expensive shit."
    )

    Business.create!(name: "Apple",
                    address: "123 Blake St.",
                    state: "CO",
                    phone: "802-123-5858",
                    email: "applesrcool@apple.com",
                    slug: "apple",
                    url: "www.apple.com",
                    description: "We make some really popular and expensive shit."
    )

    Business.create!(name: "Apple",
                    address: "123 Blake St.",
                    state: "CO",
                    phone: "802-123-5858",
                    email: "applesrcool@apple.com",
                    slug: "apple",
                    url: "www.apple.com",
                    description: "We make some really popular and expensive shit."
    )

    Business.create!(name: "Apple",
                    address: "123 Blake St.",
                    state: "CO",
                    phone: "802-123-5858",
                    email: "applesrcool@apple.com",
                    slug: "apple",
                    url: "www.apple.com",
                    description: "We make some really popular and expensive shit."
    )

    Business.create!(name: "Apple",
                    address: "123 Blake St.",
                    state: "CO",
                    phone: "802-123-5858",
                    email: "applesrcool@apple.com",
                    slug: "apple",
                    url: "www.apple.com",
                    description: "We make some really popular and expensive shit."
    )

    Business.create!(name: "Apple",
                    address: "123 Blake St.",
                    state: "CO",
                    phone: "802-123-5858",
                    email: "applesrcool@apple.com",
                    slug: "apple",
                    url: "www.apple.com",
                    description: "We make some really popular and expensive shit."
    )

    puts "Businesses have been generated."
  end


end

Seed.new