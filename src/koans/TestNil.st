Koan subclass: TestNil [
  <comment: 'A collection of nil tests.'>

  testNilIsAnObject [
    self expect: (self fillMeIn) toEqual: (nil isMemberOf: UndefinedObject).
  ]

  testNilIsTheSameInstance [
    self expect: nil toEqual: nil.
  ]

  testNilInstancesAreNotTheSame [
    "expect:toBeLike: checks for exact class name"

    self expect: (self fillMeIn) toBeLike: UndefinedObject new.
  ]

  testNilChecking [
    self expect: (self fillMeIn) toEqual: nil isNil.
  ]
]
