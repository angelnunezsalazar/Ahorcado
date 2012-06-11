Feature: Mostrar Pantalla de Bienvenida

	Scenario: Mostrar pantalla de bienvenida
		Given I open the web app
		Then I should see "Bienvenido al Ahorcado"
		And I should see "Ingrese la Palabra Secreta"
		
	Scenario: Ingresar palabra secreta
		Given I open the web app
		When I fill "palabra_secreta" with "GATO"
		And I press "OK" 
		Then I should see "La palabra secreta es:"
		
