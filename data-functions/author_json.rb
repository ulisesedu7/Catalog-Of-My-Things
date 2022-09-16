require 'json'
require_relative '../methods/author'

module AuthorJson
  def write_authors_data
    data = if @authors.length.positive?
             @authors.map do |author|
               { first_name: author.first_name, last_name: author.last_name }
             end
           else
             []
           end
    authors_file = File.open('./data-storage/authors.json', 'w')
    authors_file.write(JSON.pretty_generate(data))
    authors_file.close
  end

  def read_authors_from_file
    if File.exist?('./data-storage/authors.json')
      authors_file = File.open('./data-storage/authors.json')
      data = JSON.parse(authors_file.read)
      data.each do |element|
        @authors << Author.new(element['first_name'], element['last_name'])
      end
      authors_file.close
    else
      @authors = []
      write_authors_data
    end
  end
end
