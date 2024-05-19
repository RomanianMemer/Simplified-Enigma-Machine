function plugboard = plugboard_swap(input)
    plugboard = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    for i = 1 : 2 : length(input)
        plugboard(find(plugboard == input(i+1))) = '0';
        plugboard(find(plugboard == input(i))) = input(i+1);
        plugboard(find(plugboard == '0')) = input(i);
    end
end