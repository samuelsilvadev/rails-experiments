class LinksController < ApplicationController
  def index
    @links = Link.all

    if request.headers["hx-request"]
      render partial: "links/list", locals: { links: @links }
    else
      render :index
    end
  end

  def create
    link = Link.new(link_params)

    if link.save
      render json: link, status: :created
    else
      render status: :unprocessable_entity
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
