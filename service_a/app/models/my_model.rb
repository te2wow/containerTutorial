class MyModel < ApplicationRecord
    def self.log_message
      Rails.logger.info "This is a periodic log message from MyModel at #{Time.now}"
    end
end