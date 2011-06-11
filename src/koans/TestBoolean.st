Koan subclass: TestBoolean [
  <comment: 'A collection of boolean tests.'>

  testIfTrueAndIfFalse [
    | result anotherResult |

    (1 < 2)
      ifTrue: [ result := true ]
      ifFalse: [ result := false ].
    ((5 + 2 * 9) < 25 )
      ifTrue: [ anotherResult := true ]
      ifFalse: [ anotherResult := false ].

    self expect: (self fillMeIn) toEqual: (result).
    self expect: (self fillMeIn) toEqual: (anotherResult).
  ]
]
