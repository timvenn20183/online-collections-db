require 'test_helper'

class PlatformTest < ActiveSupport::TestCase

    test "Platform must have a name" do
        assert false, "Cannot create platform without a name" if Platform.create() == true
    end

end
