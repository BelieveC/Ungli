class Associate < ActiveRecord::Base
	belongs_to :user
	belongs_to :project, class_name: "Story"
end
