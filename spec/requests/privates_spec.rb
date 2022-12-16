require 'rails_helper'

RSpec.describe "Privates", type: :request do
  describe "GET /update" do
    it "returns http success" do
      get "/privates/update"
      expect(response).to have_http_status(:success)
    end
  end

end
