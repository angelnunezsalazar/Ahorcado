Feature: Verificar Fin de Juego con Intentos Fallidos al jugar con letra

Scenario: 
		Given Im playing with "GATO"
		When I try with letters "U,X,L,P,Z,S"
		Then I should see "Usted PERDIO!"
		And I should see "La palabra secreta era:"
		And I should see "G A T O"
		
		Given Im playing with "GATO"
		When I try with letters "U,X,L,U,P,Z,S"
		Then I should see "Usted PERDIO!"
		And I should see "La palabra secreta era:"
		And I should see "G A T O"
