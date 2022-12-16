require 'rails_helper'

RSpec.describe "Shadowbans", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/shadowbans/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/shadowbans/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/shadowbans/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
