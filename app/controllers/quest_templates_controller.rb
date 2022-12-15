class QuestTemplatesController < ApplicationController
  def index
    @quest_templates = QuestTemplate.all
  end

  def new
    @quest_template = QuestTemplate.new
  end

  def create
    @quest_template = QuestTemplate.new(quest_template_params)

    if @quest_template.save
      redirect_to quest_templates_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @quest_template = QuestTemplate.find params[:id]
  end

  def update
    @quest_template = QuestTemplate.find(params[:id])

    if @quest_template.update(quest_template_params)
      redirect_to quest_templates_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quest_template = QuestTemplate.find(params[:id])
    @quest_template.destroy

    redirect_to quest_templates_path, status: :see_other
  end

  private

  def quest_template_params
    params.require(:quest_template).permit(:title, :description)
  end
end
