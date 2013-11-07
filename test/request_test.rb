require 'test_helper'

describe SmartPay::Request do
  before do
    SmartPay.test_mode = true
    @shared_key =  "Kah942*$7sdp0)"
    @parameters = {
      :merchant_reference => "Internet Order 12345",
      :payment_amount => 10000,
      :currency_code => "GBP",
      :ship_before_date => "2007-10-20",
      :skin_code => "4aD37dJA",
      :merchant_account => "TestMerchant",
      :shopper_locale => "en_GB",
      :order_data => "H4sIAAAAAAAAALMpsOPlCkssyswvLVZIz89PKVZIzEtRKE4tKstMTi3W4+Wy0S+wAwDOGUCXJgAAAA==",
      :session_validity => "2007-10-11T11:00:00Z",
      :merchant_signature => "yARtfsxD47jeXzOlEyZ0j3pg="
    }
  end

  # Based on example in http://www.barclaycard.com/smartpay/documentation/pdf/SmartPay_HPP_IntegrationGuide.pdf
  it "should calculate the correct hmac signature" do
    request = SmartPay::Request.new(@shared_key, @parameters)
    assert_equal "x58ZcRVL1H6y+XSeBGrySJ9ACVo=\n", request.hmac_signature
  end

  it "should use the appropriate request URL" do
    SmartPay.test_mode = false
    assert_equal SmartPay::Request::LIVE_URL, SmartPay::Request.new(nil).request_url
    SmartPay.test_mode = true
    assert_equal SmartPay::Request::TEST_URL, SmartPay::Request.new(nil).request_url
  end
end
