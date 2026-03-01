class TopicsController < ApplicationController
  def index
    # @topics = Topic.all
    @topics = Topic.order(created_at: :desc)
  end

  def new
    @topic = Topic.new
    # 3つ分の空の選択肢の箱を用意する
    3.times { @topic.choices.build }
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topics_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def topic_params
    # params.require(:topic).permit(:title, :description)
    # choices_attributes という名前で、content を受け取ることを許可する
    params.require(:topic).permit(:title, :description, choices_attributes: [:content])
  end
end
