require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "flag" do
    mail = Notifier.flag
    assert_equal "Flag", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
