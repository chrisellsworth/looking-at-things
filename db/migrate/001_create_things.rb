class CreateThings < ActiveRecord::Migration
  def self.up
    create_table :things do |t|
      t.string :summary
      t.string :image_url
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :things
  end
end
