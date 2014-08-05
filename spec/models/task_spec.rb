require 'spec_helper'

describe Task do
  describe "#tag_list" do
    it "list tags" do
      Task.create!(title: 'Motherboard', tag_list: 'promoted, code, bug')
      task = Task.all.first
      expect(task.tag_list).to eq 'promoted, code, bug'
    end
  end

  describe ".tagged_with" do
    it "returns filtered tasks" do

      @current_user = User.create! do |user|
        user.email = 'vik.froberg@gmail.com'
        user.password = 'password'
      end
      @project = @current_user.projects.create!(name: 'Meta')
      @task1 = @project.tasks.create!(title: 'Task #1', tag_list: 'code')
      @task2 = @project.tasks.create!(title: 'Task #2', tag_list: 'design')
      @task3 = @project.tasks.create!(title: 'Task #3', tag_list: 'code')

      expect(@project.tasks.tagged_with('code').map(&:title)).to eq ['Task #3', 'Task #1']
    end
  end

  describe ".incompleted" do
    it "returns incomplete tasks only" do
      task1 = create(:task)
      task2 = create(:task)
      task1.complete

      expect(Task.incompleted).to eq([task2])
    end
  end

  describe "#complete" do
    it "completes the task" do
      task = create(:task)
      task.complete

      expect(task.completed_at).not_to eq nil
    end
  end

  describe "#uncomplete" do
    it "uncompletes the task" do
      task = create(:task)

      task.complete
      expect(task.completed_at).not_to eq nil

      task.uncomplete
      expect(task.completed_at).to eq(nil)
    end
  end
end
