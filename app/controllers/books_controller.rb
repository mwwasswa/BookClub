class BooksController < ProtectedController
  # use ProtectedController so that the user has to sign in to access app features
  before_action :set_book, only: %i[show]

  # GET /books
  def index
    # @books = Book.all
    @books = current_user.books.all
    # only an authenticated user should be able to see a book.
    render json: @books
  end

  # GET /books/1
  def show
    @book = current_user.book
    render json: @book
  end

  # POST /books
  def create
    # @book = Book.new(book_params)
    @book = current_user.books.build(books_params)
    # only an authenticated user should be able to create a new book within
    # their account.

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    @book = current_user.books.find(params[:id])
    # only the signed in and current_user is able to update a book
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book = current_user.books.find(params[:id])
    # only the signed in and current_user is able to delete a book
    @book.destroy
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:genre, :title, :author, :user_id)
    end
end
