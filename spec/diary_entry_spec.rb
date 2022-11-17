require 'diary_entry'

RSpec.describe DiaryEntry do
    context "it constructs" do
        it "returns the title of the diary entry" do
            diary_entry = DiaryEntry.new("title_1", "contents_1")
            expect(diary_entry.title).to eq "title_1"
        end

       
        it "returns the contents of the diary entry" do
            diary_entry = DiaryEntry.new("title_1", "contents_1")
            expect(diary_entry.contents).to eq "contents_1"
        end
    end

    context "counts the number of words in the contents of a diary entry" do
        it "returns word count of 1 if contents is 1" do
            diary_entry = DiaryEntry.new("title_1", "contents_1")
            expect(diary_entry.word_count).to eq 1
        end

        it "returns word count of Zero if contents empty" do
            diary_entry = DiaryEntry.new("title_1", "")
            expect(diary_entry.word_count).to eq 0
        end
    end

    context "counts how long it would take to read a given content length" do
        it "returns 2 if contents is 4 and wpm is 2" do
            diary_entry = DiaryEntry.new("title_1", "one two three four") 
            expect(diary_entry.reading_time(2)).to eq 2
        end
    end

        
end