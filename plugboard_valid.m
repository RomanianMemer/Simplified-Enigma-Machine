function ok = plugboard_valid(input)
    ok= 1;
    for i = 1 : length(input) - 1
        for j = (i + 1) : length(input)
            if input(i) == input(j)
                ok = 0;
            end
        end
    end
end