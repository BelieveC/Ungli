class Story < ActiveRecord::Base
	acts_as_votable
	has_many :supporter,through: :relationship
	belongs_to :user
	is_impressionable
	has_attached_file :simage, styles: { medium: "300x300>"}, default_url: "/images/:style/missing.png"
 	validates_attachment_content_type :simage, content_type: /\Aimage\/.*\z/
end
