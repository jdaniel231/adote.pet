require "test_helper"

class Api::V1::AnimalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # Create a user programmatically to ensure we have a valid password
    @user = User.create!(
      name: "Test User",
      email: "test@example.com",
      password: "password",
      password_confirmation: "password"
    )
    @auth_headers = get_auth_headers
  end

  test "should create animal with photos" do
    assert_difference("Animal.count") do
      post api_v1_animals_url, params: {
        name: "Rex",
        specie: "Dog",
        status: "available",
        photos: [fixture_file_upload("test_image.png", "image/png")]
      }, headers: @auth_headers, as: :multipart
    end

    assert_response :created
    assert Animal.last.photos.attached?
  end

  private

  def get_auth_headers
    # Simulate login to get a token
    post "/api/v1/login", params: { email: @user.email, password: "password" }
    assert_response :success, "Login failed in test setup"
    token = JSON.parse(response.body)["token"]
    { "Authorization" => "Bearer #{token}" }
  end
end