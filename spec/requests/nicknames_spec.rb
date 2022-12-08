require 'rails_helper'

RSpec.describe "Nicknames", type: :request do
  describe "GET /update" do
    it "returns http success" do
      get "/nicknames/update"
      expect(response).to have_http_status(:success)
    end
  end

end
