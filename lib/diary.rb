class Diary

	def initialize
		@diary_entries = []
		@todo_entries = []
		@numbers = []
	end

	def add_diary(diary)
		@diary_entries << diary
	end

	def list_diary
		return @diary_entries
	end

	def add_todo(todo)
		@todo_entries << todo
	end

	def list_todo
		return @todo_entries
	end

	def count_words
		total_words = 0
      @diary_entries.each do |entry|
        total_words += entry.word_count
        end
    return total_words
	end

	def reading_time(wpm)
		total_time = 0
      @diary_entries.each do |entry|
        total_time += entry.reading_time(wpm)
      end
      return total_time
	end

	def best_diary_entry_for_reading_time(wpm, minutes)
		return readable_entries(wpm, minutes).max_by(&:word_count)
	end

	def extract_numbers(diary_entry)
		diary_entry.scan(/[0-9]{11}/).each do |num|
			@numbers << num
			end
			@numbers = @numbers.uniq
	end

	def list_numbers
		return @numbers
	end

	private

	def readable_entries(wpm, minutes)
		return @diary_entries.filter do |entry|
				entry.reading_time(wpm) <= minutes
		end
	end

end