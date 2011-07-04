Test subclass: KoanTestCase [
  | tracker koan |

  setUp [
    tracker := Tracker create.
    koan    := Koan create: tracker.
  ]

  testExpectToBeTrueBehaviorOnTrueExpression [
    koan expectToBeTrue: 1 = 1.

    self assert: tracker status = true.
    self assert: tracker error  = nil.
  ]

  testExpectToBeTrueBehaviorOnFalseExpression [
    koan expectToBeTrue: 1 = 2.

    self assert: tracker status = false.
    self assert: (tracker error at: #message) = 'It is false, but SHOULD be true.'.
  ]

  testExpectToBeFalseBehaviorOnTrueExpression [
    koan expectToBeFalse: $a = $b.

    self assert: tracker status = true.
    self assert: tracker error  = nil.
  ]

  testExpectToBeFalseBehaviorOnFalseExpression [
    koan expectToBeFalse: $a = $a.

    self assert: tracker status = false.
    self assert: (tracker error at: #message) = 'It is true, but SHOULD be false.'.
  ]

  testExpectToEqualBehaviorOnTrueExpression [
    koan expect: 1 toEqual: 1.

    self assert: tracker status = true.
    self assert: tracker error  = nil.
  ]

  testExpectToEqualBehaviorOnFalseExpression [
    koan expect: 1 toEqual: 2.

    self assert: tracker status = false.
    self assert: (tracker error at: #message) = 'Expected value should equal actual value.'.
    self assert: (tracker error at: #expected) = 1.
    self assert: (tracker error at: #actual) = 2.
  ]

  testExpectToNotEqualBehaviorOnTrueExpression [
    koan expect: 1 toNotEqual: 2.

    self assert: tracker status = true.
    self assert: tracker error  = nil.
  ]

  testExpectToNotEqualBehaviorOnFalseExpression [
    koan expect: 1 toNotEqual: 1.

    self assert: tracker status = false.
    self assert: (tracker error at: #message) = 'Expected value should not equal actual value.'.
    self assert: (tracker error at: #expected) = 1.
    self assert: (tracker error at: #actual) = 1.
  ]

  testExpectToBeLikeBehaviorOnTrueExpression [
    koan expect: 1 toBeLike: 2.

    self assert: tracker status = true.
    self assert: tracker error  = nil.
  ]

  testExpectToBeLikeBehaviorOnFalseExpression [
    koan expect: 1 toBeLike: $2.

    self assert: tracker status = false.
    self assert: (tracker error at: #message) = 'Expected value is not like actual value.'.
    self assert: (tracker error at: #expected) = 1.
    self assert: (tracker error at: #actual) = $2.
  ]

  testExpectToRaiseBehaviorOnTrueExpression [
    koan expect: [Exception signal] toRaise: Exception.

    self assert: tracker status = true.
    self assert: tracker error  = nil.
  ]

  testExpectToRaiseBehaviorOnFalseExpression [
    koan expect: ['Hello World!'] toRaise: Exception.

    self assert: tracker status = false.
    self assert: (tracker error at: #message) = 'Expected exception was not given.'.
    self assert: (tracker error at: #expected) = Exception.
    self assert: (tracker error at: #actual) = 'Hello World!'.
  ]
]
