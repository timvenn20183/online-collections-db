require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

    test "Category must have a name" do
        assert false, "Cannot create category without a name" if Category.create() == true
    end

end
