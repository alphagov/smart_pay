require 'base64'
require 'openssl'

module SmartPay
  class HmacCalculator
    def initialize(psk, parameters)
      @psk = psk
      @parameters = parameters
    end

    def signature
      raise_if_key_missing
      hmac = OpenSSL::HMAC.digest('sha1', @psk, @parameters.join)
      Base64.encode64(hmac)
    end

    def verify(merchant_sig)
      raise_if_key_missing
      "#{merchant_sig}\n" == signature
    end

    private

    def raise_if_key_missing
      raise "missing or empty pre-shared key" unless @psk && @psk.length > 0
    end
  end
end
