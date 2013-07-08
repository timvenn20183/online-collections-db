require 'test_helper'

class ConditionTest < ActiveSupport::TestCase

    test "Condition must have a name" do
        assert false, "Cannot create condition without a name" if Condition.create() == true
    end

end
