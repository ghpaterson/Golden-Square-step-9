# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
```
```ruby
class Diary
  def intitialize
    #create empty list of diary entries
    #create empty list of todo's
  end

  def add_diary
    #adds a diary entry to the list of diary entries
    #returns nothing
  end

  def list_diary
    #returns a list of the added diary entries
  end

  def add_todo
    #adds a todo to list of todos
  end

  def list_todo
    #returns a list of the added todos
  end

  def best_diary_entry_for_reading_time(wpm, minutes)
    #returns the best diary entry available based on time and reading time
  end

  def contact_numbers
    #returns a list phone numbers that are within any diary entries
  end

class DiaryEntry

    def initialize(title, contents) #both are recorded as strings
        #sets the instance variables of @title and @contents
    end

    def title
        #returns title
    end

    def contents
        #returns contents
    end

    def word_count
        #the amount of words in a given diary entry
        #returns nothing
    end

    def reading_time(wpm)
        #The amount of time it will take to read a diary entry based on reading speed
    end 

    def phone_number
        
    end

class Todo

    def initialize(todo)
        #creates todo variable
    end

    def todo
        #returns todo
    end

class PhoneBook

    def initialize
        @numbers = []
    end

    def extract_numbers(text)
        text.scan(/[0-9]{11}/).each do |num|
        @numbers << num
        end
        @numbers = @numbers.uniq
    end

    def list_numbers
        return @numbers
    end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# list all the diary entries that have been added
diary = Diary.new
diary_entry1 = DiaryEntry.new("title_1", "contents_1")
diary.add_diary(diary_entry1)
expect(diary.list_diary).to eq [diary_entry1]

# list all the todos that have been added

diary = Diary.new
todo1 = Todo.new("wash the car")
todo2 = Todo.new("wash the dog")
diary.add_todo(todo1)
diary.add_todo(todo2)
expect(diary.list_todo).to eq [todo1, todo2]

#return the best diary entry based on time and reading speed

diary = Diary.new
diary_entry1 = DiaryEntry.new("title_1", "one ")
diary_entry2 = DiaryEntry.new("title_2", "one two ")
diary_entry3 = DiaryEntry.new("title_2", "one two three")
diary.add_diary(diary_entry1)
diary.add_diary(diary_entry2)
diary.add_diary(diary_entry2)
result = diary.best_diary_entry_for_reading_time(2, 1)
expect(result).to eq [diary_entry2]

#returns any phone numbers that occur within the diary entries

diary = Diary.new
diary_entry1 = DiaryEntry.new("title_1", "one ")
diary_entry2 = DiaryEntry.new("title_2", "one 07400800800")
diary_entry3 = DiaryEntry.new("title_2", "one two three")
diary.add_diary(diary_entry1)
diary.add_diary(diary_entry2)
diary.add_diary(diary_entry2)
result = diary.contact_numbers
expect(result).to eq [diary_entry2]



```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
class DiaryEntry unit tests

# constructs a diary entry title
diary_entry = DiaryEntry.new("title_1", "contents_1")
expect(diary_entry.title).to eq "title_1"

# constructs a diary entry contents
diary_entry = DiaryEntry.new("title_1", "contents_1")
expect(diary_entry.contents).to eq "contents_1"

# counts the no of words in a diary entry contents
diary_entry = DiaryEntry.new("title_1", "contents_1")
expect(diary_entry.word_count).to eq 1

# counts the no of words in a diary entry contents
diary_entry = DiaryEntry.new("title_1", "")
expect(diary_entry.word_count).to eq 0

#counts how many minutes it would take to read the contents at a given 
#reading speed
diary_entry = DiaryEntry.new("title_1", "one two three four") 
expect(diary_entry.reading_time(2)).to eq 2

class Todo unit tests

#constructs a todo 
todo_list = Todo.new("wash the dog")
expect(todo_list.todo).to eq "wash the dog"


class Diary unit test

#expects to list an empty diary array
diary = Diary.new
expect(diary.list_diary).to eq []

#expects to list an empty todo array
diary.Diary.new
expect(diary.list_todo).to eq []
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---


<!-- END GENERATED SECTION DO NOT EDIT -->