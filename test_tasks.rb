require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/focus'
require "active_record"
require 'pry'
require_relative 'tasks'
require_relative 'db_connection'
require_relative 'todo_database'
require 'time'
ActiveRecord::Migration.verbose = false

class TestTask < Minitest::Test

  def setup
    CreateTasksTable.migrate(:up)
    CreateListsTable.migrate(:up)
  end

  def teardown
    CreateTasksTable.migrate(:down)
    CreateListsTable.migrate(:down)
  end

  def test_tasks_exist
    assert Task
  end

  def test_created_at
    laundry = Task.create(name: "Laundry")
    assert laundry.created_at
  end

  def test_check_name
    laundry = Task.create(name: "Laundry")
    assert_equal "Laundry", laundry.name
  end

  def test_check_description
    laundry = Task.create(name: "Laundry", description: "Seperate clothes before wash.")
    assert_equal "Seperate clothes before wash.", laundry.description
  end

  def test_needs_name
    laundry = Task.create()
    refute laundry.save
  end

  def test_update_name
    laundry = Task.create(name: "Laundry")
    assert_equal "Laundry/drycleaning", laundry.update_name("Laundry/drycleaning")
  end

  def test_update_description
    laundry = Task.create(name: "Laundry", description: "Seperate clothes before wash.")
    assert_equal "Don't let them shrink", laundry.update_description("Don't let them shrink")
  end

  def test_complete
    laundry = Task.create(name: "Laundry")
    assert_in_delta Time.now, laundry.complete, 1
  end

  def test_display_all
    laundry = Task.create(name: "Laundry")
    cook = Task.create(name: "Food Prep")
    assert_output(/Laundry\nFood Prep\n/) do
      Task.display_all
    end
  end

end
