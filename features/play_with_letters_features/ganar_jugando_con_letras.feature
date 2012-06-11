Feature: Ganar Jugando con Letras

	Scenario:
		Given Im playing with "GATO"
		When I fill "letra" with "A"
		And I press "Ok"
		And I fill "letra" with "T"
		And I press "Ok"
		Then I should see "Usted GANO!"
		And I should see "La palabra secreta era:"
		And I should see "G A T O"
