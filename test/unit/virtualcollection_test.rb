require 'test_helper'

class VirtualcollectionTest < ActiveSupport::TestCase

    test "Virtual Collections must have a name" do
        assert false, "Cannot create a virtual collection without a name" if Virtualcollection.create() == true
    end

end
