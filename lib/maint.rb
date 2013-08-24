    def remove_all_images
        Thing.all.each do |thing|
            thing.remove_mainimage!
            thing.save!
        end
    end

    def rebuild_all_images
        Thing.all.each do |thing|
            thing.mainimage.recreate_versions!
            thing.save
        end
    end

