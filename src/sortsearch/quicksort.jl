function quicksort!(data::Vector{T}, compare::Function = -) where T
  isempty(data) && return

  _quicksort!(data, 1, length(data), compare)
end
  

function _quicksort!(data::Vector{T}, startIndex::Int, endIndex::Int, compare::Function) where T
  if endIndex > startIndex
    pivot = data[rand(startIndex:endIndex)]
    left, right = startIndex, endIndex

    while left <= right
      while compare(data[left], pivot) < 0
        left += 1
      end

      while compare(data[right], pivot) > 0
        right -= 1
      end

      if left <= right
        data[left], data[right] = data[right], data[left]
        left += 1
        right -= 1
      end
    end

    _quicksort!(data, startIndex, right, compare)
    _quicksort!(data, left, endIndex, compare)
  end

end