Koan subclass: TestBlock [
  <comment: 'A collection of block tests.'>

  testBlockCreation [
    | block anotherBlock |

    block := [].
    anotherBlock := BlockClosure new.

    self expect: (self fillMeIn) toEqual: block class.
    self expect: (self fillMeIn) toEqual: anotherBlock class.
  ]

  testSendingValueMessageExecutesBlocks [
    | block anotherBlock string |

    block := [ 'Smalltalk' ].

    self expect: (self fillMeIn) toEqual: block value.

    anotherBlock := [ string := 'Virtual Machine' ].
    anotherBlock value.

    self expect: (self fillMeIn) toEqual: string.
  ]

  testBlocksReturnAnyKindOfValue [
    | block anotherBlock andAnotherBlock |

    block := [ 10 ].
    anotherBlock := [ #smalltalk ].
    andAnotherBlock := [ true ].

    self expect: (self fillMeIn) toEqual: (block value).
    self expect: (self fillMeIn) toEqual: (anotherBlock value).
    self expect: (self fillMeIn) toEqual: (andAnotherBlock value).
  ]

  testPassingArgumentsToBlocks [
    | block |

    block := [ :argOne :argTwo | argOne, ' and ', argTwo ].

    self expect: (self fillMeIn) toEqual: (block value: 'Alan' value: 'Dan').
  ]

  testBlockArgumentLimit [
    | block |

    block := [ :x :y :z | x + y * z ].

    self expect: (self fillMeIn) toEqual: (block value: 10 value: 2 value: 3).
    "Blocks accept between zero up to 3 separate arguments."
  ]

  testPassingMoreThanThreeArguments [
    | block |

    block := [ :a :b :c :d :e | a + b + c + d + e ].

    self expect: (self fillMeIn) toEqual: (block valueWithArguments: #(2 4 6 8 10)).
  ]

  testPassingMoreArgumentsThanExpected [
    | block |

    block := [ :x | x ].

    self expect: [block value: 1 value: 2] toRaise: (self fillMeIn).
  ]

  testIntegerLoop [
    | counter |

    counter := 0.
    1 to: 5 do: [ :n | counter := counter + n ].

    self expect: (self fillMeIn) toEqual: (counter).

    counter := 0.
    1 to: 10 by: 2 do: [ :n | counter := counter + n ].

    self expect: (self fillMeIn) toEqual: (counter).
  ]

  testClosure [
    | value block |

    value := 10.
    block := [ :number | number + value ].

    self expect: (self fillMeIn) toEqual: (block value: 20).
  ]

  testRealClosure [
    | counter block |

    counter := 1.

    block := [
      | variable |

      variable isNil ifTrue: [ variable := counter ].
      counter := counter + 1.
      variable.
    ].

    self expect: (self fillMeIn) toEqual: (block value).
    self expect: (self fillMeIn) toEqual: (block value).
    self expect: (self fillMeIn) toEqual: (block value).
  ]

  testCull [
    | block |

    block := [].

    self expect: (self fillMeIn) toEqual: (block cull: 1).
    self expect: [block value: 1] toRaise: (self fillMeIn).
  ]

  testEachBlockIsAUniqueObject [
    self expect: (self fillMeIn) toEqual: ([] hash = [] hash).
  ]
]
