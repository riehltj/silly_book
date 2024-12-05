class Catalog < ApplicationRecord
  class << self
    primary_key = :book_id # Assumes book id is the primary key

    def ransackable_attributes(_auth_object = nil)
      %w[author_name book_id book_name genre_name]
    end
  end
end
