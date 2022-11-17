require 'diary'
require 'todo'

RSpec.describe "integrated diary and todo" do
    context "when todos are added to a list" do
        it "returns the list of todos that have been added" do
            diary = Diary.new
            todo1 = Todo.new("wash the dog")
            todo2 = Todo.new("wash the car")
            diary.add_todo(todo1)
            diary.add_todo(todo2)
            expect(diary.list_todo).to eq [todo1, todo2] 
        end
    end
end