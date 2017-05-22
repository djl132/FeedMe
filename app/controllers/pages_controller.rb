class PagesController < ApplicationController

  before_action :authenticate_user!

  def index
    puts "I am pages"
    @items = Item.order('created_at DESC')
  end

end
