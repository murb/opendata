require 'test_helper'

class ContactTest < ActionMailer::TestCase
  test "contact" do
    @expected.subject = 'Contact#contact'
    @expected.body    = read_fixture('contact')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Contact.create_contact(@expected.date).encoded
  end

end
