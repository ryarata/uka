# == Schema Information
#
# Table name: room_members
#
#  id         :bigint(8)        not null, primary key
#  room_id    :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RoomMember < ActiveRecord::Base
	belongs_to :user
	belongs_to :room
end
