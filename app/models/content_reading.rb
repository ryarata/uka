# == Schema Information
#
# Table name: content_readings
#
#  id            :bigint(8)        not null, primary key
#  readable_id   :integer          not null
#  readable_type :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ContentReading < ActiveRecord::Base
	belongs_to :readable,polymorphic: true,optional: true
	has_many :readings,dependent: :destroy
end
