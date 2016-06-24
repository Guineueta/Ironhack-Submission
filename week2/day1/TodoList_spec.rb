require "rspec"
require "./TodoList"


describe Task do
  let(:subject) { described_class.new(content) }
  let(:content) {"buy milk"}

  describe "#complete?" do
    let(:expected_output) { false }
    let(:result) { subject.complete? }

    it "return false if the task status is incomplete or true if it complete" do
       expect(result).to eq(expected_output)
    end
  end

  describe "#complete!" do
    let(:expected_output) { "Complete" }
    let(:result) {subject.complete!}
    it "make the task have a complete status when you complete " do
      expect(result).to eq( expected_output )
    end
  end

  describe "#uptate!" do
    let(:var_function) {"cambioooó"}
    let(:expected_output) { "cambioooó"}
    let(:result) {subject.uptate!(var_function)}
    it "make the task have a complete status when you complete " do
      expect(result).to eq( expected_output )
    end
  end
end

describe TodoList do
  task1 = Task.new("buy milk")
  let(:subject) { described_class.new }

   describe "#add_task" do
     let(:var_function) {task1}
     let(:expected_output) { [task1] }
     let(:result) {subject.add(var_function)}
     it "add a task in an array" do
     expect(result).to eq( expected_output )
   end
  end
  describe "#delete" do

    let(:var_function) {1}
    let(:expected_output) { [] }
    let(:result) {subject.delete(var_function)}
    it "delete a task according with the gived ID" do
    expect(result).to eq( expected_output )
  end
 end
 end
