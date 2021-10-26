class Annotation < ApplicationRecord

  enum priority: { alto: 0, medio: 1, baixo: 2}
  scope :like_value, -> (title) { where('title LIKE ? or body LIKE ?', "%#{title}%", "%#{title}%") }
end
