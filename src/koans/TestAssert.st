Koan subclass: TestAssert [
  <comment: 'A collection of assert tests.'>

  "Look at me, I'm a comment!  All comments are wrapped in double quotes."

  testTruth [
    self expectToBeTrue: false.  "make this true"
  ]

  testEquality [
    | expectedValue |  "This is declaring a variable 'expectedValue'"
    expectedValue := (self fillMeIn).  "':=' is an assignment operator"

    self expect: expectedValue toEqual: (5 + 5).

    "self is not implicit in Smalltalk.  More on this in a future koan."
  ]

  testStringEquality [
    | expectedValue |
    expectedValue := (self fillMeIn).

    self expect: expectedValue toEqual: ('hello world!').  "Strings are wrapped in single quotes"
  ]

  testNotEqual [
    | value |
    value := 'some value'.  "make this a different value"

    self expect: value toNotEqual: 'some value'.
  ]
]
