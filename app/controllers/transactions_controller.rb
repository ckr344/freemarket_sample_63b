class TransactionsController < ApplicationController
  require 'payjp'
  before_action :authenticate_user!
  before_action :set_card, only: [:pay_index, :pay]
  before_action :set_product

  def pay_index
    @top_image = @product.images.first
    @card = @set_card.first
    if @card.blank?
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    @card = @set_card.first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @product.price, #支払金額を入力（後ほどproductテーブルに紐づけ）
    :customer => @card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
  )
  redirect_to action: 'done', product_id: @product #完了画面に移行
  end

  def done
    @top_image = @product.images.first
    Transaction.create(product_id: @product.id, user_id: current_user.id)
  end

  private

  def set_card
    @set_card = Card.where(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

end
