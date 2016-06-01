require "rails_helper"

describe PaymentGatewayRepliesController, type: :controller do
  describe "POST create" do
    it "renders 200 OK" do
      post :create

      expect(response.body).to be_blank
    end
  end

  describe "GET create" do
    it "renders 200 OK" do
      get :create

      expect(response.body).to be_blank
    end
  end
end
