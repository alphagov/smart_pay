## SmartPay

Provides HMAC signing and verification when passing parameters
to and from Barclays SmartPay hosted payment pages.

More information can be found in the [SmartPay hosted payment process integration guide](http://www.barclaycard.com/smartpay/documentation/pdf/SmartPay_HPP_IntegrationGuide.pdf)

### Usage
```
req = SmartPay::Request.new("Kah942*$7sdp0)", { 
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
})
req.hmac_signature # => 'x58ZcRVL1H6y+XSeBGrySJ9ACVo=\n'


res = SmartPay::Response.new("Kah942*$7sdp0)", {
  :merchant_reference => "Internet Order 12345",
  :skin_code => "4aD37dJA",
  :shopper_locale => "en_GB",
  :auth_result => "AUTHORISED",
  :psp_reference => "1211992213193029",
  :merchant_sig => "ytt3QxWoEhAskUzUne0P5VA9lPw="
})
res.verified # => true
```
