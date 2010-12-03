module ApplicationHelper
  
  def title
    base_title = "Ruby on rails sample App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end 
  end
  
  def logo
    image_tag("Kaargo_logo.png", :alt=> 'Sample App', :class => 'round')
  end
  
  
end
