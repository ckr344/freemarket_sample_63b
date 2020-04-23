# FactoryBot.define do
#   factory :user do
#     nickname              {Faker::Japanese::Name.name}
#     email                 {Faker::Internet.email}
#     password              {Faker::Internet.password(min_length: 8)}
#     first_name            {Faker::Japanese::Name.first_name}
#     last_name             {Faker::Japanese::Name.last_name}
#     first_name_kana       {Faker::Japanese::Name.first_name.yomi}
#     last_name_kana        {Faker::Japanese::Name.last_name.yomi}
#     birthday_yyyy         {1990}
#     birthday_mm           {12}
#     birthday_dd           {12}
#     address               {Faker::Address.city}
#     card_id               {1}
#   end
# end
