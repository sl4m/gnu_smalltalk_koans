Object subclass: Koan [
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
    (expression) ifFalse: [
      Transcript cr;
                 show: self zenMessage, '  It is false, but SHOULD be true.';
                 cr; cr.
      ^false
    ].
    ^true
  ]

  expectToBeFalse: expression [
    (expression) ifTrue: [
      Transcript cr;
                 show: self zenMessage, '  It is true, but SHOULD be false.';
                 cr; cr.
      ^false
    ].
    ^true
  ]

  expect: expectedValue toEqual: actualValue [
    (expectedValue = actualValue) ifFalse: [
      self diff value: 'Expected value should equal actual value.'
                value: expectedValue
                value: actualValue.
      ^false
    ].
    ^true
  ]

  expect: expectedValue toNotEqual: actualValue [
    (expectedValue = actualValue) ifTrue: [
      self diff value: 'Expected value should not equal actual value.'
                value: expectedValue
                value: actualValue.
      ^false
    ].
    ^true
  ]

  expect: expectedValue toBeLike: actualValue [
    (expectedValue class = actualValue class) ifFalse: [
      self diff value: 'Expected value is not similar to actual value.'
                value: expectedValue
                value: actualValue.
      ^false
    ].
    ^true
  ]
]
