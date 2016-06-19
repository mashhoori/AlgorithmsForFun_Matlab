function set = PermGen(list)
    set = [];
    if(numel(list) == 1)
        set = list;
    else
        for item = list
            newList = setdiff(list, item);
            perm = PermGen(newList);
            tmp = [ones(size(perm, 1), 1)*item, perm];            
            set = [set; tmp];
        end
    end
end

