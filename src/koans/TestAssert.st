Koan subclass: TestAssert [
  <comment: 'A collection of assert tests.'>

  "Look at me, I'm a comment!  All comments are wrapped in double quotes."

  testTruth [
    self expectToBeTrue: false.  "make this true"

    "Note: all statements end with a period."
  ]

  testEquality [
    | expectedValue |  "This is declaring a variable 'expectedValue'"

    expectedValue := fillMeIn.  "':=' is an assignment operator"
    "Hint: replace 'fillMeIn' with the expected value."

    self expect: expectedValue toEqual: (5 + 5).

    "self is explicitly required in Smalltalk.  More on this in a future koan."
  ]

  testStringEquality [
    | expectedValue |

    expectedValue := fillMeIn.

    self expect: expectedValue toEqual: 'hello world!'.
  ]

  testNotEqual [
    | value |

    value := 'some value'.  "make this a different value"

    self expect: value toNotEqual: 'some value'.
  ]
]
