Zen subclass: ZenWalker [
  runKoans [
    | currentTest |

    Zen.Koans do: [ :koan |
      currentTest := koan key create: tracker.
      koan value do: [ :testMethod |
        currentTest perform: testMethod.
      ]
    ]
  ]
]

Test subclass: ZenTestCase [
  | zenWalker |

  setUp [
    zenWalker := ZenWalker create: false.
  ]

  testAllKoansRunThrough [
    [ zenWalker runKoans ] on: Exception do: [ :signal |
      self assert: false
    ].
  ]
]
