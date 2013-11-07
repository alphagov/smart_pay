require 'test_helper'

describe SmartPay::Response do
  before do
    SmartPay.test_mode = true
    @shared_key = "Kah942*$7sdp0)"
    @parameters = {
      :merchant_reference => "Internet Order 12345",
      :skin_code => "4aD37dJA",
      :shopper_locale => "en_GB",
      :auth_result => "AUTHORISED",
      :psp_reference => "1211992213193029",
      :merchant_sig => "ytt3QxWoEhAskUzUne0P5VA9lPw="
    }
  end
  it "should verify the response parameters" do
    response = SmartPay::Response.new(@shared_key, @parameters)
    assert response.verified, "Merchant signature is incorrect"
  end
end
