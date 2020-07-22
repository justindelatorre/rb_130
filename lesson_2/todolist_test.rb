require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    list_copy = @list.clone

    assert_equal(@todo1, list_copy.shift)
    assert_equal([@todo2, @todo3], list_copy.to_a)
  end

  def test_pop
    list_copy = @list.clone

    assert_equal(@todo3, list_copy.pop)
    assert_equal([@todo1, @todo2], list_copy.to_a)
  end

  def test_done_question
    assert_equal(false, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('hello') }
  end

  def test_shovel
    list_copy = @list.clone
    todos_copy = @todos.clone
    test_todo = Todo.new("Test")

    list_copy << test_todo
    todos_copy << test_todo

    assert_equal(todos_copy, list_copy.to_a)
  end

  def test_shovel_add_aliased
    list_copy1 = @list.clone
    list_copy2 = @list.clone
    test_todo = Todo.new("Test")

    list_copy1 << test_todo
    list_copy2.add(test_todo)

    assert_equal(list_copy1.to_a, list_copy2.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(10) }
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_done_at
    list_copy = @list.clone

    assert_raises(IndexError) { @list.mark_done_at(10) }
    
    list_copy.mark_done_at(0)
    assert_equal(true, list_copy.item_at(0).done?)
    assert_equal(false, list_copy.item_at(1).done?)
  end

  def test_mark_undone_at
    list_copy = @list.clone
    
    assert_raises(IndexError) { @list.mark_undone_at(10) }
    
    list_copy.mark_undone_at(0)
    assert_equal(true, !list_copy.item_at(0).done?)
    assert_equal(false, list_copy.item_at(1).done?)
  end
  
  def test_done_bang
    list_copy = @list.clone
    list_copy.done!

    assert_equal(true, list_copy.item_at(0).done?)
    assert_equal(true, list_copy.item_at(1).done?)
    assert_equal(true, list_copy.item_at(2).done?)
    assert_equal(true, list_copy.done?)
  end

  def test_remove_at
    list_copy = @list.clone

    assert_raises(IndexError) { @list.remove_at(10) }

    list_copy.remove_at(0)
    assert_equal([@todo2, @todo3], list_copy.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_todo_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    list_copy = @list.clone

    list_copy.mark_done_at(1)
    assert_equal(output, list_copy.to_s)
  end

  def test_each
    result = []
    @list.each { |todo| result << todo }
    assert_equal([@todo1, @todo2, @todo3], result)
  end

  def test_each_returns_original_obj
    assert_same(@list, @list.each { |x| "blah" })
  end

  def test_select
    todo1_copy = @todo1.clone
    todo1_copy.done!
    test_list = TodoList.new(@list.title)
    test_list.add(todo1_copy)
    test_list2 = TodoList.new(@list.title)
    test_list2.add(@todo1.clone)
    test_list2.mark_done_at(0)

    assert_equal(test_list.title, @list.title)
    assert_equal(test_list.to_s, test_list2.select { |todo| todo.done? }.to_s)
  end
end
