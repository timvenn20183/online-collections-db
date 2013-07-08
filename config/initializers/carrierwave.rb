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
	title = '(c) oldcomputers.co.za'
	#source = source.resize_to_fill(400, 400).border(10, 10, "black")
	source.annotate(txt, 0, 0, 0, 0, title)
	end
end

end
end