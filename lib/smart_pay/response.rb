require_relative 'hmac_calculator'

module SmartPay
  class Response

    attr_reader :parameters

    ORDERED_KEYS = [:auth_result, :psp_reference, :merchant_reference,
      :skin_code, :merchant_return_data]

    def initialize(shared_key, parameters = {})
      raise "Response signature not found" unless parameters.has_key?(:merchant_sig)
      @shared_key = shared_key
      @merchant_sig = parameters.delete(:merchant_sig)
      @parameters = SmartPay.ordered_parameters(ORDERED_KEYS, parameters) 
    end
    
    def verified
      SmartPay::HmacCalculator.new(@shared_key, @parameters).verify(@merchant_sig)
    end
  end
end
