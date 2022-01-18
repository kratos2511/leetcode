# (add-two-numbers)[https://leetcode.com/problems/add-two-numbers/]
# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)

  num1 = l1
  num2 = l2
  carry = 0
  result = ListNode.new
  calc = result
  while num1 || num2 || carry != 0
    digit_sum = (num1&.val || 0) + (num2&.val || 0) + carry
    num1 = num1&.next
    num2 = num2&.next
    node = ListNode.new(digit_sum % 10)
    calc.next = node
    calc = node
    carry = digit_sum / 10
  end
  result.next
end
