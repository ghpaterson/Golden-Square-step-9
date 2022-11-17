require 'todo'

RSpec.describe Todo do
    context "it constructs" do
        it "returns the todo" do
            todo_list = Todo.new("wash the car")
            expect(todo_list.todo).to eq "wash the car"
        end
    end
end