# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require 'bst_node'
require 'byebug'
class BinarySearchTree
  attr_accessor :root, :value, :parent
  def initialize
    @root = BSTNode.new(nil)
  end

  def insert(value)
    if @root.value
      BinarySearchTree.insert!(@root,value)
    else
      @root.value = value
    end
  end


  def self.insert!(node,value)
    return BSTNode.new(value) unless node
    if value <= node.value
      if node.left
        BinarySearchTree.insert!(node.left, value)
      else
        node.left = BSTNode.new(value,node)
      end
    else
      if node.right
        BinarySearchTree.insert!(node.right,value)
      else
        node.right = BSTNode.new(value,node)
      end 
    end
  end

  def find(value, tree_node = @root)
    return tree_node if tree_node.value == value
    if value < tree_node.value
      return self.find(value, tree_node.left) if tree_node.left
    else
      return self.find(value, tree_node.right) if tree_node.right
    end
    nil
  end

  def delete(value)
    # debugger
    if @root.value == value
      @root = nil 
      return
    end
    deleted = self.find(value)
    if deleted.left && deleted.right
      left_max = maximum(deleted.left)
      left_max.left.parent = left_max.parent
      left_max.parent.right = left_max.left
      deleted.value = left_max.value
    elsif deleted.left
      if deleted.left.value <= deleted.parent.value
        deleted.parent.left = deleted.left
      else
        deleted.parent.right = deleted.left
      end
    elsif deleted.right
      if deleted.right.value <= deleted.parent.value
        deleted.parent.left = deleted.right
      else
        deleted.parent.right = deleted.right
      end
    else
      if deleted.value <= deleted.parent.value
        deleted.parent.left = nil
      else
        deleted.parent.right = nil
      end
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    if tree_node.right.nil?
      return tree_node
    else
      return maximum(tree_node.right)
    end
  end

  def depth(tree_node = @root)
    return -1 if tree_node.nil?
    return [depth(tree_node.right), depth(tree_node.left)].max + 1
  end 

  def is_balanced?(tree_node = @root)
    return true if tree_node.nil?
    l_d = depth(tree_node.left)
    r_d = depth(tree_node.right)
    if (l_d - r_d).abs <= 1 && is_balanced?(tree_node.left) && is_balanced?(tree_node.right)
      return true
    end
    false
  end

  def in_order_traversal(tree_node = @root, arr = [])
    in_order_traversal(tree_node.left,arr) if tree_node.left
    arr.push(tree_node.value)
    in_order_traversal(tree_node.right,arr) if tree_node.right
    arr
  end

  def remove_from_tree(tree_node, value)
  
  end


  private
  # optional helper methods go here:

end
