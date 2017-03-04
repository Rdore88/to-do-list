require "active_record"
require 'pry'
require_relative 'db_connection'
require_relative 'todo_database'

class List < ActiveRecord::Base
  has_many :tasks
  validates :name, presence: true

  def update_name(new_name)
    self.name = new_name
  end

  def add_task(chore)
    tasks << chore
  end

  def print_list
    list_tasks = Task.all.where(list_id: self.id)
    list_tasks.each {|el| puts el.name}
  end

end
