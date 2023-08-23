class Task < ApplicationRecord
  # Validations
  with_options presence: do
    validates :title, :time, :position
  end

  # Association
  belongs_to :flowchart
end
