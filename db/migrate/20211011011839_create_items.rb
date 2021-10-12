class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string       :title,            null: false
      t.text         :content,          null: false
      t.integer      :price,            null: false
      t.references   :user,             null: false,  foreign_key: true
      t.integer      :condition_id,     null: false
      t.integer      :method_id,        null: false
      t.integer      :prefecture_id,    null: false
      t.integer      :deliverydays_id,  null: false
      t.integer      :category_id,      null: false
      t.timestamps
    end
  end
end