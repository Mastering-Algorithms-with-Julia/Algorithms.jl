
#=

先写一个大概, 有空完善， 这是一个朴素版本的Dijkstra算法
qq：2012663060


dist[n]是用来存储距离的
g[i][j]表示从i->j的一条边存的值为距离
inf表示一个最大值：typemax(int64)
=#
function Dijkstra():: Int
    dist[1] = 0
    for _ = 1: n
        t = -1
        for j  = 1: n
            if !st[j] || (t == -1 && dist[t] > dist[j])
                t = j
            end
        end
        st[j] = 1
        for j  = 1: n + 1
            dist[j] = min(dist[j], dist[t] + g[t][j])
        end
    end
    if dist[n] == inf 
        return -1
    end
    dist[n]
end

    
