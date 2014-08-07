require "spec_helper"

describe ApplicationHelper do
  describe "#title" do
    it "returns the title and set content for" do
      expect(helper.title("Hello Universe")).to eq("Hello Universe")
      expect(helper.content_for(:title)).to eq("Hello Universe")
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
