require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/focus'
require "active_record"
require 'pry'
require_relative 'chores'
require_relative 'todo_database'
ActiveRecord::Migration.verbose = false

class TestChores < Minitest::Test

  def setup
    CreateChoresTable.migrate(:up)
    CreateListsTable.migrate(:up)
  end

  def teardown
    CreateChoresTable.migrate(:down)
    CreateListsTable.migrate(:down)
  end

  def test_chores_exist
    assert Chores
  end

  def test_check_name
    laundry = Chores.create(name: "Laundry")
    assert_equal "Laundry", laundry.name
  end

  def test_check_description
    laundry = Chores.create(name: "Laundry", description: "Seperate clothes before wash.")
    assert_equal "Seperate clothes before wash.", laundry.description
  end

  def test_needs_name
    laundry = Chores.create()
    refute laundry.save
  end

  def test_update_name
    laundry = Chores.new(name: "Laundry")
    assert_equal "Laundry/drycleaning", laundry.update_name("Laundry/drycleaning")
  end

  def test_update_description
    laundry = Chores.create(name: "Laundry", description: "Seperate clothes before wash.")
    assert_equal "Don't let them shrink", laundry.update_description("Don't let them shrink")
  end

end
