class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:about, :crisis]

  def about
  end

  def crisis
  end
end
