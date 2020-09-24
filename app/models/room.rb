# == Schema Information
#
# Table name: rooms
#
#  id         :bigint(8)        not null, primary key
#  room_name  :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Room < ActiveRecord::Base
	has_many :room_members,dependent: :destroy
	has_many :messages,dependent: :destroy

end
