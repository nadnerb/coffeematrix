require 'ostruct'

class Rank < OpenStruct

  def <=>(other)
    sum <=> other.sum
  end

  def sum
    marshal_dump.values.sum
  end

end
