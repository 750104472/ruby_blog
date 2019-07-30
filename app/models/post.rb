class Post < ApplicationRecord
	serialize :tags
	belongs_to :category
end