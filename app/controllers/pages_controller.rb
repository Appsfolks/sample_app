class PagesController < ApplicationController
  def home
  end

  def contact
    @title = "contact"
  end
  
  def about
    @title = "about"
  end

end
