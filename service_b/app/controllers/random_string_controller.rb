class RandomStringController < ApplicationController
    def show
      random_string = $random_string
  
      # レスポンスを返す前にログに記録
      Rails.logger.info("Generated random string: #{random_string}")
  
      render json: { random_string: random_string }
    end
  end