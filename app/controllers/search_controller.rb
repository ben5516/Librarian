class SearchController < ApplicationController
  
  before_action :set_libraries
  
  def index
  end
  
  def results
    
    # find all the books matching the search query
    @search = SearchService.new(search_params)
    
    if @search.valid?
      render 'index'
    else
      redirect_to action: 'index'    
    end
  end
  
  private
  
  def set_libraries
    @libraries = Library.all
  end
  
  def search_params
    params.permit(:library_id, :search_field, :query)
  end
  
end
