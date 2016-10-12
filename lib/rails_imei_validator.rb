require 'active_model'

class RailsImeiValidator
  def valid(imei)
      return false if imei.blank?
      digits = imei.reverse.chars.map(&:to_i)
      digits.each_with_index.inject(0) do |sum, (digit, i)|
        digit *= 2 if i.odd?
        digit -= 9 if digit > 9
        sum += digit
      end
  end

  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid) unless valid(imei)
  end
end
