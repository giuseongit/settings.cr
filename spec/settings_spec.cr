require "./spec_helper"

describe Settings do
  Spec.after_each do
    fileClean
  end

  it "Writes default configuration" do
    cfg = TestMgr1.new
    entries = fileRead
    entries.size.should eq 0

    fileClean

    cfg = TestMgr2.new
    entries = fileRead
    to_match = [
      ["token", "default"],
    ]
    entries.should eq to_match

    fileClean

    cfg = TestMgr3.new
    entries = fileRead
    to_match = [
      ["age", "0"],
    ]
    entries.should eq to_match
  end

  it "Loads corretcly from file" do
    cfg = TestMgr1.new
    cfg.token.should be nil
    entries = [
      ["token", "aaaa"],
    ]
    fileWrite entries
    cfg.load
    cfg.token.should eq "aaaa"
  end

  it "Saves correctly to file" do
    cfg = TestMgr3.new

    cfg.age = 5
    cfg.token = "abcd"

    cfg.save

    entries = fileRead
    to_match = [
      ["token", "abcd"],
      ["age", "5"],
    ]
    entries.should eq to_match
  end
end
