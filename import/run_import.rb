#!/usr/bin/ruby

require 'rubygems'
require '../config/environment'
require 'csv'
require 'iconv'
require 'roo'
require 'digest/md5'

items_processed = Array.new

start = ARGV[0].to_i
counter = 0
start = 2 if start == nil or start < 2
excel = Roo::Excel.new('import.xls')
line = 2
while !excel.cell(line,1).blank? do
    line = line + 1
end

# get field lists from excel
fields = Array.new

custom_fields_const = 13

custom_field_start = custom_fields_const
while (!excel.cell(1,custom_field_start).blank?) do
    fields << excel.cell(1,custom_field_start)
    custom_field_start = custom_field_start + 1
end

start.upto(line-1) do |l|
        notices = ""
        collection_id = excel.cell(l,1).to_i
        name = excel.cell(l,2)
        year = excel.cell(l,3).to_i
        cost = excel.cell(l,4).to_f
        virtualcollections = Array.new
        virtualcollections = excel.cell(l,5).split(",") if !excel.cell(l,5).blank?
        platforms = excel.cell(l,6).split(",")
        conditions = excel.cell(l,7).split(",")
        categories = excel.cell(l,8).split(",")
        rolodexes = excel.cell(l,9).split(",")
        reference_number = excel.cell(l,10)
        inside = excel.cell(l,11)
        mainimage_filename = excel.cell(l,12)

        # custom
        tempcounter = custom_fields_const
        fieldoptions = Array.new
        fields.each do |field|
            fieldoptions << excel.cell(l,tempcounter) if !excel.cell(l,tempcounter).blank?
            fieldoptions << "" if excel.cell(l,tempcounter).blank?
            tempcounter = tempcounter + 1
        end

        thing = Thing.find_or_create_by_collection_id(:collection_id => collection_id, :name => name)

        thing.year = year
        thing.cost = cost
        thing.name = name
        thing.inside_id = inside
        thing.reference_number = reference_number

        if thing.save

        counter = counter + 1

        # virtual collections
        thing.virtualcollection_ids = Array.new
        virtualcollections.each do |virtual|
            thing.virtualcollections << Virtualcollection.find_or_create_by_name(:name => virtual.strip)
        end

        # platforms
        thing.platform_ids = Array.new
        platforms.each do |platform|
            thing.platforms << Platform.find_or_create_by_name(:name => platform.strip)
        end

        # conditions
        thing.condition_ids = Array.new
        conditions.each do |condit|
            thing.conditions << Condition.find_or_create_by_name(:name => condit.strip)
        end

        # categories
        thing.category_ids = Array.new
        categories.each do |cat|
            thing.categories << Category.find_or_create_by_name(:name => cat.strip)
        end

        # rolodexes
        thing.rolodex_ids = Array.new
        rolodexes.each do |rolo|
            thing.rolodexes << Rolodex.find_or_create_by_name(:name => rolo.strip)
        end

        # main image
        if !mainimage_filename.blank? then
            # does the file actually exist
            if File.exist?(mainimage_filename) then
                # get the md5
                md5=Digest::MD5.hexdigest(File.read(mainimage_filename))
                # test against the existing thing mainimage
                thingmd5 = ''
                if !thing.mainimage.blank? then
                    thingmd5=Digest::MD5.hexdigest(File.read(thing.mainimage.current_path.to_s))
                end
                if md5 != thingmd5 then
                    thing.mainimage = File.open(mainimage_filename)
                    notices = "[I]"
                    thing.save!
                end
            else
                notices = "[F]"
            end
        end

        # dynamic fields
        thing.fieldoption_ids = Array.new
        fieldcounter = 0
        fields.each do |field|
            # get the thingfield
            thingfield = Thingfield.find_or_create_by_name(:name => field)
            # check each option on the line
            fieldoptions[fieldcounter].to_s.split(",").each do |fieldoption|
                option_object = nil
                # see if this thing field has this option by name
                    thingfield.fieldoptions.each do |option|
                    if option.name == fieldoption.strip then
                        option_object = option
                    end
                end
                # we did not find the fieldoption
                if option_object == nil then
                    temp = Fieldoption.new
                    temp.name = fieldoption.strip
                    temp.thingfield_id = thingfield.id
                    temp.save!
                    option_object = temp
                end
                thing.fieldoptions << option_object
                # does this thingfield have a fieldoption with this name
            end
            fieldcounter = fieldcounter + 1
        end

        puts "[" + counter.to_s  + "/" + (line-2).to_s + "] " + " Collection ID : " + collection_id.to_s + " - " + name + " " + notices

        end

end

        # clean up

        Virtualcollection.all.each do |virt|
            virt.destroy if virt.can_be_removed
        end

        Condition.all.each do |cond|
            cond.destroy if cond.can_be_removed
        end

        Category.all.each do |cat|
            cat.destroy if cat.can_be_removed
        end

        Platform.all.each do |plat|
            plat.destroy if plat.can_be_removed
        end

        Fieldoption.all.each do |fieldoption|
            fieldoption.destroy if fieldoption.can_be_removed
        end

        Platform.all.each do |plat|
            puts plat.name  + " - " + plat.things.count.to_s
        end


