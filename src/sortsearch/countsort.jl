function countsort!(data::Vector{T}) where T <: Integer
  isempty(data) && return
  
  maxValue = maximum(data)
  
  frequences = zeros(T, maxValue + 1)
  temparray = zeros(T, length(data))
  for value in data
    frequences[value] += 1
  end

  for index = 2:maxValue+1
    frequences[index] = frequences[index] + frequences[index - 1]
  end

  for index = length(data):-1:1
    temparray[frequences[data[index]]] = data[index]
    frequences[data[index]] = frequences[data[index]] - 1
  end

  for index in 1:length(data)
    data[index] = temparray[index]
  end

end