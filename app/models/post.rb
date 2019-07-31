class Post < ApplicationRecord
	serialize :tags
	belongs_to :category

	belongs_to :user
end