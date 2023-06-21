class Blog < ApplicationRecord
	has_many :remotefiles, as: :fileable
		has_and_belongs_to_many :remotefiles
		has_and_belongs_to_many :tags
	has_many :histories, as: :historiable
  belongs_to :session
  belongs_to :remotefile, optional: true
end
