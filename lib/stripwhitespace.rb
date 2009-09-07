module ActiveRecord
  class Base
    before_validation(:_clean_whitespace)
    before_save(:_clean_whitespace)
    
    def _clean_whitespace
      self.attributes.each_pair do |key, value|
        logger.debug("stripping #{key.to_s} wih value #{value.to_s}")
        self[key] = value.strip if value.respond_to?('strip')
      end
    end
  end
end
