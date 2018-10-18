class BSTNode
  attr_accessor :value, :left, :right, :parent

  def initialize(value, parent = nil)
    self.value = value
    self.parent = parent
    self.left = nil
    self.right = nil
  end
end


def bst(array)
  return nil if array.length == 0
  return BSTNode.new(array[0]) if array.length == 1
  med_idx = (array.length)/2
  med = BSTNode.new(array[med_idx])
  med.left = bst(array[0,med_idx])
  med.right = bst(array[med_idx+1, array.length])
  return med
end

tree = bst([1,2,3,4,5,6])
