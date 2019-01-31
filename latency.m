function LAT = latency(SOF, EOF)
i = 1;
k = 1; %SOF index
j = 1; %EOF index
h = 1;
start = 0;
stop = 0;
flag1 = 0;
flag2 = 0;
while j <= length(EOF)
    if j > length(EOF)
        break
    end
    if SOF(k) == i && flag1 == 0
        start = SOF(k);
        i = i+1;
        flag1 = 1;
        while SOF(k) < EOF(j)
            if k == length(SOF)
                break
            end
            k = k+1;
        end
    else if EOF(j) == i
        stop = EOF(j);
        j = j+1;
        i = i+1;
        flag2 = 1;
        else
            i = i+1;
        end
    end
if flag2
LAT(h) = stop-start;
h = h+1;
flag1 = 0;
flag2 = 0;
end
end
end

