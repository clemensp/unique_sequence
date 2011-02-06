Feature: unique sequence checker

  These are the requirements for a valid sequence:
  - each element of the sequence is a digit between 1 and 9.
  - the digits add to 15
  - there is at least one digit that appears exactly twice
  - no digit appears more than twice
  - order is irrevelant: [1,1,2,3,8] and [1,3,2,1,8] are equivalent and
    only count once

  Scenario Outline: check sequences
    Given the sequence <sequence>
    When I check the sequence
    Then it should be <validity>

    Scenarios: valid
      | sequence  | validity |
      | 1,1,2,3,8 | valid    |

    Scenarios: invalid (one or more digits not in 1..9)
      |sequence|validity|
      | 15 | invalid|
      | 1,14| invalid|
      | 2,13| invalid|

    Scenarios: invalid (sum not 15)
      | sequence  | validity |
      | 1,1,2,3,9 | invalid  |
      | 1,1,2,3,7 | invalid  |
      | 1,1,3,3,5 | invalid  |

  
    Scenarios: invalid (no digits appearing twice)
      | sequence  | validity |
      | 1,2,3,4,5 | invalid  |
      | 2,4,9     | invalid  |
      | 1,6,8     | invalid  |

    Scenarios: invalid (digits appearing more than twice)
      |sequence| validity|
      |1,2,3,3,3,3| invalid|
      |1,1,1,1,1,1,1,1,1,1,1,1,1,1,1| invalid|
      |1,1,1,3,3,3,3| invalid|
