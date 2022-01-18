# (longest-substring-without-repeating-characters)[https://leetcode.com/problems/longest-substring-without-repeating-characters/]
# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  max_len = 0
  cur_len = 0
  char_hash = {}
  len = s.size - 1
  (0..len).each do |pos|
    (pos..len).each do |i|
      char = s[i]
      if char_hash.key?(char)
        cur_len = 0
        char_hash = {}
        break
      else
        char_hash[char] = 1
        cur_len += 1
        max_len = cur_len > max_len ? cur_len : max_len
      end
    end
  end
  max_len
end
