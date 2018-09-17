require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in users(:jc)
  end

  test "invite friend" do
    assert_difference 'ActionMailer::Base.deliveries.size', +1 do
      post invite_friend_url, params: { email: 'friend@example.com' }
    end
    invite_email = ActionMailer::Base.deliveries.last

    assert_equal "You have been invited by jc@example.com", invite_email.subject
    assert_equal 'friend@example.com', invite_email.to[0]
    assert_match(/Estas siendo invitado a nuestra aplicación por jc@example.com/, invite_email.body.to_s)
  end
end
