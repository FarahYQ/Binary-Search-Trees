var lowestCommonAncestor = function(root, p, q) {
    let current = root;
    let small, big;
    
    if (p.val > q.val) {
      [small, big] = [q, p];
    } else {
      [small, big] = [p, q];
    }
    
    while (current) {
      if (current.val >= small.val && current.val <= big.val) return current;
      if (current.val > small.val && current.val > big.val) {
        current = current.left;
      } else {
        current = current.right;
      }
    }
  };