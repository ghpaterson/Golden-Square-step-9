require 'diary'

RSpec.describe Diary do
    context "It returns empty lists when no diary entries or todos are added" do
        it "returns empty diary entry list" do
            diary = Diary.new
            expect(diary.list_diary).to eq []
        end

        it "returns an empty todo list" do
            diary = Diary.new
            expect(diary.list_todo).to eq []
        end
    end
end