FactoryBot.define do
  factory :user do
    nickname                {"タロー"}
    email                   {"aaa@gmail.com"}
    encrypted_password      {"00000000"}
    first_name              {"太郎"}
    last_name               {"山田"}
    first_name_kana         {"タロウ"}
    last_name_kana          {"ヤマダ"}
    # prefecture              {"東京都"}
    # municipality            {""}
    # address                 {""}
    # phone_num               {""}
    # post_num                {""}
    birthday_yyyy           {"1999"}
    birthday_mm             {"10"}
    birthday_dd             {"10"}
    # card_id                 {""}
    # introduction            {""}
    # reset_password_token    {""}
    # reset_password_sent_at  {""}
    # remember_created_at     {""}
    password                {"00000000"}
  end
end