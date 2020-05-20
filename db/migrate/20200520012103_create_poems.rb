class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |p|
      t.string :title
      t.string :poem
      t.string :author
  end
end
