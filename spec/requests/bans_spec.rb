require 'rails_helper'

RSpec.describe "Bans", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/bans/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/bans/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/bans/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
