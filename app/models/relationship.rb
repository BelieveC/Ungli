class Relationship < ActiveRecord::Base
	belongs_to :supporter,class_name: "User"
	belongs_to :backed, class_name: "Story"
end
