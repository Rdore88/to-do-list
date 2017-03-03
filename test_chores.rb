require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/focus'
require 'bundler/setup'
require "active_record"
require 'pry'
require_relative 'chores'
require_relative 'todo_database'

class TestChores

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

end
