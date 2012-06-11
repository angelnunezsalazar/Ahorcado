Feature: Jugar con Letra
	Scenario Outline: Validar la letra
		Given Im playing with "GATITO"
		And I fill "letra" with "<letra>"
		And I press "Ok"
		Then I should see "<resultado>" 
		
		Scenarios:
		|letra|resultado|
		|A|G A _ _ _ O|
		|T|G _ T _ T O|
		|X|G _ _ _ _ O|

	Scenario Outline: Validar la letra
		Given Im playing with "GATITO"
		And I fill "letra" with "<primera_letra>"
		And I press "Ok"
		And I fill "letra" with "<segunda_letra>"
		And I press "Ok"
		Then I should see "<resultado>" 
		
		Scenarios:
		|primera_letra|segunda_letra|resultado|
		|A|I|G A _ I _ O|
		|T|A|G A T _ T O|
