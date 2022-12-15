class RenameQuestsToQuestTemplates < ActiveRecord::Migration[7.0]
  def change
    rename_table :quests, :quest_templates
  end
end
