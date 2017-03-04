require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/focus'
require "active_record"
require 'pry'
require_relative "todo_cli"
require_relative 'tasks'
require_relative 'lists'
require_relative 'db_connection'
require 'time'
# require_relative 'todo_database'
ActiveRecord::Migration.verbose = false

class TodoCliTest < Minitest::Test

  # def setup
  #   CreateTasksTable.migrate(:up)
  #   CreateListsTable.migrate(:up)
  # end
  #
  # def teardown
  #   CreateTasksTable.migrate(:down)
  #   CreateListsTable.migrate(:down)
  # end

  def test_new_task
    input = TodoCli.new(["new", "Laundry", "Weekend"])
    assert_equal 1, Task.all.length
  end

  def test_complete
    input = TodoCli.new(["completed", "Laundry"])
    assert_in_delta Time.now, Task.all.where(name: "Laundry").first.completed_at, 1
  end

  def test_display_all
    input = TodoCli.new(["display"])
    assert_output(/Laundry\n/) {Task.display_all}
  end

end
