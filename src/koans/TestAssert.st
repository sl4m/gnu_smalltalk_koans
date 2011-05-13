Koan subclass: TestAssert [
  <comment: 'A collection of assert tests.'>

  testTruth [
    "Look at me, I'm a comment!  All comments are wrapped in double quotes."

    ^self expectToBeTrue: false.  "make this true"
  ]

  testEquality [
    | expectedValue |
    expectedValue := (self fillMeIn).
    ^self expect: expectedValue toEqual: (5 + 5).
  ]

  testStringEquality [
    | expectedValue |
    expectedValue := (self fillMeIn).
    ^self expect: expectedValue toEqual: ('hello world!').
  ]

  testInequality [
    | value |
    value := 'some value'.  "make this not equal"
    ^self expect: value toNotEqual: 'some value'
  ]
]
