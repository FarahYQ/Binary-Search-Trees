def find(value,root)
    return nil if root.nil?
    return root.val if root.val == value
    if value < root.val
        find(value, root.left)
    else
        find(value, root.right)
    end
    
end