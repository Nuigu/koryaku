class Flowchart < ApplicationRecord
  # Validations
  with_options presence: do
    validates :title, :goal, :category_id
  end

  # Associations
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end
