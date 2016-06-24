require 'rspec'
require './lib/models/ironBlog1.1.rb'
require "rack/test"


describe Post do

  let(:subject) { described_class.new("title-1",92011,"aaaaaaaaaaaaaaa") }

  describe "#Post" do

    it "postcreated correctly" do
      expect(subject.title).to eq("title-1")
      expect(subject.date).to eq(92011)
      expect(subject.text).to eq("aaaaaaaaaaaaaaa")
      expect(subject.sponsor).to eq("")
    end
  end
end


describe Blog do

  let(:post1) { Post.new("title-1",2011,"aaaaaaaaaaaaaaa") }
  let(:post2) { Post.new("title-2",2012,"bbbbbbbbbbbbbbb") }
  let(:post3) { Post.new("title-3",2013,"ccccccccccccccc") }

  let(:post_list) { [post1,post2] }
  let(:subject) { described_class.new(post_list) }

  describe "#Blog" do

    describe "add" do
      it "add a post in the list" do
        expect(subject.add(post3)).to eq([post1,post2,post3])
      end
    end

    describe "sort" do
      let(:sorted_array) { subject.sort }
      it "sort by date" do
        expect(sorted_array[0]).to  eq(post2)
        expect(sorted_array[1]).to  eq(post1)
      end
    end

    describe "delete" do
      it "delete a post by name" do
        expect(subject.delete(post2)).to eq([post1])
      end
    end



  end
end
