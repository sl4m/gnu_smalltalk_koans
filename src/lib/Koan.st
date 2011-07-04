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
      ifFalse: [
        tracker status: false.
        tracker error: (Dictionary new
                                   add: #message -> 'It is false, but SHOULD be true.';
                                   add: #line -> thisContext parentContext currentLineInFile asString;
                                   yourself).
      ].
    ^nil
  ]

  expectToBeFalse: expression [
    tracker status ifFalse: [^nil].
    expression
      ifTrue: [
        tracker status: false.
        tracker error: (Dictionary new
                                   add: #message -> 'It is true, but SHOULD be false.';
                                   add: #line -> thisContext parentContext currentLineInFile asString;
                                   yourself).
      ].
  ]

  expect: expectedValue toEqual: actualValue [
    tracker status ifFalse: [^nil].
    (expectedValue = actualValue)
      ifFalse: [
        tracker status: false.
        tracker error: (Dictionary new
                                   add: #message  -> 'Expected value should equal actual value.';
                                   add: #line -> thisContext parentContext currentLineInFile asString;
                                   add: #expected -> expectedValue;
                                   add: #actual   -> actualValue;
                                   yourself).

      ].
  ]

  expect: expectedValue toNotEqual: actualValue [
    tracker status ifFalse: [^nil].
    (expectedValue = actualValue)
      ifTrue: [
        tracker status: false.
        tracker error: (Dictionary new
                                   add: #message  -> 'Expected value should not equal actual value.';
                                   add: #line -> thisContext parentContext currentLineInFile asString;
                                   add: #expected -> expectedValue;
                                   add: #actual   -> actualValue;
                                   yourself).
      ].
  ]

  expect: expectedValue toBeLike: actualValue [
    tracker status ifFalse: [^nil].
    (expectedValue class = actualValue class)
      ifFalse: [
        tracker status: false.
        tracker error: (Dictionary new
                                   add: #message  -> 'Expected value is not like actual value.';
                                   add: #line -> thisContext parentContext currentLineInFile asString;
                                   add: #expected -> expectedValue;
                                   add: #actual   -> actualValue;
                                   yourself).
      ].
  ]

  expect: blockExpression toRaise: expectedException [
    | actualException |

    tracker status ifFalse: [^nil].
    actualException := blockExpression on: Exception do: [ :signal |
      signal return: signal class
    ].
    (expectedException = actualException)
      ifFalse: [
        tracker status: false.
        tracker error: (Dictionary new
                                   add: #message  -> 'Expected exception was not given.';
                                   add: #line -> thisContext parentContext currentLineInFile asString;
                                   add: #expected -> expectedException;
                                   add: #actual   -> actualException;
                                   yourself).
      ].
  ]
]
