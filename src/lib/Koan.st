Object subclass: Koan [
  | tracker fillMeIn |

  Koan class >> create: newTracker [
    ^self new initialize: newTracker;
          yourself
  ]

  initialize: newTracker [
    tracker := newTracker.
    fillMeIn := 'FILL ME IN'.
  ]

  expectToBeTrue: expression [
    tracker status ifFalse: [^nil].
    expression
      ifFalse: [ self setTrackerToFalse: 'It is false, but SHOULD be true.'.  ].
  ]

  expectToBeFalse: expression [
    tracker status ifFalse: [^nil].
    expression
      ifTrue: [ self setTrackerToFalse: 'It is true, but SHOULD be false.' ].
  ]

  expect: expectedValue toEqual: actualValue [
    tracker status ifFalse: [^nil].
    (expectedValue = actualValue)
      ifFalse: [ self setTrackerToFalse: 'Expected value SHOULD equal actual value.' expected: expectedValue actual: actualValue ].
  ]

  expect: expectedValue toNotEqual: actualValue [
    tracker status ifFalse: [^nil].
    (expectedValue = actualValue)
      ifTrue: [ self setTrackerToFalse: 'Expected value SHOULD NOT equal actual value.' expected: expectedValue actual: actualValue ].
  ]

  expect: expectedValue toBeLike: actualValue [
    tracker status ifFalse: [^nil].
    (expectedValue class = actualValue class)
      ifFalse: [ self setTrackerToFalse: 'Expected value IS NOT LIKE actual value.' expected: expectedValue actual: actualValue ].
  ]

  expect: blockExpression toRaise: expectedException [
    | actualException |

    tracker status ifFalse: [^nil].
    actualException := blockExpression on: Exception do: [ :signal |
      signal return: signal class
    ].
    (expectedException = actualException)
      ifFalse: [ self setTrackerToFalse: 'Expected exception was not given.' expected: expectedException actual: actualException. ].
  ]

  setTrackerToFalse: message [
    tracker status: false.
    tracker error: (Dictionary new
                               add: #message -> message;
                               add: #line    -> thisContext parentContext parentContext currentLineInFile asString;
                               yourself).
  ]

  setTrackerToFalse: message expected: expected actual: actual [
    tracker status: false.
    tracker error: (Dictionary new
                               add: #message  -> message;
                               add: #line     -> thisContext parentContext parentContext currentLineInFile asString;
                               add: #expected -> expected;
                               add: #actual   -> actual;
                               yourself).
  ]
]
