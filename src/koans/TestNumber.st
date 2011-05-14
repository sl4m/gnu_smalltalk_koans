Koan subclass: TestNumber [
  <comment: 'A collection of number tests.'>

  testDifferentNumbers [
    self expect: (self fillMeIn) toEqual: (1 isInteger).
    self expect: (self fillMeIn) toEqual: (1.5 isFloat).
  ]

  testSomeInterestingMessages [
    self expect: (self fillMeIn) toEqual: ((2/3) fractionPart).
    self expect: (self fillMeIn) toEqual: ((6/4) fractionPart).
  ]

  testNumberAndMagnitudeAreAbstractClasses [
    self expect: (self fillMeIn) toEqual: (1234 isKindOf: Number).
    self expect: (self fillMeIn) toEqual: (1234 isKindOf: Magnitude).
  ]
]
