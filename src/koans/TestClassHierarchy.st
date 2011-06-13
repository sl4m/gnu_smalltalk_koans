Koan subclass: TestClassHierarchy [
  <comment: 'A collection of class hierarchy tests.'>

  testNumberAndMagnitudeAreAbstractClasses [
    self expect: (self fillMeIn) toEqual: (1234 isKindOf: Number).
    self expect: (self fillMeIn) toEqual: (1234 isKindOf: Magnitude).
  ]
]
