# rubocop:disable Lint/Syntax
require 'httparty'

class StaticPagesController < ApplicationController

  def home
    # if logged_in?
    #   @micropost  = current_user.microposts.build
    #   @feed_items = current_user.feed.paginate(page: params[:page])
    # end

    response = HTTParty.get('http://localhost:3001/random_string') # サービスBのURLを指定
    @random_string = response.parsed_response['random_string']
    
  rescue StandardError => e
    @random_string = "Error: #{e.message}"
  end

  def help
  end

  def about
  end

  def contact
  end
end
