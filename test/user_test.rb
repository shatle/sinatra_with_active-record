class UserTest < Minitest::Test

  def setup
    User.delete_all
  end

  def test_register
    assert_equal RESPONSE_CODE::PWD_ILLEGAL, User.register('Tom', 'email', '123', '1234')
    assert_equal RESPONSE_CODE::PARAMS_ILLEGAL, User.register('Tom', nil, '123', '123')
    assert_equal RESPONSE_CODE::PARAMS_ILLEGAL, User.register('To', "example@ee.com", '123456', '123456')
    assert_equal RESPONSE_CODE::PARAMS_ILLEGAL, User.register('Tom', "example", '123456', '123456')
    assert_equal RESPONSE_CODE::PARAMS_ILLEGAL, User.register('Tom@tom', "example@ee.com", '123456', '123456')
    assert_equal true, User.register('Tom', "example@ee.com", '123456', '123456').is_a?(User)
  end

  def test_login
    # register
    assert_equal true, User.register('Tom', "example@ee.com", '123456', '123456').is_a?(User)
    # login
    assert_equal RESPONSE_CODE::LOGIN_ERROR, User.login('Tom', '123457')
    assert_equal RESPONSE_CODE::LOGIN_ERROR, User.login('Tomy', '123456')
    assert_equal true, User.login('Tom', "123456").is_a?(User)
    u = User.login('example@ee.com', "123456")
    assert_equal true, u.is_a?(User)
    assert_equal true, !u.token.blank?
    # should be 10 minutes, but test delay
    assert_equal true, Time.now + 9.minutes < u.expired
    assert_equal true, Time.now + 11.minutes > u.expired
  end

  def test_auth
    # register
    assert_equal true, User.register('Tom', "example@ee.com", '123456', '123456').is_a?(User)
    # login
    u = User.login('example@ee.com', "123456")
    assert_equal true, !u.token.blank?
    # auth
    assert_equal true, User.auth(u.token) == u 
  end
end