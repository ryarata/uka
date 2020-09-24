# == Schema Information
#
# Table name: readings
#
#  id                 :bigint(8)        not null, primary key
#  content_reading_id :integer          not null
#  user_id            :integer          not null
#  reading_type       :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Reading < ActiveRecord::Base
	belongs_to :content_reading
	belongs_to :user,optional: true

	#rading_type
	#1. read
	#2. comment
	#3. vote
	#4. apply
	#5 .destroy_apply

	def get_reading_type_text
		case self.reading_type
		when 1
			return "閲覧"
		when 2
			return "コメント"
		when 3
			return "投票"
		when 4
			return "参加申込"
		when 5
			return "申込取消"
		end
	end
end
