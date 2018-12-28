# == Schema Information
#
# Table name: votes
#
#  id           :bigint(8)        not null, primary key
#  user_id      :integer          not null
#  votable_type :string(255)      not null
#  votable_id   :string(255)      not null
#  vote_type    :boolean          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Vote < ActiveRecord::Base
	belongs_to :votable,polymorphic: true,optional: true
	belongs_to :user

	def self.request_votes
		self.where(vote_type: true)
	end

	def self.evil_votes
		self.where(vote_type: false)
	end

	#vote_type
	#true request
	#false evil
end
