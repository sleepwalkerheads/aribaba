class HomeController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @cards = Card.find(:all, :conditions => { :user_id => current_user.id })
  end
end
