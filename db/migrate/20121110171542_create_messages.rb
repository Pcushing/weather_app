class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.text :phone

      t.timestamps
    end
  end
end
