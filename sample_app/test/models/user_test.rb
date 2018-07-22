require 'test_helper'

class UserTest < ActiveSupport::TestCase

    def setup
        @user = User.new(name: "Example User", email:
                         "user@example.com")
    end

    # Runs all the specified local validations and returns
    # true if no errors were added, otherwise false. Runs
    # local validations (eg those on your Active Resource
    # model), and also any errors returned from the remote
    # system the last time we saved.  Remote errors can only 
    # be cleared by trying to re-save the resource.
    test "should be vaild" do
        assert @user.valid?
    end

    # found in app/models/user.rb 
    # validates :name, presence: true
    # makes valid? return true if a name is present
    # which will cause this test to file when its 
    # actually correct.
    test "name should be present" do
        @user.name = ""
        assert_not @user.valid?
    end

    test "email should be present" do
        @user.email = "     "
        assert_not @user.valid?
    end

    test "name should not be too long" do
        @user.name = "a" * 51
        assert_not @user.valid?
    end

    # test email.length < 255
    test "email should not be too long" do
        @user.email = "a" * 244 + "@example.com"
        assert_not @user.valid?
    end

    # test these email addresses are vaild
    test "email validation should accept valid addresses" do
        valid_addresses = %w[user@example.com
                             USER@foo.COM
                             A_US-ER@foo.bar.org
                             first.last@foo.jp
                             alice+bob@baz.cn]
        valid_addresses.each do |valid_address|
            @user.email = valid_address
            assert @user.valid?, "#{valid_address.inspect} should be valid"
        end
    end

    # test these email addresses are NOT valid
    test "email validation should reject invalid addresses" do
        invalid_addresses = %w[user@xample,com
                               user_at_foo.org
                               user.name@example.
                               foo@bar_baz.com
                               foo@bar+baz.com
                               foo@bar..com]
        invalid_addresses.each do |invalid_address|
            @user.email = invalid_address
            assert_not @user.valid?, "#{invalid_address.inspect}
                                      should be invalid"
        end
    end
                                
end
