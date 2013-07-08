module CarrierWave
  module RMagick

    def quality(percentage)
      manipulate! do |img|
        img.write(current_path){ self.quality = percentage } unless img.quality == percentage
        img = yield(img) if block_given?
        img
      end
    end


def watermark
	manipulate! do |source|
	txt = Magick::Draw.new
	#txt.font = "Arial"
	txt.pointsize = 12
	txt.gravity = Magick::SouthEastGravity
	txt.stroke = "#222"
	end
end

end
end
