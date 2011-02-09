Feature: unique sequence generator

  As a unique sequence seeker
  I want to be able to generate sequences
  So that I can find valid sequences

  Scenario: Generate one valid sequence
    Given a new generator
    When I ask for a unique sequence
    Then I should receive a valid unique sequence
