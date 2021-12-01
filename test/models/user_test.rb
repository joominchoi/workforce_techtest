require 'test_helper'

class UserTest < ActiveSupport::TestCase
    
  test "valid_user" do
        user = User.create(name: "JooMin Choi", email_address: "joominchoi@gmail.com", organisation_id: nil, password_digest: "nimooj")
        assert user.errors.any?, user.errors.full_messages
  end

  test "no_name" do
      user = User.create(name: "", email_address: "joominchoi@gmail.com", organisation_id: nil, password_digest: "nimooj")
      assert user.errors.any?, "signed up with no name"
  end

  test "no_email" do
      user = User.create(name: "JooMin Choi", email_address: "", organisation_id: nil, password_digest: "nimooj")
      assert user.errors.any?, "signed up with no email"
  end

  test "invalid_email" do
      user = User.create(name: "JooMin Choi", email_address: "joominchoigmail.com", organisation_id: nil, password_digest: "nimooj")
      assert user.errors.any?, "signed up with invalid email"
  end

  test "no_password" do
    user = User.create(name: "JooMin", email_address: "joominchoi@gmail.com", organisation_id: nil, password_digest: "")
    assert user.errors.any?, "signed up with no password"
  end

  test "password_too_short" do
      user = User.create(name: "JooMin Choi", email_address: "joominchoi23@gmail.com", organisation_id: nil, password_digest: "nimoo")
      assert user.errors.any?, "signed up with a password with less than 6 characters"
  end

  

  end