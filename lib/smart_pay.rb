require 'smart_pay/request'
require 'smart_pay/response'

module SmartPay

  def self.test_mode=(test_mode)
    @@test_mode = test_mode
  end

  def self.test_mode
    !!@@test_mode
  end

  def self.ordered_parameters(ordered_keys, parameters)
    [].tap do |ary|
      ordered_keys.each do |k|
        ary << parameters[k] if parameters[k]
      end
    end
  end
end
