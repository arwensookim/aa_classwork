class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer :answer_choices_id, null:false
      t.integer :responser_id, null:false

      t.timestamps
    end

    add_index :responses, :answer_choices_id
    add_index :responses, :responser_id
  end
end
