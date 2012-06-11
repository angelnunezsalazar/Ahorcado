Feature: Mostrar Lista de Letras Erroneas

	Scenario Outline: 
		Given Im playing with "GATITO"
		When I try with letters "<letras>"
		Then I should see "Erroneas:"
		And I should see "<letras_erradas>"

		Scenarios:
		|letras|letras_erradas|
		|T|Ninguna|
		|X|X|
		|X,Y|X,Y|
