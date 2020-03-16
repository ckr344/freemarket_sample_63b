FactoryBot.define do
  factory :product do
    name                 {"A"}
    description          {"aaa"}
    status               {"新品、未使用"}
    delivery_charge      {"送料込み(出品者負担)"}
    delivery_method      {"未定"}
    delivery_prefecture  {"北海道"}
    delivery_days        {"1~2日で発送"}
    size                 {"XXS以下"}
    brand                {"コム・デ・ギャルソン"}
    price                {"100000"}
    category
    user
  end
end