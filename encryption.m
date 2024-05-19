function output = encryption(letter, rotor)
    alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    
    % Alegerea literei in functie de rotor
     output = rotor(alphabet == letter);

end