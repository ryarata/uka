# == Schema Information
#
# Table name: movies
#
#  id                :bigint(8)        not null, primary key
#  movable_id        :integer          not null
#  movable_type      :string(255)      not null
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#  thumbnail         :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Movie < ActiveRecord::Base
	belongs_to :movable,polymorphic: true,optional: true

	if Rails.env == "production"
		has_attached_file :file,
		                  :storage => :s3,
			              :preserve_files => true,
					      :s3_credentials => "#{Rails.root}/config/s3.yml",
					      :path => ":class/:attachment/:id_partition/:style/:filename",
					      :url => ":class/:attachment/:id_partition/:style/:filename",
					      styles: { medium: { geometry: '400x300#', format: 'jpg', time: 0, auto_rotate: true },thumbnail: { geometry: '120x90#', format: 'jpg', time: 0, auto_rotate: true }},
						  :processors => [:transcoder]
	elsif Rails.env == "development"
		has_attached_file :file,
						  styles: { medium: { geometry: '400x300#', format: 'jpg', time: 0, auto_rotate: true },thumbnail: { geometry: '120x90#', format: 'jpg', time: 0, auto_rotate: true }},
						  :processors => [:transcoder]
	end
	validates_attachment_content_type :file, content_type: ["video/mp4"]

	after_create :check_and_delete

	def check_and_delete
		self.destroy if self.file_file_name.blank?
	end
end
