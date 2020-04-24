require 'rails_helper'

describe Transaction do
  
  ###成功パターン###
  describe '#done' do
    it "is valid with product_id, user_id" do
      transaction = build(:transaction)
      transaction.valid?
      expect(transaction).to be_valid
    end

    ###失敗パターン###
    
    it "is invalid without product_id" do
      transaction = build(:transaction, product_id: nil)
      transaction.valid?
      expect(transaction.errors[:product_id]).to include("can't be blank")
    end

    it "is invalid without user_id" do
      transaction = build(:transaction, user_id: nil)
      transaction.valid?
      expect(transaction.errors[:user_id]).to include("can't be blank")
    end

  end
end