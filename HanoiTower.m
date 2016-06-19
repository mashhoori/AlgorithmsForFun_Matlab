function HanoiTower()

    numPieces = 10;
    Solve(1:numPieces, 1, 3);

end


% p: list of pieces that we want to move
% currentBar: current location of the pieces
% destBar: target bar
function Solve(p, currentBar, destBar)
    
    persistent nMove    % A variable to count the number of moves
    if isempty(nMove)
        nMove = 0;
    end

    if(numel(p) == 1)   % If there is just one piece to move
        nMove = nMove + 1;
        fprintf('move %d:  piece %d to bar %d: \n', nMove, p, destBar);        
        return
    end    
   
    d = setdiff(1:3, [currentBar, destBar]); %Determine the target bar for p(1:end-1)
    Solve(p(1:end-1), currentBar, d);  
    
    nMove = nMove + 1;
    fprintf('move %d:  piece %d to bar %d: \n', nMove, p(end), destBar);
    
    Solve(p(1:end-1), d, destBar);
end


