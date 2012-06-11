Feature: Ingresar Palabra Secreta

	Scenario: Mostrar secuencia inicial
		Given Im playing with "GATO"
		Then I should see "G _ _ O"
		
	Scenario: Mostrar secuencia inicial
		Given Im playing with "cocodrilo"
		Then I should see "C _ _ _ _ _ _ _ O"
