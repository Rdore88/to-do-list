require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/focus'
require "active_record"
require 'pry'
require_relative 'tasks'
require_relative 'lists'
require_relative 'db_connection'
require_relative 'todo_database'
ActiveRecord::Migration.verbose = false

class TestLists < Minitest::Test

  def setup
    CreateTasksTable.migrate(:up)
    CreateListsTable.migrate(:up)
  end

  def teardown
    CreateTasksTable.migrate(:down)
    CreateListsTable.migrate(:down)
  end

  def test_lists_exits
    assert List
  end

  def test_list_name
    weekend = List.new(name: "Weekend List")
    assert_equal "Weekend List", weekend.name
  end

  def test_update_name
    weekend = List.new(name: "Weekend List")
    assert_equal "Weekend tasks list", weekend.update_name("Weekend tasks list")
  end

  def test_need_name
    weekend = List.new()
    refute weekend.save
  end

  def test_add_task
    weekend = List.new(name: "Weekend List")
    laundry = Task.create(name: "Laundry")
    assert_equal [laundry], weekend.add_task(laundry)
  end

  def test_print_list
    weekend = List.create(name: "Weekend List")
    laundry = Task.create(name: "Laundry")
    weekend.add_task(laundry)
    assert_equal [laundry], weekend.print_list
  end

end
