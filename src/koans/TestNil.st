Koan subclass: TestNil [
  <comment: 'A collection of nil tests.'>

  testNilIsAnObject [
    "name returns symbol"

    ^self expect: (self fillMeIn) toEqual: nil class name.
  ]

  testNilInstancesCanBeDifferent [
    "expect:toBeLike: checks for exact class names"
    ^self expect: (self fillMeIn) toBeLike: UndefinedObject new.
  ]

  testNilChecking [
    ^self expect: (self fillMeIn) toEqual: nil isNil.
  ]
]
