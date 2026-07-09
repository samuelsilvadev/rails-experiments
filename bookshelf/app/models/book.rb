# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer          not null
#
# Indexes
#
#  index_books_on_author_id  (author_id)
#
# Foreign Keys
#
#  author_id  (author_id => authors.id)
#
class Book < ApplicationRecord
  belongs_to :author

  validates :title, presence: true
end
