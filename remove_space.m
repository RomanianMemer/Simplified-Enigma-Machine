function text = remove_space(input)
    text = '';
    for i = 1 : length(input)
        if input(i) ~= ' '
            text = [text,input(i)];
        end
    end
end