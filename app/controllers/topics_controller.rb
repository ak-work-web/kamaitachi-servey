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

  def edit
    @topic = Topic.find(params[:id])
    # 現在の選択肢が3つ未満なら、3つになるまで空の箱を作る
    (5 - @topic.choices.count).times { @topic.choices.build }
  end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update(topic_params)
      redirect_to topics_path, notice: "お題を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    redirect_to topics_path, status: :see_other, notice: "お題を削除しました"
  end

  private

  def topic_params
    # params.require(:topic).permit(:title, :description)
    # choices_attributes という名前で、content を受け取ることを許可する
    params.require(:topic).permit(:title, :description, choices_attributes: [:id, :content])
  end
end
