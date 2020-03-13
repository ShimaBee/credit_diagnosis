class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :description
      t.string :image_path
      t.string :public_site_url
      t.float :age
      t.float :points
      t.float :miles
      t.float :annual_fee

      t.timestamps
    end
  end
end
