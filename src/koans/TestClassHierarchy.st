Koan subclass: TestClassHierarchy [
  <comment: 'A collection of class hierarchy tests.'>

  testSuperclasses [
    self expect: fillMeIn toEqual: SmallInteger superclass.
    self expect: fillMeIn toEqual: String superclass.
    self expect: fillMeIn toEqual: String superclass.
    self expect: fillMeIn toEqual: True superclass.
  ]

  testNumberAndMagnitudeAreAbstractClasses [
    self expect: fillMeIn toEqual: (1234 isKindOf: Number).
    self expect: fillMeIn toEqual: (1234 isKindOf: Magnitude).
  ]
]
