class Seed

  def initialize
    generate_users
    generate_businesses
    generate_100_users
    generate_listings
    puts "💥  Database has been succefully seeded 💥"
  end


  def generate_users
    User.create!(full_name: "Rachel Warbelow",
                  email: "demo+rachel@jumpstartlab.com",
                  password: "password",
                  password_confirmation: "password")

    User.create!(full_name: "Jeff",
                  email: "demo+jeff@jumpstartlab.com",
                  password: "password",
                  password_confirmation: "password")

    User.create!(full_name: "Jorge Tellez",
                  email: "demo+jorge@jumpstartlab.com",
                  password: "password",
                  password_confirmation: "password",
                  user_name: "novohispano",
                  admin: true)

    User.create!(full_name: "Josh Cheek",
                  email: "demo+josh@jumpstartlab.com",
                  password: "password",
                  password_confirmation: "password",
                  user_name: "josh",
                  admin: true)

    puts "⏩  Users and Site-Admins have been generated."
  end

  def generate_listings
    20.times do
      Listing.create!(business_id: '1',
                      wage: Random.rand(1..1000000),
                      hours: Random.rand(20..60),
                      number_of_positions: Random.rand(1..10),
                      title: Faker::Name.title,
                      end_date: Faker::Time.forward(Random.rand(5..60)),
                      description: Faker::Company.catch_phrase
                      )
    end

    20.times do
      Listing.create!(business_id: '2',
      wage: Random.rand(1..1000000),
      hours: Random.rand(20..60),
      number_of_positions: Random.rand(1..10),
      title: Faker::Name.title,
      end_date: Faker::Time.forward(Random.rand(5..60), :morning),
      description: Faker::Company.catch_phrase
      )
    end

    20.times do
      Listing.create!(business_id: '3',
      wage: Random.rand(1..1000000),
      hours: Random.rand(20..60),
      number_of_positions: Random.rand(1..10),
      title: Faker::Name.title,
      end_date: Faker::Time.forward(Random.rand(5..60), :morning),
      description: Faker::Company.catch_phrase
      )
    end

    20.times do
      Listing.create!(business_id: '4',
      wage: Random.rand(1..1000000),
      hours: Random.rand(20..60),
      number_of_positions: Random.rand(1..10),
      title: Faker::Name.title,
      end_date: Faker::Time.forward(Random.rand(5..60), :morning),
      description: Faker::Company.catch_phrase
      )
    end

    20.times do
      Listing.create!(business_id: '5',
      wage: Random.rand(1..1000000),
      hours: Random.rand(20..60),
      number_of_positions: Random.rand(1..10),
      title: Faker::Name.title,
      end_date: Faker::Time.forward(Random.rand(5..60), :morning),
      description: Faker::Company.catch_phrase
      )
    end

    20.times do
      Listing.create!(business_id: '6',
      wage: Random.rand(1..1000000),
      hours: Random.rand(20..60),
      number_of_positions: Random.rand(1..10),
      title: Faker::Name.title,
      end_date: Faker::Time.forward(Random.rand(5..60), :morning),
      description: Faker::Company.catch_phrase
      )
    end

    20.times do
      Listing.create!(business_id: '7',
      wage: Random.rand(1..1000000),
      hours: Random.rand(20..60),
      number_of_positions: Random.rand(1..10),
      title: Faker::Name.title,
      end_date: Faker::Time.forward(Random.rand(5..60), :morning),
      description: Faker::Company.catch_phrase
      )
    end

    20.times do
      Listing.create!(business_id: '8',
      wage: Random.rand(1..1000000),
      hours: Random.rand(20..60),
      number_of_positions: Random.rand(1..10),
      title: Faker::Name.title,
      end_date: Faker::Time.forward(Random.rand(5..60), :morning),
      description: Faker::Company.catch_phrase
      )
    end

    20.times do
      Listing.create!(business_id: '9',
      wage: Random.rand(1..1000000),
      hours: Random.rand(20..60),
      number_of_positions: Random.rand(1..10),
      title: Faker::Name.title,
      end_date: Faker::Time.forward(Random.rand(5..60), :morning),
      description: Faker::Company.catch_phrase
      )
    end

    20.times do
      Listing.create!(business_id: '10',
      wage: Random.rand(1..1000000),
      hours: Random.rand(20..60),
      number_of_positions: Random.rand(1..10),
      title: Faker::Name.title,
      end_date: Faker::Time.forward(Random.rand(5..60), :morning),
      description: Faker::Company.catch_phrase
      )
    end

    puts "⏩  Listings have been generated."
  end

  def generate_businesses
    Business.create!(name: "Turing",
                    address: "1500 Blake St.",
                    state: "CO",
                    phone: "802-123-5858",
                    email: "employment@turing.io",
                    slug: "turing",
                    url: "www.turing.io",
                    description: "Turn humans into developers in 7 months."
    )

    Business.create!(name: "The Booze Palace",
                    address: "444 Window St.",
                    state: "MN",
                    phone: "444-321-5858",
                    email: "employment@theboozepalace.com",
                    slug: "the-booze-palace",
                    url: "www.theboozepalace.com",
                    description: "Everything you need to get drunk"
    )

    Business.create!(name: "Beef and Beer",
                    address: "1431 Main St.",
                    state: "AL",
                    phone: "982-9090-9865",
                    email: "employment@beefandbeer.com",
                    slug: "beef-and-beer",
                    url: "www.beefandbeer.com",
                    description: "Meats, for everyone!"
    )

    Business.create!(name: "Big Game Supply",
                    address: "1 Blake St.",
                    state: "ME",
                    phone: "802-123-5858",
                    email: "employment@biggamesupply.com",
                    slug: "big-game-supply",
                    url: "www.biggamepsupply.com",
                    description: "Are you constantly unable to go more than a day without shooting something?  Get all the gear you need from us!"
    )

    Business.create!(name: "Not A Normal Pet",
                    address: "7511 Bone St.",
                    state: "ME",
                    phone: "802-908-5823",
                    email: "employment@notnormalpets.com",
                    slug: "not-normal-pets",
                    url: "www.notnormalpets.com",
                    description: "A pet shop dedicated to animals that seem more 'dangerous' or 'not quiet pet material' to most people."
    )

    Business.create!(name: "webShop",
                    address: "123 Blake St.",
                    state: "CO",
                    phone: "378-475-2457",
                    email: "employment@webShop.com",
                    slug: "webshop",
                    url: "www.webShop.com",
                    description: "The new coolest thing out there is us.  Trust, me."
    )

    Business.create!(name: "Mile High Air",
                    address: "100 Dercum Square",
                    state: "CO",
                    phone: "802-123-5858",
                    email: "employment@milehighair.com",
                    slug: "mile-high-air",
                    url: "www.milehighair.com",
                    description: "Ever wanted to go to space?  We have a rocket, let us take you there!"
    )

    Business.create!(name: "Denver Hospital",
                    address: "8111 Lowry Boulevard",
                    state: "CO",
                    phone: "802-345-7758",
                    email: "employment@denverhospital.com",
                    slug: "denver-hospital",
                    url: "www.denverhospital.com",
                    description: "The best in Denver."
    )

    Business.create!(name: "Stark Enterprises",
                    address: "1311 Abbot Kinney",
                    state: "CA",
                    phone: "432-215-5644",
                    email: "employment@stark.com",
                    slug: "stark-enterprises",
                    url: "www.stark.com",
                    description: "Gagets, energy, power, iron."
    )

    Business.create!(name: "Prestige Worldwide",
                    address: "9200 West Sunset Blvd",
                    state: "CA",
                    phone: "141-224-9823",
                    email: "employment@prestigeworldwide.com",
                    slug: "prestige-worldwide",
                    url: "www.prestigeworldwide.com",
                    description: "Not just a band, that has been done before. It is more like an international music corporation."
    )

    puts "⏩  Businesses have been generated."
  end

  def generate_100_users
    100.times do
      first_name = %W(Tom Kim Konr Zach John Pat Joan Josh Jeff Cat Jorge Fred Sam Shawna Kelly Shelly)
      last_name  = %W(Williams Mee Larson Ruthier Casimir Téllez)
      full_name = "#{first_name.sample} #{last_name.sample}"

      User.create!(full_name: "#{full_name}",
                    email: "#{full_name}#{Random.rand(1..1000000)}@example.com",
                    password: "password",
                    password_confirmation: "password")
    end
    puts "⏩  100 random users have been created!"
  end
end

Seed.new
