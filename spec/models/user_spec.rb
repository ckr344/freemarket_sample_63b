require 'rails_helper'
describe User do
  describe '#create' do
    it "全て入力されていればOK" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "nicknameが空ならNG" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    it "emailが空ならNG" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "emailが意図しない形ならNG" do
      user = build(:user, email: "aaagmail.com")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end
    it "emailが重複していたらNG" do
      user1 = create(:user)
      expect(build(:user, email: user1.email)).to_not be_valid
    end
    it "passwordが空ならNG" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    it "passwordが7文字よりも短ければNG" do
      user = build(:user, password: "aaa111")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end
    it "first_nameが空ならNG" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    it "last_nameが空ならNG" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end
    it "first_name_kanaが空ならNG" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end
    it "last_name_kanaが空ならNG" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end
    it "birthday_yyyyが空ならNG" do
      user = build(:user, birthday_yyyy: nil)
      user.valid?
      expect(user.errors[:birthday_yyyy]).to include("can't be blank")
    end
    it "birthday_mmが空ならNG" do
      user = build(:user, birthday_mm: nil)
      user.valid?
      expect(user.errors[:birthday_mm]).to include("can't be blank")
    end
    it "birthday_ddが空ならNG" do
      user = build(:user, birthday_dd: nil)
      user.valid?
      expect(user.errors[:birthday_dd]).to include("can't be blank")
    end
  end
end