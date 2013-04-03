class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end
    
    create_table :blogs_tags, :id => false do |t|
      t.integer :blog_id
      t.integer :tag_id
    end
    
  end
end
