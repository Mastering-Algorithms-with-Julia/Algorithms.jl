function insertsort!(data::Vector{T}, compare::Function = -) where T
  isempty(data) && return
  
  for j = 2:length(data)
    i = j - 1

    key = data[j]
    while i >= 1 && compare(data[i], key) > 0
      data[i + 1] = data[i]
      i -= 1
    end
    data[i + 1] = key

  end
end