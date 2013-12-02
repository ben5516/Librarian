class LibraryBooksController < ApplicationController
  
  before_action :set_library_book, only: [:destroy, :show, :request_book]
  
  def show
  end
  
  def create
    @library_book = LibraryBook.new(library_book_params)

    respond_to do |format|
      if @library_book.save
        format.html { redirect_to @library_book.book, notice: 'Library book was successfully created.' }
        format.json { render action: 'show', status: :created, location: @library_book }
      else
        format.html { render text: 'Error creating library book.' }
        format.json { render json: @library_book.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @library_book.destroy
    respond_to do |format|
      format.html { render text: 'Library book destroyed' }
      format.json { head :no_content }
    end
  end
  
  def request_book
    @library_book.request!
    respond_to do |format|
      format.html { render text: "Book requested." }
      format.json { head :no_content }
    end
  end
  
  private
  
  def set_library_book
    @library_book = LibraryBook.find(params[:id])
  end
  
  def library_book_params
    params.require(:library_book).permit(:book_id, :library_id)
  end

end
