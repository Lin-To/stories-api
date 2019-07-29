class Api::V1::StoriesController < Api::V1::BaseController
 skip_before_action :verify_authenticity_token
 before_action :set_story, only: [:show]

  def index
    @stories = Story.all
  end

  def show
  end

  def update
    @story.update(story_params)
    if story.save
      render :show,status: :created
    else
      render_errors
    end
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      render :show, status: :created
    else
      render_errors
    end
  end


private

  def set_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:name, :text)
  end

  def render_errors
    render json: { errors: @story.errors.full_messages },
      status: :unprocessable_entity
  end
end
