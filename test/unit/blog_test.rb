require 'test_helper'

class BlogTest < ActiveSupport::TestCase

    test "Blog must have a name" do
        assert false, "Cannot create blog without a name" if Blog.create() == true
    end

end
