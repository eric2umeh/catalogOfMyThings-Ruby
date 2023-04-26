require 'json'
require_relative 'book'

module BookData
  def save_books_data
    @json_book = []
    @books.each do |book_album|
      @json_book.push('publisher' => book_album.publisher, 'cover_state' => book_album.cover_state,
                      'publish_date' => book_album.publish_date)
    end
    File.write('preserve_data/book_data.json', JSON.pretty_generate(@json_book))
  end

  def load_books_data
    unless File.exist?('preserve_data/book_data.json')
      File.write('preserve_data/book_data.json',
                 JSON.pretty_generate([]))
    end
    JSON.parse(File.read('preserve_data/book_data.json')).map do |book_album|
      @books << Book.new(book_album['publisher'], book_album['cover_state'], book_album['publish_date'])
    end
  end
end
