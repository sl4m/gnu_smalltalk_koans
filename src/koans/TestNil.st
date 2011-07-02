Koan subclass: TestNil [
  <comment: 'A collection of nil tests.'>

  testNilIsAnObject [
    self expect: fillMeIn toEqual: (nil isMemberOf: UndefinedObject).
  ]

  testNilIsTheSameInstance [
    self expect: fillMeIn toEqual: nil.

    "nil is a singleton instance."
  ]

  testUndefinedObjectInstancesAreNotTheSame [
    "expect:toBeLike: checks if objects belong to same class."

    self expect: fillMeIn toBeLike: UndefinedObject new.
  ]

  testNilChecking [
    self expect: fillMeIn toEqual: nil isNil.
  ]
]
