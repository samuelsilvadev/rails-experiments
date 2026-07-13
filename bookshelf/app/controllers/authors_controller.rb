class AuthorsController < ApplicationController
  def index
    @authors = Author.order(:name)
  end

  def show
    author_id = params[:id]
    @author = Author.find(author_id)
  end

  def create
    author = Author.new(author_params)

    if author.save
      redirect_to root_path, notice: "Author added"
    else
      redirect_to root_path, alert: "Name cannot be empty"
    end
  end

  private

  def author_params
    params.require(:author).permit(:name)
  end
end
