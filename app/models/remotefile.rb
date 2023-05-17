class Remotefile < ApplicationRecord
	belongs_to :fileable, polymorphic: true
end
