class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |p|
      p.string :title
      p.string :poem
      p.string :author
      p.string :date_created
      p.integer :user_id
      p.timestamps null: false
    end
  end
end
