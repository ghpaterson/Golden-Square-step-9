class DiaryEntry

    def initialize(title, contents)
       @title = title
       @contents = contents
    end

    def title
        return @title
    end

    def contents
        return @contents
    end

    def word_count
        return 0 if @contents.empty?
        return @contents.count(" ") + 1
    end

    def reading_time(wpm)
        return (word_count.to_f / wpm).ceil
    end
end