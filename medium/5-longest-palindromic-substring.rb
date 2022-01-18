# (longest-palindromic-substring)[https://leetcode.com/problems/longest-palindromic-substring/]
# @param {String} s
# @return {String}
def longest_palindrome(s)
  ls = s.size - 1
  max_left = max_right = 0
  (0..2 * ls).each do |i|
    left, right = find_palindrome_around(s, i, ls)
    if (right - left) > (max_right - max_left)
      max_left = left
      max_right = right
    end
  end
  s[max_left..max_right]
end

def find_palindrome_around(s, i, ls)
  left = i / 2
  right = left + (i.even? ? 0 : 1)
  while left >= 0 && right <= ls
    return left + 1, right - 1 if s[left] != s[right]

    left -= 1
    right += 1
  end
  [left + 1, right - 1]
end
