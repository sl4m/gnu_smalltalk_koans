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
    " purely informational

    1234 inspect.
    'qwerty' inspect.
    nil inspect.

    "
  ]

  testEveryObjectHasAnId [
    | object |
    object := Object new.

    "I have no idea why it's called asOop"

    self expect: (self fillMeIn) toEqual: (object asOop class).
  ]

  testEveryObjectHasADifferentId [
    | object anotherObject |
    object := Object new.
    anotherObject := Object new.

    self expect: (self fillMeIn) toEqual: (object asOop ~= anotherObject asOop).
  ]

  testCopyCreatesADifferentObject [
    | object objectCopy result |
    object := Object new.
    objectCopy := object copy.
    
    self expect: (self fillMeIn) toEqual: (object = objectCopy).
    self expect: (self fillMeIn) toEqual: (object asOop ~= objectCopy asOop)
  ]
]
