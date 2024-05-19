function output = reflection(letter, rotor)
    alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    % Oglindirea criptarii
    output = alphabet(rotor == letter);

end