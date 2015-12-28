class GiftsController < ApplicationController
  before_action :init_secret_santa

  def index
  end

  def create
    if @secret_santa.generate
      cookies[:_ga] = '4oR1egxp1scG2osPTA9Zgg'
    end
    render :index
  end

  private

  def init_secret_santa
    @secret_santa = SecretSantaGenerator.new(params, cookies)
  end
end
