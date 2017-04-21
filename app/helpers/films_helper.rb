module FilmsHelper
  
  def film_image_url(title)
    title.split.join("").downcase + ".png"
  end
end
