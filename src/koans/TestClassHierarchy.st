Koan subclass: TestClassHierarchy [
  <comment: 'A collection of class hierarchy tests.'>

  testSuperclasses [
    self expect: (self fillMeIn) toEqual: (SmallInteger superclass).
    self expect: (self fillMeIn) toEqual: (String superclass).
    self expect: (self fillMeIn) toEqual: (String superclass).
    self expect: (self fillMeIn) toEqual: (True superclass).
  ]

  testNumberAndMagnitudeAreAbstractClasses [
    self expect: (self fillMeIn) toEqual: (1234 isKindOf: Number).
    self expect: (self fillMeIn) toEqual: (1234 isKindOf: Magnitude).
  ]
]
