require 'spec_helper'

describe Todo do

  describe "#complete" do
    it "completes the todo" do
      todo = Todo.create!
      todo.complete

      expect(todo.completed_at).not_to eq nil
    end
  end

  describe "#uncomplete" do
    it "uncompletes the todo" do
      todo = Todo.create!
      todo.complete
      todo.uncomplete

      expect(todo.completed_at).to eq(nil)
    end
  end

  describe ".active" do
    it "returns active todos ordered by created at" do
      todos = []
      3.times { |n| todos << Todo.create! }

      expect(Todo.incompleted.count).to eq 3

      todos[1].complete

      expect(Todo.incompleted).to eq [todos[2], todos[0]]
    end
  end

  describe ".completed" do
    it "returns completed todos ordered by completed at" do
      pending "Not needed yet"
      todos = []
      4.times { |n| todos << Todo.create! }

      todos[0].complete
      todos[2].complete
      todos[1].complete

      expect(Todo.completed).to eq [todos[1], todos[2], todos[0]]
    end
  end
end
