# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    @todos.each_index { |idx| mark_done_at(idx) } 
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

    @todos << todo if todo.class == Todo
  end
  alias_method :add, :<<

  def remove_at(idx)
    @todos.delete(item_at(idx))
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end

    self
  end

  def select
    selected = TodoList.new(title)

    self.each { |element| selected << element if yield(element) }

    selected
  end

  def find_by_title(str)
    self.select { |element| element.title == str }.first
  end

  def all_done
    self.select { |element| element.done? } 
  end

  def all_not_done
    self.select { |element| !element.done? }
  end

  def mark_done(str)
    find_by_title(str) && find_by_title(str).done! 
  end

  def mark_all_done
    self.each { |element| element.done! }
  end

  def mark_all_undone
    self.each { |element| element.undone! }
  end

  def to_s
    puts "---- #{title} ----"
    @todos.each { |todo| puts todo }
  end

  def to_a
    @todos
  end
end
