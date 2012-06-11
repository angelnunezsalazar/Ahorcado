Feature: Mostrar Numero de Letras Erroneas

	Scenario: 
			Given Im playing with "GATITO"
			When I try with letters "T"
			Then I should see "# Errores Letras: 0/6"

	Scenario: 
			Given Im playing with "GATITO"
			When I try with letters "U,X"
			Then I should see "# Errores Letras: 2/6"
