Koan subclass: TestArray [
  <comment: 'A collection of array tests.'>

  testCreatingAnEmptyArray [
    | emptyArray |

    emptyArray := Array new.

    self expect: (self fillMeIn) toEqual: (emptyArray class).
    self expect: (self fillMeIn) toEqual: (emptyArray size).

    "Not sure why you would do this.  See the next koan."
  ]

  testCreatingArrayWithSpecifiedSize [
    | array |

    "Arrays are not dynamic, but fixed with the size specified."

    array := Array new: 4.

    self expect: (self fillMeIn) toEqual: (array isEmpty).

    "Array index starts at 1, not 0 like most languages."

    self expect: (self fillMeIn) toEqual: (array at: 1).

    "Arrays can accept any kind of object."

    array
      at: 1 put: 'abc';
      at: 2 put: 10;
      at: 3 put: false.
      at: 4 put: $x.

    self expect: (self fillMeIn) toEqual: (array at: 1).
    self expect: (self fillMeIn) toEqual: (array at: 2).
    self expect: (self fillMeIn) toEqual: (array at: 3).
    self expect: (self fillMeIn) toEqual: (array at: 4).
  ]

  testConstantArraysAreImmutable [
    | array |

    array := #('a' 'b' 'c').

    self expect: [array at: 1 put: 'd'] toRaise: (self fillMeIn).

    "#() only accepts literal values."
  ]

  testCreatingAnArrayThatEvaluatesExpressions [
    | array |

    array := { 1-1 . 2 squared . 3+4 }.

    self expect: (self fillMeIn) toEqual: (array).

    array at: 1 put: 5.

    self expect: (self fillMeIn) toEqual: (array).
  ]

  testAccessingElements [
    | array |

    array := #(0 1 2 3).

    self expect: (self fillMeIn) toEqual: (array at: 1).
    self expect: (self fillMeIn) toEqual: (array first).
    self expect: (self fillMeIn) toEqual: (array second).
    self expect: (self fillMeIn) toEqual: (array third).
    self expect: (self fillMeIn) toEqual: (array fourth).
  ]

  testIncludesElement [
    | array |

    array := Array with: 1 with: 2 with: 3.

    self expect: (self fillMeIn) toEqual: (array includes: 2).
    self expect: (self fillMeIn) toEqual: (array includes: 4).
  ]

  testOccurrences [
    | array |

    array := #(1 2 2 3 4 4 2 6 8).

    self expect: (self fillMeIn) toEqual: (array occurrencesOf: 2).
  ]
]
