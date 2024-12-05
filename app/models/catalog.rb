class Catalog < ApplicationRecord
  class << self
    primary_key = :book_id # Assumes book id is the primary key

    def ransackable_attributes(_auth_object = nil)
      %w[book_id author_name book_name genre_name]
    end

    def ransackable_associations(_auth_object = nil)
      []
    end
  end
end
