class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :title
      t.string :seo_url
      t.string :meta_title
      t.string :meta_description
      t.string :meta_keywords
      t.timestamps
    end
  end
end
