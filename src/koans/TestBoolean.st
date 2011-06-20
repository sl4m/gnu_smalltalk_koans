Koan subclass: TestBoolean [
  <comment: 'A collection of boolean tests.'>

  truthValue: condition [
    condition ifTrue: [ ^#trueStuff ].
    condition ifFalse: [ ^#falseStuff ].
  ]

  testTrueIsTreatedAsTrue [
    self expect: (self fillMeIn) toEqual: (self truthValue: true).
  ]

  testFalseIsTreatedAsFalse [
    self expect: (self fillMeIn) toEqual: (self truthValue: false).
  ]

  testNilIsNotTreatedAsABoolean [
    self expect: [ self truthValue: nil ] toRaise: (self fillMeIn).
  ]

  testIfTrueAndIfFalseOnlyRespondsToBooleans [
    self expect: [ self truthValue: 1 ] toRaise: (self fillMeIn).
    self expect: [ self truthValue: 0 ] toRaise: (self fillMeIn).
    self expect: [ self truthValue: #() ] toRaise: (self fillMeIn).
    self expect: [ self truthValue: 'String' ] toRaise: (self fillMeIn).
    self expect: [ self truthValue: '' ] toRaise: (self fillMeIn).
  ]

  testAndShortCircuit [
    | x y z |

    x := 4. y := 10. z := 0.

    self expect: (self fillMeIn) toEqual: (x < 5 and: [ z := 1. y < 11 ]).
    self expect: (self fillMeIn) toEqual: z.

    z := 0.

    self expect: (self fillMeIn) toEqual: (x < 4 and: [ z := 1. y < 11 ]).
    self expect: (self fillMeIn) toEqual: z.

    "How is this different from '&'?"
  ]

  testOrShortCircuit [
    | x y z |

    x := 4. y := 10. z := 0.

    self expect: (self fillMeIn) toEqual: (x > 5 or: [ z := 1. y > 9]).
    self expect: (self fillMeIn) toEqual: z.

    z := 0.

    self expect: (self fillMeIn) toEqual: (x > 9 sqrt or: [ z := 1. y > 9]).
    self expect: (self fillMeIn) toEqual: z.
  ]

  testEqv [
    self expect: (self fillMeIn) toEqual: (true eqv: true).
    self expect: (self fillMeIn) toEqual: (true eqv: false).
    self expect: (self fillMeIn) toEqual: (false eqv: true).
    self expect: (self fillMeIn) toEqual: (false eqv: false).
  ]

  testXor [
    self expect: (self fillMeIn) toEqual: (true xor: true).
    self expect: (self fillMeIn) toEqual: (true xor: false).
    self expect: (self fillMeIn) toEqual: (false xor: true).
    self expect: (self fillMeIn) toEqual: (false xor: false).
  ]
]
