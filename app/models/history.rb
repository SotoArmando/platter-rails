class History < ApplicationRecord
	belongs_to :historiable, polymorphic: true
  belongs_to :session
end
