class Api::V1::BooksController < ApplicationController
  def index
    render json: Book.all
  end

  def create
    book = Book.new(book_params)

    if book.save
      render json: book, staus: :created
    else
      render json: book.errors, staus: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author)
  end
end
