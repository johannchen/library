class BooksController < ApplicationController
  before_filter :authorize
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.search(params[:search_term])
    @mybooks = current_user.books
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  def create
    book = Book.find_by_id(params[:book_id])
    if book
      current_user.books << book
    else
      # insert google book to Book
      gbook= GoogleBooks.search(params[:book_id]).first
      mybook = Book.new
      mybook.google_id = gbook.id
      mybook.title = gbook.title
      mybook.authors = gbook.authors
      mybook.description = gbook.description
      mybook.publisher = gbook.publisher
      mybook.published_date = gbook.published_date
      mybook.isbn_10 = gbook.isbn_10
      mybook.isbn_13 = gbook.isbn_13
      mybook.image_link = gbook.image_link
      mybook.preview_link = gbook.preview_link
      mybook.save
      # assign inserted book to user
      current_user.books << mybook
    end
    redirect_to books_path
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :authors, :description, :publisher)
    end
end
