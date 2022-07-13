function binarysearch(data::Vector{T}, target::T, compare::Function = -) where T
  left = 1
  right = length(data)
  middle = 0
  while left <= right
    middle = floor(Int, (left + right) / 2)
    result = compare(data[middle], target)

    if result < 0
      left = middle + 1
    elseif result > 0
      right = middle - 1
    else
      return middle
    end
  end

  return -1
end