# (two-sum)[https://leetcode.com/problems/two-sum]
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  sorted_nums = nums.sort
  first_num = second_num = nil
  (0..(sorted_nums.size - 1)).each do |i|
    first_num = sorted_nums[i]
    second_num = b_search(sorted_nums, target - first_num, i + 1)
    break if second_num
  end
  result = []

  (0..(nums.size - 1)).each do |i|
    result.push i  if nums[i] == first_num || nums[i] == second_num
    break if result.size == 2
  end
  result
end

def b_search(arr, num, start)
  low = start
  high = arr.size - 1

  while low <= high
    mid = (high + low) / 2
    if num < arr[mid]
      high = mid - 1
    elsif num > arr[mid]
      low = mid + 1
    else
      return arr[mid]
    end
  end

  nil
end