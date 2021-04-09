class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :start
      t.string :end
      t.string :remarks

      t.timestamps
    end
  end
end
