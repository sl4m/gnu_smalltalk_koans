Koan subclass: TestBlock [
  <comment: 'A collection of block tests.'>

  testBlockCreation [
    | block anotherBlock |

    block := [].
    anotherBlock := BlockClosure new.

    self expect: fillMeIn toEqual: block class.
    self expect: fillMeIn toEqual: anotherBlock class.
  ]

  testSendingValueMessageExecutesBlocks [
    | block anotherBlock string |

    block := [ 'Smalltalk' ].

    self expect: fillMeIn toEqual: block value.

    anotherBlock := [ string := 'Virtual Machine' ].
    anotherBlock value.

    self expect: fillMeIn toEqual: string.
  ]

  testBlocksReturnAnyKindOfValue [
    | block anotherBlock andAnotherBlock |

    block := [ 10 ].
    anotherBlock := [ #smalltalk ].
    andAnotherBlock := [ true ].

    self expect: fillMeIn toEqual: block value.
    self expect: fillMeIn toEqual: anotherBlock value.
    self expect: fillMeIn toEqual: andAnotherBlock value.
  ]

  testPassingArgumentsToBlocks [
    | block |

    block := [ :argOne :argTwo | argOne, ' and ', argTwo ].

    self expect: fillMeIn toEqual: (block value: 'Alan' value: 'Dan').
  ]

  testBlockArgumentLimit [
    | block |

    block := [ :x :y :z | x + y * z ].

    self expect: fillMeIn toEqual: (block value: 10 value: 2 value: 3).
    "Blocks accept between zero up to 3 separate arguments."
  ]

  testPassingMoreThanThreeArguments [
    | block |

    block := [ :a :b :c :d :e | a + b + c + d + e ].

    self expect: fillMeIn toEqual: (block valueWithArguments: #(2 4 6 8 10)).
  ]

  testPassingMoreArgumentsThanExpected [
    | block |

    block := [ :x | x ].

    self expect: [ block value: 1 value: 2 ] toRaise: fillMeIn.
  ]

  testIterateUsingInterval [
    | counter |

    counter := 0.
    1 to: 5 do: [ :n | counter := counter + n ].

    self expect: fillMeIn toEqual: counter.

    counter := 0.
    1 to: 10 by: 2 do: [ :n | counter := counter + n ].

    self expect: fillMeIn toEqual: counter.
  ]

  testClosure [
    | value block |

    value := 10.
    block := [ :number | number + value ].

    self expect: fillMeIn toEqual: (block value: 20).
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

    self expect: fillMeIn toEqual: block value.
    self expect: fillMeIn toEqual: block value.
    self expect: fillMeIn toEqual: block value.
  ]

  testCull [
    | block |

    block := [].

    self expect: fillMeIn toEqual: (block cull: 1).
    self expect: [ block value: 1 ] toRaise: fillMeIn.
  ]

  testEachBlockIsAUniqueObject [
    self expect: fillMeIn toEqual: ([] hash = [] hash).
  ]
]
