class Comment < ApplicationRecord
  belongs_to :users
  belongs_to :publication
end
