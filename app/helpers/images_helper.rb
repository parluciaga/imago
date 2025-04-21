module ImagesHelper
  def orientation_icon(image)
    return nil unless image.picture.attached?

    case orientation(image)
    when "square"
      content_tag(:span, nil, class: "material-icons", title: "Square Image") do
        "crop_square"
      end
    when "landscape"
      content_tag(:span, nil, class: "material-icons", title: "Landscape Image") do
        "crop_landscape"
      end
    when "portrait"
      content_tag(:span, nil, class: "material-icons", title: "Portrait Image") do
        "crop_portrait"
      end
    end
  end

  def orientation(image)
    attachment = image.picture
    width = attachment.metadata[:width] || analyzer(attachment)[:width]
    height = attachment.metadata[:height] || analyzer(attachment)[:height]
    if width == height
      "square"
    elsif width > height
      "landscape"
    else
      "portrait"
    end
  end

  def analyzer(attachment)
    ActiveStorage::Analyzer::ImageAnalyzer::Vips.new(attachment.blob).metadata
  end
end
