class Site < ActiveRecord::Base

      attr_accessible :code, :title, :meta_keywords, :meta_description, :email, :owner, :username, :password

end
