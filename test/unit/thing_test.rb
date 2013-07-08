require 'test_helper'

class ThingTest < ActiveSupport::TestCase
    test "Thing has a name" do
        assert false, "Cannot create thing without a name" if Thing.create() == true
    end

    test "Value must be cost if not set" do
        thing = Thing.new
        thing.name = "TEST"
        thing.cost = 12.00
        thing.value = 0.00
        thing.save
        assert false, "Value is not correctly set to the default" if thing.cost != thing.value
    end
end
