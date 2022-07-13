function _mergearray!(data::Vector{T}, startIndex::Int, middleIndex::Int, endIndex::Int, temparray::Vector{T}, compare::Function) where T
  ipos = startIndex
  jpos = middleIndex + 1
  mpos = 1

  while ipos <= middleIndex || jpos <= endIndex
    if ipos > middleIndex
      while jpos <= endIndex
        temparray[mpos] = data[jpos]
        jpos += 1
        mpos += 1
      end

      continue
    elseif jpos > endIndex
      while ipos <= middleIndex
        temparray[mpos] = data[ipos]
        ipos += 1
        mpos += 1
      end

      continue
    end

    if compare(data[ipos], data[jpos]) < 0
      temparray[mpos] = data[ipos]
      ipos += 1
      mpos += 1
    else
      temparray[mpos] = data[jpos]
      jpos += 1
      mpos += 1
    end
  end

  for count in 1:(endIndex - startIndex)
    data[startIndex + count - 1] = temparray[count]
  end
end

function _mergesort!(data::Vector{T}, startIndex::Int, endIndex::Int, temparray::Vector{T}, compare::Function) where T
  middleIndex = 0

  if startIndex < endIndex
    middleIndex = floor(Int, (startIndex + endIndex) / 2)
    _mergesort!(data, startIndex, middleIndex, temparray, compare)
    _mergesort!(data, middleIndex + 1, endIndex, temparray, compare)
    _mergearray!(data, startIndex, middleIndex, endIndex, temparray, compare)
  end
end

function mergesort!(data::Vector{T}, compare::Function = -) where T
  isempty(data) && return
  
  temparray = Vector{T}(undef, length(data))
  _mergesort!(data, 1, length(data), temparray, compare)
end