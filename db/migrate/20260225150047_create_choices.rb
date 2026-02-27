class CreateChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :choices do |t|
      t.references :topic, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
