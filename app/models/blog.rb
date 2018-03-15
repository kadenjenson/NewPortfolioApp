class Blog < ApplicationRecord
  validates_presence_of :title, :body

  def self.by_position
    order( created_at: :desc )
  end
end
