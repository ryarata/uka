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

class CompetitionEntry < ActiveRecord::Base
	belongs_to :user
	belongs_to :competition
end
