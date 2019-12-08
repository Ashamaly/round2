class CreateJoinTableBooksPurchase < ActiveRecord::Migration[5.2]
  def change
    create_join_table :books, :purchases do |t|
      t.references :book, foreign_key: true
      t.references :purchase, foreign_key: true
    end
  end
end
