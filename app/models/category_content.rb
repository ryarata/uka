# == Schema Information
#
# Table name: category_contents
#
#  id               :bigint(8)        not null, primary key
#  category_id      :integer          not null
#  categorable_id   :integer          not null
#  categorable_type :string(255)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class CategoryContent < ActiveRecord::Base
	belongs_to :categorable,polymorphic: true,optional: true
	belongs_to :category
end
