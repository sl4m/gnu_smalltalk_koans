Koan subclass: TestAssert [
  <comment: 'A collection of assert tests.'>

  testTruth [
    self expectToBeTrue: false.  "make this true"
  ]

  testEquality [
    | expectedValue |
    expectedValue := (self fillMeIn).
    self expect: expectedValue toEqual: (5 + 5).
  ]

  testStringEquality [
    | expectedValue |
    expectedValue := (self fillMeIn).
    self expect: expectedValue toEqual: ('hello world!').
  ]

  testInequality [
    | value |
    value := 'some value'.  "make this a different value"
    self expect: value toNotEqual: 'some value'.
  ]
]
