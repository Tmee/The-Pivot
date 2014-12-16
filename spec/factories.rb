FactoryGirl.define do  factory :business do
    
  end
  factory :order do
    delivery false
  end

  factory :user do
    full_name 'Cave Johnson'
    email 'user@email.com'
    password 'foobar'
    password_confirmation 'foobar'
  end
end
