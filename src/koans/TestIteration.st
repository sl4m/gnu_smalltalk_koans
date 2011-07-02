Koan subclass: TestIteration [
  <comment: 'A collection of iteration tests.'>

  testWhileTrue [
    | x y |

    x := 4. y := 1.

    [ x > 0 ] whileTrue: [ x := x - 1. y := y * 2 ].

    self expect: fillMeIn toEqual: y.
    self expect: fillMeIn toEqual: x.
  ]

  testWhileFalse [
    | x y |

    x := 0. y := 1.

    [ x >= 4 ] whileFalse: [ x := x + 1. y := y * 2 ].

    self expect: fillMeIn toEqual: y.
    self expect: fillMeIn toEqual: x.
  ]

  testTimesRepeat [
    | x y |

    x := 4. y := 2.

    x timesRepeat: [ y := y * 2 ].

    self expect: fillMeIn toEqual: y.
  ]
]
