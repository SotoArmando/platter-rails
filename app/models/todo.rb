class Todo < ApplicationRecord
  belongs_to :session
		has_and_belongs_to_many :recipes
end
