class SearchService
  
  attr_reader :query, :library
  
  def initialize(params)
    @library = Library.find(params[:library_id])
    @query = params[:query]
    @search_field = params[:search_field]
    @books = find_books
  end
  
  def book_exists?
    # does the book exist in either result set?
    !!(count > 0)
  end
  
  def count
    results(:library).size + results(:interlibrary_loan).size
  end
  
  def valid?
    # is this a valid search?
    !!(@library && !@query.blank? && ['ISBN', 'title'].include?(@search_field))
  end
  
  # location can be :library or :interlibrary_loan
  def results(location=:library)
    
    if location == :library
      # filter out any book that the library doesn't directly have
      # memoize the results
      @libbooks ||= @books.reject {|book| !@library.has_book?(book.id) }
      return @libbooks
    elsif location == :interlibrary_loan
      # filter out any book that doesn't belong to at least one library
      # and any books that the main library already has
      @interlib ||= @books.reject {|book| book.libraries.empty? || book.has_library?(@library.id) }
      return @interlib
    end
    
  end
  
  def search_field_humanized
    case @search_field
    when 'ISBN'
      'ISBN #'
    when 'title'
      'title'
    end
  end
  
  private
  
  def find_books
    if @search_field == 'ISBN'
      return Book.where(ISBN: @query)
    elsif @search_field == 'title'
      return Book.where(["title LIKE ?", "%#{@query}%"])
    end
  end
  
end