class Annotation < ApplicationRecord

  scope :by_annotation, -> (title) { where('title LIKE ?', "%#{title}") }
  scope :by_body, -> (body) { where('body LIKE ?', "%#{body}") }
end
