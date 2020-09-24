# == Schema Information
#
# Table name: icons
#
#  id                :bigint(8)        not null, primary key
#  iconable_id       :integer          not null
#  iconable_type     :string(255)      not null
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Icon < ActiveRecord::Base
	belongs_to :iconable,polymorphic: true,optional: true

	if Rails.env == "production"
		has_attached_file :file,
		                  :styles => { :medium => "300x300#", :thumb => "100x100#" },
	                      :storage => :s3,
			              :preserve_files => true,
					      :s3_credentials => "#{Rails.root}/config/s3.yml",
					      :path => ":class/:attachment/:id_partition/:style/:filename",
					      :url => ":class/:attachment/:id_partition/:style/:filename"
	elsif Rails.env == "development"
		has_attached_file :file,
	                    :styles => { :medium => "300x300#", :thumb => "100x100#" }
	end
	validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/

	after_create :check_and_delete

	def check_and_delete
		self.destroy if self.file_file_name.blank?
	end
end
