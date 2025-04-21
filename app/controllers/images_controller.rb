class ImagesController < ApplicationController
  before_action :set_image, only: [ :show ]

  def index
    @images = Image.all
  end

  def show
  end

  def edit
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to images_path, notice: "Image successfully uploaded"
    else
      flash.now[:alert] = "#{t(:errors)}: #{@image.errors.full_messages.join(', ')}"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    user = User.find_by(id: authenticated?.user_id)
    params.expect(image: [ :name, :description, :picture, comments_attributes: [ [ :body, user, :image ] ] ])
  end
end
