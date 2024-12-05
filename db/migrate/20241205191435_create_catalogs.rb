class CreateCatalogs < ActiveRecord::Migration[7.1]
  def change
        create_view :catalogs, materialized: false, sql_definition: <<-SQL
          SELECT 
            books.id AS book_id,
            books.title AS book_name,
            authors.name AS author_name,
            genres.name AS genre_name
          FROM 
            books
          INNER JOIN 
            authors ON books.author_id = authors.id
          INNER JOIN 
            genres ON books.genre_id = genres.id
        SQL
  end
end
