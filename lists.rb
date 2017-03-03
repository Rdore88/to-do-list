require "active_record"
require 'pry'
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

end
