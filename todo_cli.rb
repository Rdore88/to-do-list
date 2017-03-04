require 'pry'
require "active_record"
require_relative 'db_connection'
require_relative 'tasks'
require_relative 'lists'

class TodoCli
  attr_reader :args
  def initialize(args)
    @args = args
    case @args.first
      when "new"
        new_task
      when "completed"
        completed
      when "display"
        display
    end
  end

  def new_task
    new_task = Task.create(name: @args.second, description: @args.fourth)
    if List.all.where(name: @args.third).empty?
      new_list = List.create(name: @args.third)
      new_list.add_task(new_task)
    else
      old_list = List.all.where(name: @args.third).first
      old_list.add_task(new_task)
    end
  end

  def completed
      completed_task = Task.all.where(name: @args[1]).first
      completed_task.complete
  end

  def display
    Task.display_all
  end



end
