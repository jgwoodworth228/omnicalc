class Stat
  def initialize(list_of_numbers)
    @numbers = list_of_numbers
  end


  def get_numbers
    return @numbers
  end


  def min
    return get_numbers.min
  end


  def max
    return get_numbers.max
  end


  def range
    return max - min
  end


  def sorted_numbers
    return get_numbers.sort
  end


  def length
    return get_numbers.count
  end


end
