Object subclass: Koan [
  | tracker |

  ZenMessages := #(
    'Do not lose hope.'
  ).

  Koan class >> create: newTracker [
    ^self new
          tracker: newTracker;
          yourself
  ]

  tracker: newTracker [
    tracker := newTracker
  ]

  tracker [
    ^tracker
  ]

  fillMeIn [
    ^'FILL ME IN'.
  ]

  zenMessageCollection [
    ^#(
        'Do not lose hope.'
      )
  ]

  zenMessage [
    ^self zenMessageCollection at: (Random between: 1 and: self zenMessageCollection size)
  ]

  className: value [
    ^value class name asString
  ]

  anInstanceOf: value [
    ^' (an instance of ', (self className: value), ')'
  ]

  prettify: value [
    | message |

    (value = self fillMeIn)
      ifTrue: [ ^value ].
    (value class = True)
      ifTrue: [ ^'true' ].
    (value class = False)
      ifTrue: [ ^'false' ].
    (value class = UndefinedObject)
      ifTrue: [ ^'nil (an instance of UndefinedObject)' ].
    (value class = Character)
      ifTrue: [
        ^'$', value asString, ' ', (self anInstanceOf: value)
      ].
    ((value isKindOf: Collection) & (value class ~~ String) & (value class ~~ Symbol))
      ifTrue: [
        message := value displayString replacingRegex: ((self className: value), ' ') with: ''.
        ^message, (self anInstanceOf: value)
      ].
    (Exception allSubclasses asArray includes: value)
      ifTrue: [
        ^value displayString
      ].
    (value isKindOf: Metaclass)
      ifTrue: [
        ^value displayString
      ].
    (value respondsTo: #selectors)
      ifTrue: [
        ^value name asString
      ].
    (value respondsTo: #asString)
      ifTrue: [
        ^value asString, ' ', (self anInstanceOf: value)
      ].
    ^self anInstanceOf: value
  ]

  diff [
    ^[ :message :expectedValue :actualValue |
       Transcript cr;
                  show: self zenMessage, '  ', message;
                  cr; cr;
                  show: 'Expected : ', (self prettify: expectedValue);
                  cr;
                  show: 'Actual   : ', (self prettify: actualValue);
                  cr; cr.
    ]
  ]

  expectToBeTrue: expression [
    (self tracker status)
      ifFalse: [ ^false ].
    (expression)
      ifFalse: [
        Transcript cr;
                   show: self zenMessage, '  It is false, but SHOULD be true.';
                   cr; cr.
        self tracker status: false.
      ]
      ifTrue: [
        self tracker status: true.
      ].
  ]

  expectToBeFalse: expression [
    (self tracker status)
      ifFalse: [ ^false ].
    (expression)
      ifTrue: [
        Transcript cr;
                   show: self zenMessage, '  It is true, but SHOULD be false.';
                   cr; cr.
        self tracker status: false.
      ]
      ifFalse: [
        self tracker status: true.
      ].
  ]

  expect: expectedValue toEqual: actualValue [
    (self tracker status)
      ifFalse: [ ^false ].
    (expectedValue = actualValue)
      ifFalse: [
        self diff value: 'Expected value should equal actual value.'
                  value: expectedValue
                  value: actualValue.
        self tracker status: false.
      ]
      ifTrue: [
        self tracker status: true.
      ].
  ]

  expect: expectedValue toNotEqual: actualValue [
    (self tracker status)
      ifFalse: [ ^false ].
    (expectedValue = actualValue)
      ifTrue: [
        self diff value: 'Expected value should not equal actual value.'
                  value: expectedValue
                  value: actualValue.
        self tracker status: false.
      ]
      ifFalse: [
        self tracker status: true.
      ].
  ]

  expect: expectedValue toBeLike: actualValue [
    (self tracker status)
      ifFalse: [ ^false ].
    (expectedValue class = actualValue class)
      ifFalse: [
        self diff value: 'Expected value is not like actual value.'
                  value: expectedValue
                  value: actualValue.
        self tracker status: false.
      ]
      ifTrue: [
        self tracker status: true.
      ].
  ]

  expect: blockExpression toRaise: expectedException [
    | actualException |
    (self tracker status)
      ifFalse: [ ^false ].
    actualException := blockExpression on: Exception do: [ :signal | signal return: signal class ].
    (expectedException = actualException)
      ifFalse: [
        self diff value: 'Expected exception was not given.'
                  value: expectedException
                  value: actualException.
        self tracker status: false.
      ]
      ifTrue: [
        self tracker status: true.
      ].
  ]
]
