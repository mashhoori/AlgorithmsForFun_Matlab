
function EightQueens()

    boardDim = 8;
    board = zeros(boardDim, boardDim);
    
    list = EigthQueens_Solution2(board, 0, []);
    
    fprintf('Number of solutions: %d \n', numel(list));
    fprintf('Sample solution: \n');
    disp(list{1});
    
end

% Inefficient Solution
% Decides if a board is valid only when all queens are positioned 
function list = EigthQueens_Solution1(board, number, list)
    
    boardDim = size(board, 1);      
    if(number == boardDim)
        if(~Fail(board))          
            list{end+1} = board;
        end
        return
    end    
    
    for i = 1:boardDim
        tmp = board;
        tmp(i, number+1) = 1;       
        list = EigthQueens_Solution1(tmp, number + 1, list); 
    end
        
end

% Efficient Solution
% Backtracks as soon as a queen position is not valid
function [list] = EigthQueens_Solution2(board, number, list)
    
    boardDim = size(board, 1);
    if(number == boardDim)        
        list{end+1} = board;
        return
    end
        
    for i = 1:boardDim
        tmp = board;
        tmp(i, number+1) = 1;
        
        if(Fail(tmp))            
            continue;        
        else
            list = EigthQueens_Solution2(tmp, number + 1, list);
        end 
    end
        
end

% Determine if a board is valid
function res = Fail(board)

    % Check for horizontal and vertical attacks
    a = sum(board);
    b = sum(board, 2);
    if (max(a) > 1 || max(b) > 1)
        res = 1;
        return
    end
    
    % Check for diagonal attacks
    [row, col] = find(board);    
    for i = 1:numel(row)-1
        for j = i+1:numel(row)            
            a = row(i) - row(j);
            b = col(i) - col(j);            
            if(abs(a) == abs(b))
                res = 1;
                return
            end            
        end
    end       
    res = 0;
end