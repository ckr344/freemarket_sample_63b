# require 'rails_helper'
# RSpec.describe CardsController, type: :controller do

#   describe 'GET #new' do
#       context 'ログアウト時'do
#       it "newアクションページに遷移するか" do
#         expect(response).to have_http_status(:success)
#       end
#     end
#   end

#   describe 'GET #show' do
#       context 'ログイン時' do
#         let(:user) { create(:user) }
#         # letとはfactry_botで作ったデータを反映させる
#         let(:card) { create(:card, user_id: user.id) }
#         before do
#         login_user user
#       end
#       it "showアクションのページに遷移するか" do

#         payjp_customer = double(PayjpMock.prepare_customer_information)
#         payjp_list = double("Payjp::ListObject")
#         payjp_card = double("Payjp::Card")

#         allow(Payjp::Customer).to receive(:create).and_return(payjp_customer)
#         # allow(作成したオブジェクト).to receive(置き換えたいメソッド名).and_return(希望する返り値)ここでモックを呼び出している
#         allow(payjp_customer).to receive(:cards).and_return(payjp_list) 
#         allow(payjp_list).to receive(:retrieve).and_return(payjp_card) 

#         product = create(:product, user_id: user.id)
#         # payjp_customer = double("Payjp::Customer")
#         card = create(:card, user_id: user.id)
#         get :show, params: { id: product, card: card.id}
#         expect(response).to render_template :show
#         #response expect内でリクエストが行われた後の遷移先のビューの情報を持つインスタンス
#       end
#     end
#   end

#   describe 'DELETE #destroy' do
#     context 'ログイン時' do
#       let(:user) { create(:user) }
#       let(:card) { create(:card, user_id: user.id) }
#     before do
#       login_user user
#     end
#     it 'ユーザーが削除されること' do
#       allow(Payjp::Customer).to receive(:create).and_return(PayjpMock.prepare_customer_information)
#       product = create(:product, user_id: user.id)
#       payjp_customer = double("Payjp::Customer")
#       card = create(:card, user_id: user.id)
#       get :destroy ,params: {id: product, card: card}
#       expect do
#         delete :destroy, params: { id: user }
#         expect(user).to ep nil
#         end
#       end
#     end
#   end
# end