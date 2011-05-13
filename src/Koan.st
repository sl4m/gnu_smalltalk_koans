Object subclass: Koan [
  | tracker |

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

  zenMessage [
    ^'Whoops!'
  ]

  prettify: value [
    | prettyValue |

    (value = self fillMeIn)
      ifTrue: [ ^value ].
    (value respondsTo: #asString)
      ifTrue: [
        ^value asString, ' (an instance of ', value class name, ')'
      ].
    (value class = True)
      ifTrue: [ ^'true' ].
    (value class = False)
      ifTrue: [ ^'false' ].
    ^'(an instance of ', value class name, ')'
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
]
