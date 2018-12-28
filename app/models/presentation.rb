# == Schema Information
#
# Table name: presentations
#
#  id          :bigint(8)        not null, primary key
#  user_id     :integer          not null
#  title       :string(255)      not null
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Presentation < ActiveRecord::Base
	belongs_to :user
	has_one :movie,as: :movable,dependent: :destroy
	has_many :category_contents,as: :categorable,dependent: :destroy
	has_many :votes,as: :votable,dependent: :destroy
	has_one :content_reading,as: :readable,dependent: :destroy

	accepts_nested_attributes_for :movie

	after_create :create_content_reading

	def create_content_reading
		if self.content_reading.blank?
			cr = self.build_content_reading
			cr.save
		end
	end
end
