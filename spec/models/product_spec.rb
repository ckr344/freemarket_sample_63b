require 'rails_helper'

describe Product do
  describe '#create' do
    it "nameが空では登録できないこと" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "nameが40文字以下であれば登録できること" do
      product = build(:product, name: "A")
      product.valid?
      expect(product).to be_valid
    end

    it "nameが41文字以上であれば登録できないこと" do
      product = build(:product, name: "A" * 41)
      product.valid?
      expect(product.errors[:name]).to include("is too long (maximum is 40 characters)")
    end
    
    it "descriptionが1000文字以下であれば登録できること" do
      product = build(:product, description: "aaa")
      product.valid?
      expect(product).to be_valid
    end
    it "descriptionが1001文字以上であれば登録できないこと" do
      product = build(:product, description: "a" * 1001)
      product.valid?
      expect(product.errors[:description]).to include("is too long (maximum is 1000 characters)")
    end
    it "descriptionが空でも登録できること" do
      product = build(:product, description: nil)
      expect(product).to be_valid
    end
    
    it "statusが空では登録できないこと" do
      product = build(:product, status: nil)
      product.valid?
      expect(product.errors[:status]).to include("can't be blank")
    end
    
    it "delivery_chargeが空では登録できないこと" do
      product = build(:product, delivery_charge: nil)
      product.valid?
      expect(product.errors[:delivery_charge]).to include("can't be blank")
    end
    
    it "delivery_methodが空では登録できないこと" do
      product = build(:product, delivery_method: nil)
      product.valid?
      expect(product.errors[:delivery_method]).to include("can't be blank")
    end
    
    it "delivery_prefectureが空では登録できないこと" do
      product = build(:product, delivery_prefecture: nil)
      product.valid?
      expect(product.errors[:delivery_prefecture]).to include("can't be blank")
    end
    
    it "delivery_daysが空では登録できないこと" do
      product = build(:product, delivery_days: nil)
      product.valid?
      expect(product.errors[:delivery_days]).to include("can't be blank")
    end
    
    it "sizeが空では登録できないこと" do
      product = build(:product, size: nil)
      product.valid?
      expect(product.errors[:size]).to include("can't be blank")
    end
    
    it "priceが空では登録できないこと" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end
    
    it "categoryが空では登録できないこと" do
      product = build(:product, category: nil)
      product.valid?
      expect(product.errors[:category]).to include("can't be blank")
    end
    
    it "blandが空でも登録できること" do
      product = build(:product, brand: nil)
      expect(product).to be_valid
    end
  end

  describe '#update' do
    it "nameが空では登録できないこと" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "nameが40文字以下であれば登録できること" do
      product = build(:product, name: "A")
      product.valid?
      expect(product).to be_valid
    end
    
    it "nameが41文字以上であれば登録できないこと" do
      product = build(:product, name: "A" * 41)
      product.valid?
      expect(product.errors[:name]).to include("is too long (maximum is 40 characters)")
    end
    
    it "descriptionが1000文字以下であれば登録できること" do
      product = build(:product, description: "aaa")
      product.valid?
      expect(product).to be_valid
    end
    it "descriptionが1001文字以上であれば登録できないこと" do
      product = build(:product, description: "a" * 1001)
      product.valid?
      expect(product.errors[:description]).to include("is too long (maximum is 1000 characters)")
    end
    it "descriptionが空でも登録できること" do
      product = build(:product, description: nil)
      expect(product).to be_valid
    end
    
    it "statusが空では登録できないこと" do
      product = build(:product, status: nil)
      product.valid?
      expect(product.errors[:status]).to include("can't be blank")
    end
    
    it "delivery_chargeが空では登録できないこと" do
      product = build(:product, delivery_charge: nil)
      product.valid?
      expect(product.errors[:delivery_charge]).to include("can't be blank")
    end
    
    it "delivery_methodが空では登録できないこと" do
      product = build(:product, delivery_method: nil)
      product.valid?
      expect(product.errors[:delivery_method]).to include("can't be blank")
    end
    
    it "delivery_prefectureが空では登録できないこと" do
      product = build(:product, delivery_prefecture: nil)
      product.valid?
      expect(product.errors[:delivery_prefecture]).to include("can't be blank")
    end
    
    it "delivery_daysが空では登録できないこと" do
      product = build(:product, delivery_days: nil)
      product.valid?
      expect(product.errors[:delivery_days]).to include("can't be blank")
    end
    
    it "sizeが空では登録できないこと" do
      product = build(:product, size: nil)
      product.valid?
      expect(product.errors[:size]).to include("can't be blank")
    end
    
    it "priceが空では登録できないこと" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end
    
    it "categoryが空では登録できないこと" do
      product = build(:product, category: nil)
      product.valid?
      expect(product.errors[:category]).to include("can't be blank")
    end
    
    it "blandが空でも登録できること" do
      product = build(:product, brand: nil)
      expect(product).to be_valid
    end
  end
end