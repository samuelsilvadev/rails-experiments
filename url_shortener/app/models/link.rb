# Attributes of the Link model:
# - id: integer, not null, primary key
# - url: string, not null
# - title: string
# - description: string
# - image: string
# - views_count: integer
# - created_at: datetime, not null
# - updated_at: datetime, not null
class Link < ApplicationRecord
  scope :recent_first, -> { order(created_at: :desc) }

  validates :url, presence: true
end
