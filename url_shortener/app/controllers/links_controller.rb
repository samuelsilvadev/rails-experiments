class LinksController < ApplicationController
  def index
    @links = Link.all.order(created_at: :desc)

    if request.headers['hx-request']
      render partial: 'links/list', locals: { links: @links }
    else
      render :index, locals: { links: @links }
    end
  end

  def create
    link = Link.new(link_params)

    if link.save
      if request.headers['hx-request']
        index
      else
        render json: link, status: :created
      end
    else
      render status: :unprocessable_entity
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
