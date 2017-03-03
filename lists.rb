require "active_record"
require 'pry'
require_relative 'todo_database'

class List < ActiveRecord::Base
  has_many :chores
  validates :name, presence: true


end
