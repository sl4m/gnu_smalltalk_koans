Koan subclass: TestNumber [
  <comment: 'A collection of number tests.'>

  testDifferentNumbers [
    self expect: fillMeIn toEqual: 1 isInteger.
    self expect: fillMeIn toEqual: 1.5 isFloat.
  ]

  testNumberParts [
    self expect: fillMeIn toEqual: (2/3) fractionPart.
    self expect: fillMeIn toEqual: 1.5 fractionPart.
  ]

  testSigns [
    self expect: fillMeIn toEqual: 2 sign.
    self expect: fillMeIn toEqual: -2 sign.
    self expect: fillMeIn toEqual: 0 sign.
  ]

  testNegation [
    self expect: fillMeIn toEqual: 2 negated.
    self expect: fillMeIn toEqual: -5 negated.
  ]

  testRounding [
    self expect: fillMeIn toEqual: 1.99 floor.
    self expect: fillMeIn toEqual: 1.99 ceiling.
  ]

  testMinMaxOfTwoNumbers [
    self expect: fillMeIn toEqual: (5 min: 10).
    self expect: fillMeIn toEqual: (10 min: 5).
    self expect: fillMeIn toEqual: (20 max: 15).
  ]

  testPositiveAndNegative [
    self expect: fillMeIn toEqual: 5 positive.
    self expect: fillMeIn toEqual: -5 negative.
    self expect: fillMeIn toEqual: 5 strictlyPositive.
    self expect: fillMeIn toEqual: 0 strictlyPositive.
  ]

  testEvenAndOdd [
    self expect: fillMeIn toEqual: 2 even.
    self expect: fillMeIn toEqual: 1 odd.
  ]
]
