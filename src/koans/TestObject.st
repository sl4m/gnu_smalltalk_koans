Koan subclass: TestObject [
  <comment: 'A collection of object tests.'>

  testEverythingIsAnObject [
    self expect: fillMeIn toEqual: (1 isMemberOf: SmallInteger).
    self expect: fillMeIn toEqual: (1.5 isMemberOf: FloatD).
    self expect: fillMeIn toEqual: ((1/2) isMemberOf: Fraction).
    self expect: fillMeIn toEqual: ('skim' isMemberOf: String).
    self expect: fillMeIn toEqual: (nil isMemberOf: UndefinedObject).
    self expect: fillMeIn toEqual: (Object isMemberOf: Object class).
  ]

  testSomeObjectsCanBeConvertedToStrings [
    self expect: fillMeIn toEqual: 12345 asString.
    self expect: fillMeIn toEqual: (5/8) asString.
  ]

  testNilObjectCannotBeConvertedToString [
    self expect: [ nil asString ] toRaise: fillMeIn.
  ]

  testObjectsCanBeInspected [
    "
    Try out these examples on GNU Smalltalk (gst) REPL:

    1234 inspect.
    'qwerty' inspect.
    nil inspect.
    "
  ]

  testEveryObjectHasAnId [
    | object |
    object := Object new.

    self expect: fillMeIn toEqual: object hash class.
  ]

  testEveryObjectHasADifferentId [
    | object anotherObject |
    object := Object new.
    anotherObject := Object new.

    self expect: fillMeIn toEqual: (object hash ~= anotherObject hash).
  ]

  testSomeSystemObjectsAlwaysHaveTheSameId [
    self expect: fillMeIn toEqual: false hash.
    self expect: fillMeIn toEqual: true  hash.
    self expect: fillMeIn toEqual: nil   hash.
  ]

  testMostIntegersHaveFixedIds [
    self expect: fillMeIn toEqual: 0      hash.
    self expect: fillMeIn toEqual: 1      hash.
    self expect: fillMeIn toEqual: 100000 hash.
  ]

  testCopyCreatesADifferentObject [
    | object objectCopy result |
    object := Object new.
    objectCopy := object copy.

    self expect: fillMeIn toEqual: (object = objectCopy).
    self expect: fillMeIn toEqual: (object hash ~= objectCopy hash).
  ]
]
