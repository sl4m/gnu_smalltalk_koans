Test subclass: ZenTestCase [
  | zen |

  setUp [
    zen := Zen new.
  ]

  testListOfKoans [
    self assert: (zen listOfKoans size = 3).
  ]

  "TODO: implement more tests"
  testListOfMethodsByKoan [
    self assert: (zen listOfMethodsByKoan: 'Assert' size > 0)
  ]
]
