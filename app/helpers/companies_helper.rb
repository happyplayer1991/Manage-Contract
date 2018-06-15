module CompaniesHelper
  def image_generator(height:, width:)
    "http://via.placeholder.com/#{height}x#{width}"
  end

  def company_img img, type
    if img.model.logo?
      img
    else type == 'logo'
      image_generator(height: '300', width: '300')
    end
  end
end
