require "active_record"

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "lists/chores.db"
  )

class CreateChoresTable < ActiveRecord::Migration[5.0]

  def up
    create_table :chores do |t|
      t.string :name
      t.text :description
    end
  end

  def down
      drop_table :chores
    end

end

class CreateListsTable < ActiveRecord::Migration[5.0]

  def up
    create_table :lists do |t|
      t.string :name
    end
  end

  def down
    drop_table :lists
  end

end
