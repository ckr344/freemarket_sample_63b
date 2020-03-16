require 'rails_helper'

describe ProductsController do

  describe 'GET #new' do
    
  end

  describe 'GET #edit' do
    it "インスタンス変数は期待した値になるか" do
      product = create(:product)
      get :edit, params: { id: product }
      expect(assigns(:product)).to eq product
    end

    it "ビューに正しく遷移するか" do
      product = create(:product)
      get :edit, params: { id: product }
      expect(response).to render_template :edit
    end
  end

end