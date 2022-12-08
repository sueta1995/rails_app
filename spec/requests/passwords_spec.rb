require 'rails_helper'

RSpec.describe "Passwords", type: :request do
  describe "GET /update" do
    it "returns http success" do
      get "/passwords/update"
      expect(response).to have_http_status(:success)
    end
  end

end
