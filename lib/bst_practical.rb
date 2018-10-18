require 'binary_search_tree'

def kth_largest(tree_node, k)
    reverse_inorder(tree_node,k)[-1]
end

def reverse_inorder(tree_node, k, arr=[])
    until arr.length == k
        reverse_inorder(tree_node.right,k, arr) if tree_node.right
        arr.push(tree_node)
        reverse_inorder(tree_node.left, k, arr) if tree_node.left
    end
    arr
end
