Feature: Proof of concept
	In order to parse cucumber features
	As a manic software engineer with thousands of things to test
	I want to ensure the lexer can be loaded
	
	Scenario: Tokens are recognized
		Given this text syntax
		When I parse it with Gherkin
		Then I should be able to dump a syntax tree
		