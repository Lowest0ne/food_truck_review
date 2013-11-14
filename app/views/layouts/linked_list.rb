# A Struct is a convenient way to bundle a number of attributes together, using accessor methods, without having to write an explicit class
Cell = Struct.new(:value, :next)

list = Cell.new("head. hi", nil)

def linked_list(value, cell)
  return Cell.new(value, cell)
end

def recursive_print(list)
  print list.value
  recursive_print(list.next) unless list.next == nil
end

i = 0
10.times {
  i += 1
  list  = linked_list(i, list)
}

recursive_print(list)