Koan subclass: TestNil [
  <comment: 'A collection of nil tests.'>

  testNilIsAnObject [
    "name returns symbol"

    self expect: (self fillMeIn) toEqual: (nil isMemberOf: UndefinedObject).
  ]

  testNilIsTheSameInstance [
    self expect: nil toEqual: nil.
  ]

  testNilInstancesAreNotTheSame [
    "expect:toBeLike: selector checks for exact class names"

    self expect: (self fillMeIn) toBeLike: UndefinedObject new.
  ]

  testNilChecking [
    self expect: (self fillMeIn) toEqual: nil isNil.
  ]
]
