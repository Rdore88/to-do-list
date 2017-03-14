require "active_record"

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "lists/tasks.db"
  )

class CreateTasksTable < ActiveRecord::Migration[5.0]

  def up
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.datetime :completed_at
      t.integer :list_id
      t.datetime :created_at
    end
  end

  def down
      drop_table :tasks
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


# CreateTasksTable.migrate(:up)
# CreateListsTable.migrate(:up)
#
# CreateTasksTable.migrate(:down)
# CreateListsTable.migrate(:down)
