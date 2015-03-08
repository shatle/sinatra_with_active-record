

class UserTest < Minitest::Test

  def setup
    User.delete_all
  end

  def test_register
    assert_equal RESPONSE_CODE::PWD_ILLEGAL, User.register('Tom', 'email', '123', '1234')
    assert_equal RESPONSE_CODE::PARAMS_ILLEGAL, User.register('Tom', nil, '123', '123')
    assert_equal true, User.register('Tom', "email", '123', '123').is_a?(User)
  end

end