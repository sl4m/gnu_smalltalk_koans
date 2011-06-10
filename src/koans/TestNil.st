Koan subclass: TestNil [
  <comment: 'A collection of nil tests.'>

  testNilIsAnObject [
    self expect: (self fillMeIn) toEqual: (nil isMemberOf: UndefinedObject).
  ]

  testNilIsTheSameInstance [
    self expect: (self fillMeIn) toEqual: nil.

    "nil is a singleton instance."
  ]

  testUndefinedObjectInstancesAreNotTheSame [
    "expect:toBeLike: checks if objects belong to same class."

    self expect: (self fillMeIn) toBeLike: UndefinedObject new.
  ]

  testNilChecking [
    self expect: (self fillMeIn) toEqual: nil isNil.
  ]
]
