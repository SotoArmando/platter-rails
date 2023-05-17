class Recipe < ApplicationRecord
	has_many :remotefiles, as: :fileable
		has_and_belongs_to_many :libraries
		has_and_belongs_to_many :todos
		has_and_belongs_to_many :ingredients
		has_and_belongs_to_many :categories
		has_and_belongs_to_many :remotefiles
	has_many :histories, as: :historiable
  belongs_to :session
  belongs_to :file
end
