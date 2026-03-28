require "rails_helper"

RSpec.describe "Users", type: :request do
  let(:valid_attributes) do
    {
      account: "testuser",
      user_name: "Test User",
      password: "password123",
      password_confirmation: "password123",
      birth_of_date: Date.new(1990, 5, 15)
    }
  end

  describe "GET /:account" do
    it "returns a successful response when the user exists" do
      user = User.create!(valid_attributes)

      get account_path(user.account)

      expect(response).to be_successful
    end

    it "returns not found when no user has that account" do
      get account_path("nonexistent_account")

      expect(response).to have_http_status(:not_found)
    end
  end
end
