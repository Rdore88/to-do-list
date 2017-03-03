require "active_record"
require 'pry'
require_relative 'todo_database'

class Chores < ActiveRecord::Base
validates :name, presence: true
belongs_to :list

def update_name(new_name)
  self.name = new_name
end

def update_description(new_description)
  self.description = new_description
end

end
