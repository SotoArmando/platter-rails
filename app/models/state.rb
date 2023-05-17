class State < ApplicationRecord
	has_many :status, as: :statusable
	has_many :remotefiles, as: :fileable
  belongs_to :session
end
