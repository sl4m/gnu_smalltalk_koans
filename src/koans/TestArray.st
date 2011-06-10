Koan subclass: TestArray [
  <comment: 'A collection of array tests.'>

  testCreatingArrays [
    | emptyArray |

    emptyArray := Array new.

    self expect: (self fillMeIn) toEqual: (emptyArray class).
    self expect: (self fillMeIn) toEqual: (emptyArray size).
  ]

  testCreatingArrayWithSpecifiedSize [
    | array |

    "Arrays are not dynamic, size needs to be specified."

    array := Array new: 3.

    self expect: (self fillMeIn) toEqual: (array isEmpty).

    "Array index starts at 1, not 0 like most languages."

    self expect: (self fillMeIn) toEqual: (array at: 1).

    array
      at: 1 put: 'abc';
      at: 2 put: 10;
      at: 3 put: false.

    self expect: (self fillMeIn) toEqual: (array at: 1).
    self expect: (self fillMeIn) toEqual: (array at: 2).
    self expect: (self fillMeIn) toEqual: (array at: 3).
  ]

  testCreatingConstantArray [
    | array anotherArray |

    array := #('a' 'b' 'c').
    anotherArray := (Array with: 'a' with: 'b' with: 'c').

    self expect: (self fillMeIn) toEqual: (array = anotherArray).

    "#() only accepts literal values."
  ]

  testCreatingAnArrayThatEvaluatesExpressions [
    | array |

    array := { 1-1 . 2*2 . 3+4 }.

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

    self expect: (self fillMeIn) toEqual: (array includes: 4).
  ]

  testOccurrences [
    | array |

    array := #(1 2 2 3 4 4 2 6 8).

    self expect: (self fillMeIn) toEqual: (array occurrencesOf: 2).
  ]
]
