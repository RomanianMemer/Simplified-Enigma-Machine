clc
clear


plugboardx = '';
plugboardx = remove_space(plugboardx);

if mod(length(plugboardx), 2) == 0 && plugboard_valid(plugboardx) == 1
    plugboard = plugboard_swap(plugboardx);
end

prompt= "Alegeti varianta de Masina Enigma (Enigma I, Enigma M3 sau Swiss K): ";
alegere = input(prompt, "s");
ok = 1;

% Setarile initiale
if alegere == "Enigma I"
    rotor1 = 'EKMFLGDQVZNTOWYHXUSPAIBRCJ';
    rotor2 = 'AJDKSIRUXBLHWTMCQGZNPYFVOE';
    rotor3 = 'BDFHJLCPRTXVZNYEIWGAKMUSQO';
    reflector = 'EJMZALYXVBWFCRQUONTSPIKHGD';
elseif alegere == "Enigma M3"
    rotor1 = 'EKMFLGDQVZNTOWYHXUSPAIBRCJ';
    rotor2 = 'ESOVPZJAYQUIRHXLNFTGKDCMWB';
    rotor3 = 'VZBRGITYUPSDNHLXAWMJQOFECK';
    reflector = 'YRUHQSLDPXNGOKMIEBFZCWVJAT';
elseif alegere == "Swiss K"
    rotor1 = 'PEZUOHXSCVFMTBGLRINQJWAYDK';
    rotor2 = 'ZOUESYDKFWPCIQXHMVBLGNJRAT';
    rotor3 = 'EHRVXGAOBQUSIMZFLYNWKTPDJC';
    reflector = 'IMETCGFRAYSQBZXWLHKDVUPOJN';
else
    ok = 0;
end

if ok == 1
    % Vectorul de rotor
    rotor_pos = [];

    % Introducerea mesajului(fara spatii)
    prompt = "Introduceti textul initial: ";
    text = input(prompt, "s");

    % Introducerea celor 3 pozitii pentru fiecare rotor
    prompt = "Introduceti pozitiile pentru rotorul 1: ";
    rotor_pos(1) = input(prompt);
    prompt = "Introduceti pozitiile pentru rotorul 2: ";
    rotor_pos(2) = input(prompt);
    prompt = "Introduceti pozitiile pentru rotorul 3: ";
    rotor_pos(3) = input(prompt);

    % Text criptat
    text_nou = enigma_encryption(text, plugboard, rotor1, rotor2, rotor3, reflector, rotor_pos);
    disp('Textul criptat este: ')
    disp(text_nou)
    
    % Text decriptat
    text_vechi = enigma_encryption(text_nou, plugboard, rotor1, rotor2, rotor3, reflector, rotor_pos);
    disp('Textul decriptat este: ')
    disp(text_vechi)
else
    disp('Varianta invalida de Masina Enigma!')
end