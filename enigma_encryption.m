function encrypted_text = enigma_encryption(text, plugboard, rotor1, rotor2, rotor3, reflector, rotor_pos)

    % Definirea alfabetului pentru masina Enigma
    alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    % Convertirea textului in litere de tipar
    text = upper(text);

    % Eliminarea caracterelor invalide
    text(text < 'A' | text > 'Z') = '';
    
    % Criptarea mesajului conform setarilor
    encrypted_text = '';
    
    rotor1 = circshift(rotor1, -rotor_pos(1));
    rotor2 = circshift(rotor2, -rotor_pos(2));
    rotor3 = circshift(rotor3, -rotor_pos(3));

    first1 = rotor1(1);
    first2 = rotor2(1);

    for i = 1 : length(text)
        % Criptarea litera cu litera
        letter = text(i);
        
        letter = encryption(letter, plugboard);
        letter = encryption(letter, rotor1);
        letter = encryption(letter, rotor2);
        letter = encryption(letter, rotor3);

        letter = reflector(alphabet == letter);

        letter = reflection(letter, rotor3);
        letter = reflection(letter, rotor2);
        letter = reflection(letter, rotor1);
        letter = reflection(letter, plugboard);

        % Adaugarea literei in textul criptat
        encrypted_text = [encrypted_text, letter];
        
        % Adaugarea spatiilor pentru a complica mesajul criptat
        if mod(i,5) == 0
            encrypted_text = [encrypted_text, ' '];
        end

        % Modificarea pozitiei rotorilor
        rotor1 = circshift(rotor1, -1);
        if rotor1(1) == first1
            rotor2 = circshift(rotor2, -1);
            if rotor2(1) == first2
                rotor3 = circshift(rotor3, -1);
            end
        end
    end
end