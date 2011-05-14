Koan subclass: TestObject [
  <comment: 'A collection of object tests.'>

  testEverythingIsAnObject [
    self expect: (self fillMeIn) toEqual: (1 isMemberOf: SmallInteger).
    self expect: (self fillMeIn) toEqual: (1.5 isMemberOf: FloatD).
    self expect: (self fillMeIn) toEqual: ((1/2) isMemberOf: Fraction).
    self expect: (self fillMeIn) toEqual: ('skim' isMemberOf: String).
    self expect: (self fillMeIn) toEqual: (nil isMemberOf: UndefinedObject).
    self expect: (self fillMeIn) toEqual: (Object isMemberOf: Object class).
  ]

  testSomeObjectsCanBeConvertedToStrings [
    self expect: (self fillMeIn) toEqual: (12345 asString).
    self expect: (self fillMeIn) toEqual: ((5/8) asString).
    self expect: [nil asString] toRaise: (self fillMeIn).
  ]

  testObjectsCanBeInspected [
    "
    1234 inspect.
    'qwerty' inspect.
    nil inspect.
    "
  ]

  testEveryObjectHasAnId [
    | object |
    object := Object new.

    self expect: (self fillMeIn) toEqual: (object hash class).
  ]

  testEveryObjectHasADifferentId [
    | object anotherObject |
    object := Object new.
    anotherObject := Object new.

    self expect: (self fillMeIn) toEqual: (object hash ~= anotherObject hash).
  ]

  testSomeSystemObjectsAlwaysHaveTheSameId [
    self expect: (self fillMeIn) toEqual: (false hash).
    self expect: (self fillMeIn) toEqual: (true  hash).
    self expect: (self fillMeIn) toEqual: (nil   hash).
  ]

  testMostIntegersHaveFixedIds [
    self expect: (self fillMeIn) toEqual: (0      hash).
    self expect: (self fillMeIn) toEqual: (1      hash).
    self expect: (self fillMeIn) toEqual: (100000 hash).
  ]

  testCopyCreatesADifferentObject [
    | object objectCopy result |
    object := Object new.
    objectCopy := object copy.
    
    self expect: (self fillMeIn) toEqual: (object = objectCopy).
    self expect: (self fillMeIn) toEqual: (object hash ~= objectCopy hash).
  ]
]
