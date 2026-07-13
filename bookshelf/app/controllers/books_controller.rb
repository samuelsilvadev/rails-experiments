class BooksController < ApplicationController
  def create
    author = Author.find(author_id)
    puts "Author", author.name
    author.books.create(book_params)

    redirect_to author, notice: "Book added"
  end

  def destroy
    author = Author.find(author_id)
    book_id = params[:id]
    author.books.find(book_id).destroy

    redirect_to author, notice: "Book removed"
  end

  private

  def book_params
    params.require(:book).permit(:title)
  end

  def author_id
    params[:author_id]
  end
end
