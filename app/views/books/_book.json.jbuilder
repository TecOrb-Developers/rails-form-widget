json.code 200
json.data do
  json.extract! book, :id, :title, :auther, :published_at, :created_at, :updated_at
  json.url book_url(book, format: :json)
end