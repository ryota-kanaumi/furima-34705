FactoryBot.define do

  factory :user do
    nickname { Faker::Name.name }
    email {Faker::Internet.free_email}
    password = Faker::Lorem.characters(number: 10, min_alpha: 4, min_numeric: 1)
    password { password }
    password_confirmation { password }
    birthday   {Faker::Date.birthday(min_age: 18, max_age: 65)}
    last_name { "山田" }
    first_name { "太郎" }
    last_read_name { "ヤマダ" }
    first_read_name { "タロウ" }
  end
end