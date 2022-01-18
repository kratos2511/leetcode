# (median-of-two-sorted-arrays)[https://leetcode.com/problems/median-of-two-sorted-arrays/]
# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  lnum1 = nums1.size
  lnum2 = nums2.size
  lnum = 0
  larr = 0
  num = 0
  l1 = 0
  l2 = 0
  while l1 < lnum1 || l2 < lnum2
    if (l1 < lnum1) && (l2 < lnum2)
      if nums2[l2] < nums1[l1]
        lnum = num
        num = nums2[l2]
        l2 += 1
      else
        lnum = num
        num = nums1[l1]
        l1 += 1
      end
    elsif l1 < lnum1
      lnum = num
      num = nums1[l1]
      l1 += 1
    else
      lnum = num
      num = nums2[l2]
      l2 += 1
    end
    larr += 1

    if larr > (lnum1 + lnum2) / 2
      if (lnum1 + lnum2).even?
        return (lnum + num) / 2.0
      else
        return num / 1.0
      end
    end
  end
end
