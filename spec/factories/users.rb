FactoryBot.define do
  factory :product do
    nickname                {"タロー"}
    email                   {"aaa@gmail.com"}
    encrypted_password      {"00000000"}
    first_name              {"太郎"}
    last_name               {"山田"}
    first_name_kana         {"タロウ"}
    last_name_kana          {"ヤマダ"}
    prefecture              {"東京都"}
    # municipality            {""}
    # address                 {""}
    # phone_num               {""}
    # post_num                {""}
    # birthday_yyyy           {""}
    # birthday_mm             {""}
    # birthday_dd             {""}
    # card_id                 {""}
    # introduction            {""}
    # reset_password_token    {""}
    # reset_password_sent_at  {""}
    # remember_created_at     {""}
  end
end