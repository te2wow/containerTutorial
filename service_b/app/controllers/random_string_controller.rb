class RandomStringController < ApplicationController
    def show
        render json: { random_string: $random_string }
    end
end
