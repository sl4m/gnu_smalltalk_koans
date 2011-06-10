Koan subclass: TestNumber [
  <comment: 'A collection of number tests.'>

  testDifferentNumbers [
    self expect: (self fillMeIn) toEqual: (1 isInteger).
    self expect: (self fillMeIn) toEqual: (1.5 isFloat).
  ]

  testNumberParts [
    self expect: (self fillMeIn) toEqual: ((2/3) fractionPart).
    self expect: (self fillMeIn) toEqual: (1.5 fractionPart).
  ]

  testSigns [
    self expect: (self fillMeIn) toEqual: (2 sign).
    self expect: (self fillMeIn) toEqual: (-2 sign).
    self expect: (self fillMeIn) toEqual: (0 sign).
  ]

  testNegation [
    self expect: (self fillMeIn) toEqual: (2 negated).
    self expect: (self fillMeIn) toEqual: (-5 negated).
  ]

  testRounding [
    self expect: (self fillMeIn) toEqual: (1.99 floor).
    self expect: (self fillMeIn) toEqual: (1.99 ceiling).
  ]

  testMinMaxOfTwoNumbers [
    self expect: (self fillMeIn) toEqual: (5 min: 10).
    self expect: (self fillMeIn) toEqual: (10 min: 5).
    self expect: (self fillMeIn) toEqual: (20 max: 15).
  ]

  testNumberAndMagnitudeAreAbstractClasses [
    self expect: (self fillMeIn) toEqual: (1234 isKindOf: Number).
    self expect: (self fillMeIn) toEqual: (1234 isKindOf: Magnitude).
  ]
]
