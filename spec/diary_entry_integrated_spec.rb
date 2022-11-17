require 'diary'
require 'diary_entry'

RSpec.describe "integrated diary and diary_entry" do
    context "After adding diary entries into a list" do
        it "returns one diary entry to the list" do
            diary = Diary.new
            diary_entry1 = DiaryEntry.new("title_1", "contents_1")
            diary.add_diary(diary_entry1)
            expect(diary.list_diary).to eq [diary_entry1]           
        end

        it "returns two diary entry to the list" do
            diary = Diary.new
            diary_entry1 = DiaryEntry.new("title_1", "contents_1")
            diary_entry2 = DiaryEntry.new("title_2", "contents_2")
            diary.add_diary(diary_entry1)
            diary.add_diary(diary_entry2)
            expect(diary.list_diary).to eq [diary_entry1, diary_entry2]           
        end
    end

    context "counts all the words from all the diary entries" do
        it "returns the number of words from the diary entries" do
            diary = Diary.new
            diary_entry1 = DiaryEntry.new("title_1", "one")
            diary_entry2 = DiaryEntry.new("title_2", "one two")
            diary_entry3 = DiaryEntry.new("title_2", "one two three")
            diary.add_diary(diary_entry1)
            diary.add_diary(diary_entry2)
            diary.add_diary(diary_entry3)
            expect(diary.count_words).to eq 6
        end
    end

    context "the reading time for all the diary entries" do
        it "returns the reading time for all the diary entries" do
            diary = Diary.new
            diary_entry1 = DiaryEntry.new("title_1", "one two three four")
            diary_entry2 = DiaryEntry.new("title_2", "five six seven eight")
            diary.add_diary(diary_entry1)
            diary.add_diary(diary_entry2)
            expect(diary.reading_time(2)).to eq 4
        end
    end

    context "find the best diary entry to read based on time available" do
        it "returns the diary entry that matches based on wpm and minutes" do
            diary = Diary.new
            diary_entry1 = DiaryEntry.new("title_1", "one")
            diary_entry2 = DiaryEntry.new("title_2", "one two")
            diary_entry3 = DiaryEntry.new("title_2", "one two three")
            diary.add_diary(diary_entry1)
            diary.add_diary(diary_entry2)
            diary.add_diary(diary_entry3)
            result = diary.best_diary_entry_for_reading_time(2, 1)
            expect(result).to eq diary_entry2
        end
    end

    context "finding any telephone numbers within the diary entries" do
        it "returns an empty list if no phone numbers are present in a diary entry" do
            diary = Diary.new
            diary_entry1 = DiaryEntry.new("title_1", "this is an entry")
            diary.extract_numbers(diary_entry1.contents)
            expect(diary.list_numbers).to eq []
        end

        it "returns a telephone number from the diary entry" do
            diary = Diary.new
            diary_entry1 = DiaryEntry.new("title_1", "emergency contact: 07400800600")
            diary.extract_numbers(diary_entry1.contents)
            expect(diary.list_numbers).to eq ["07400800600"]
        end

        it "returns two phone numbers from two diary entries" do
            diary = Diary.new
            diary_entry1 = DiaryEntry.new("title_1", "emergency contact: 07400800600")
            diary_entry2 = DiaryEntry.new("title_2", "next of kin: 07100200300")
            diary.extract_numbers(diary_entry1.contents)
            diary.extract_numbers(diary_entry2.contents)
            expect(diary.list_numbers).to eq ["07400800600", "07100200300"]
        end
    end


end