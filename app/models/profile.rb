# == Schema Information
#
# Table name: profiles
#
#  id           :bigint(8)        not null, primary key
#  user_id      :integer          not null
#  user_name    :string(255)      not null
#  introduction :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Profile < ActiveRecord::Base
	belongs_to :user
	has_one :movie,as: :movable
	has_one :icon,as: :iconable
	has_one :content_reading,as: :readable
	has_many :votes,as: :votable,dependent: :destroy

	accepts_nested_attributes_for :icon,:movie

	after_create :create_content_reading

	def create_content_reading
		if self.content_reading.blank?
			cr = self.build_content_reading
			cr.save
		end
	end
end
