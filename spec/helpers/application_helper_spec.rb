require "spec_helper"

describe ApplicationHelper do
  describe "#title" do
    it "returns the title and set content for" do
      expect(helper.title("Hello Universe")).to eq("Hello Universe")
      expect(helper.content_for(:title)).to eq("Hello Universe")
    end
  end

  describe "#title_for_new_action" do
    it "returns a string with model name" do
      helper.params[:controller] = "tasks"
      expect(helper.title_for_new_action).to eq("Add new task")

      helper.params[:controller] = "todos"
      expect(helper.title_for_new_action).to eq("Add new todo")
    end
  end

  describe "#title_for_edit_action" do
    it "returns a string with model name" do
      helper.params[:controller] = "tasks"
      expect(helper.title_for_edit_action).to eq("Edit task")

      helper.params[:controller] = "todos"
      expect(helper.title_for_edit_action).to eq("Edit todo")
    end
  end

  describe "#flash_class" do
    it "returns class depending on symbol" do
      expect(helper.flash_class("notice")).to eq("alert alert-info")
      expect(helper.flash_class("success")).to eq("alert alert-success")
      expect(helper.flash_class("error")).to eq("alert alert-danger")
      expect(helper.flash_class("alert")).to eq("alert alert-warning")
    end
  end
end
