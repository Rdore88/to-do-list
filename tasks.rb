require "active_record"
require 'pry'
require_relative 'todo_database'
require_relative 'db_connection'

class Task < ActiveRecord::Base
validates :name, presence: true
belongs_to :list

  def update_name(new_name)
    self.name = new_name
  end

  def update_description(new_description)
    self.description = new_description
  end

  def complete
    self.completed_at.to_i
    self.completed_at = Time.now
    self.save
  end

  def self.display_all
    self.all.each {|el| puts el.name}
  end

  def destroy
    self.delete
  end

  def self.search_task(task_name)
    Task.all.where(name: task_name)
  end

end
