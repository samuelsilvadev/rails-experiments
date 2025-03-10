class LinksController < ApplicationController
  def index
    @links = Link.recent_first

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

  def destroy
    link = Link.find_by(id: params[:id])

    if link.present?
      if link.destroy
        if request.headers['hx-request']
          index
        else
          render status: :no_content
        end
      else
        render status: :unprocessable_entity
      end
    else
      render status: :not_found
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
