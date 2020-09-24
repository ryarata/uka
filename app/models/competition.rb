# == Schema Information
#
# Table name: competitions
#
#  id               :bigint(8)        not null, primary key
#  user_id          :integer          not null
#  title            :string(255)      not null
#  description      :text(65535)
#  apply_guideline  :text(65535)
#  competition_type :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Competition < ActiveRecord::Base
	belongs_to :user
	has_one :movie,as: :movable,dependent: :destroy
	has_many :category_contents,as: :categorable,dependent: :destroy
	has_many :votes,as: :votable,dependent: :destroy
	has_many :competition_entries
	has_one :content_reading,as: :readable,dependent: :destroy

	accepts_nested_attributes_for :movie

	after_create :create_content_reading

	def create_content_reading
		if self.content_reading.blank?
			cr = self.build_content_reading
			cr.save
		end
	end

	#competition_type
	# 1. idea
	# 2. recruit

	def get_competition_type_text
		case self.competition_type
		when 1
			return "IDEA"
		when 2
			return "RECRUIT"
		end
	end

	def create_content_reading
		if self.content_reading.blank?
			cr = self.build_content_reading
			cr.save
		end
	end
end
