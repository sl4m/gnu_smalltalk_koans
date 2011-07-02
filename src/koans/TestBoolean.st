Koan subclass: TestBoolean [
  <comment: 'A collection of boolean tests.'>

  truthValue: condition [
    condition ifTrue: [ ^#trueStuff ].
    condition ifFalse: [ ^#falseStuff ].
  ]

  testTrueIsTreatedAsTrue [
    self expect: fillMeIn toEqual: (self truthValue: true).
  ]

  testFalseIsTreatedAsFalse [
    self expect: fillMeIn toEqual: (self truthValue: false).
  ]

  testNilIsNotTreatedAsABoolean [
    self expect: [ self truthValue: nil ] toRaise: fillMeIn.
  ]

  testIfTrueAndIfFalseOnlyRespondsToBooleans [
    self expect: [ self truthValue: 1 ] toRaise: fillMeIn.
    self expect: [ self truthValue: 0 ] toRaise: fillMeIn.
    self expect: [ self truthValue: #() ] toRaise: fillMeIn.
    self expect: [ self truthValue: 'String' ] toRaise: fillMeIn.
    self expect: [ self truthValue: '' ] toRaise: fillMeIn.
  ]

  testAndShortCircuit [
    | x y z |

    x := 4. y := 10. z := 0.

    self expect: fillMeIn toEqual: (x < 5 and: [ z := 1. y < 11 ]).
    self expect: fillMeIn toEqual: z.

    z := 0.

    self expect: fillMeIn toEqual: (x < 4 and: [ z := 1. y < 11 ]).
    self expect: fillMeIn toEqual: z.

    "How is this different from '&'?"
  ]

  testOrShortCircuit [
    | x y z |

    x := 4. y := 10. z := 0.

    self expect: fillMeIn toEqual: (x > 5 or: [ z := 1. y > 9]).
    self expect: fillMeIn toEqual: z.

    z := 0.

    self expect: fillMeIn toEqual: (x > 9 sqrt or: [ z := 1. y > 9]).
    self expect: fillMeIn toEqual: z.
  ]

  testEqv [
    self expect: fillMeIn toEqual: (true eqv: true).
    self expect: fillMeIn toEqual: (true eqv: false).
    self expect: fillMeIn toEqual: (false eqv: true).
    self expect: fillMeIn toEqual: (false eqv: false).
  ]

  testXor [
    self expect: fillMeIn toEqual: (true xor: true).
    self expect: fillMeIn toEqual: (true xor: false).
    self expect: fillMeIn toEqual: (false xor: true).
    self expect: fillMeIn toEqual: (false xor: false).
  ]
]
