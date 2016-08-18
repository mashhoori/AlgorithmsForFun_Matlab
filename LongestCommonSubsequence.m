
% An algorithm for finding the longest subsequnece common to two given sequences.
% Ali Mashhoori  August 2016


s1 = 'XMJYAUZ';
s2 = 'MZJAWXU';

s1Len = numel(s1);
s2Len = numel(s2);

maxLen = zeros(s1Len+1, s2Len+1);
for i = 2:s1Len+1    
    for j = 2:s2Len+1        
        if(s1(i-1) == s2(j-1))
            maxLen(i, j) = maxLen(i-1, j-1) + 1;
        else
            maxLen(i, j) = max(maxLen(i-1, j), maxLen(i, j-1));
        end              
    end    
end

mls = [];
[i, j] = size(maxLen);
while(i > 1 && j  > 1)   
    if(maxLen(i, j) == maxLen(i-1, j))
        i = i-1;
        continue;
    end    
    if(maxLen(i, j) == maxLen(i, j-1))
        j = j-1;
        continue;
    end
    
    mls = [s1(i-1) mls];    
    i = i-1;
    j = j-1;        
end


