# Todo CLI
This program allows the user to organize tasks/chores by adding them to lists, marking
them as complete and searching through tasks.

## Start
```ruby
./todo install
```
Each user will have to run this code once in order to set up the database.

## Create New Task
```ruby
./todo new "Task Name" "List" "Description"
```
This command lets the user name the tasks and has two optional inputs: the list the task
will be added to and a more in depth description of the task.

## Marked Completed
```ruby
./todo "completed" "Task Name"
```
This command allows the user to mark a task complete in the database.

## Display All Tasks
```ruby
./todo "display"
```
This command will display all tasks.

## Search For Task
```ruby
./todo "search" "Task Name"
```
This command will search the database for the task name and return all information
pertaining to that task.
