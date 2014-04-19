require 'test_helper'

class Api::V1::SessionsControllerTest < ActionController::TestCase

  def test_should_authorize_valid_user
    admin = users :admin
    post :create, user: { email: admin.email, password: 'welcome' }
    assert_response :success
  end

  def test_should_not_authorize_user_with_wrong_email
    unauthorized_email = 'john@example.email'
    post :create, user: { email: unauthorized_email, password: 'welcome' }
    assert_response :unauthorized
    assert_equal 'tbd', JSON.parse(response.body)['error']
  end

  def test_should_return_auth_token
    admin = users :admin

    post :create, user: { email: admin.email, password: 'welcome' }

    assert_response :success
    assert JSON.parse(response.body)['auth_token']
  end

end
