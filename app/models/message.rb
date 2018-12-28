# == Schema Information
#
# Table name: messages
#
#  id         :bigint(8)        not null, primary key
#  room_id    :integer          not null
#  user_id    :integer          not null
#  content    :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ActiveRecord::Base
	belongs_to :user
	belongs_to :room
end
