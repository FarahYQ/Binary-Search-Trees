function linkedListSum(n1, n2) {
    let carry = 0;
    let node1 = n1;
    let node2 = n2;
    let head3 = new Node(0);
    let node3 = head3;
    let first = true;
    while (node1 || node2) {
      let sum = node1.val + node2.val + carry;
      node3.val = sum % 10;
      if (first) {
        head3.val = node3.val;
        first = false;
      }
      carry = Math.floor(sum / 10);
      if (node1) node1 = node1.next; 
      if (node2) node2 = node2.next;
      if (carry > 0) node3.next = new Node(carry);
    }
    return head3;
  }