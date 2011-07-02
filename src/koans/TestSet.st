Koan subclass: TestSet [
  <comment: 'A collection of set tests.'>

  testDuplicateObjectsNotAllowed [
    | set |

    set := Set new.
    set
      add: 1;
      add: 2;
      add: 1;
      add: 2.

    self expect: fillMeIn toEqual: (set occurrencesOf: 1).
    self expect: fillMeIn toEqual: (set occurrencesOf: 2).
  ]

  testAddingSets [
    | set anotherSet |

    set := Set with: 1 with: 2.
    anotherSet := Set with: 3 with: 4.

    self expect: fillMeIn toEqual: (set + anotherSet).
    self expect: fillMeIn toEqual: (set + set).
  ]

  testSubtractingSets [
    | set anotherSet |

    set := Set with: 1 with: 2 with: 3.
    anotherSet := Set with: 1 with: 3.

    self expect: fillMeIn toEqual: (set - anotherSet).
    self expect: fillMeIn toEqual: (anotherSet - set).
  ]

  testIntersectionOfSets [
    | set anotherSet |

    set := Set with: 'a' with: 'b' with: 'c'.
    anotherSet := Set with: 'a' with: 'c'.

    self expect: fillMeIn toEqual: (set & anotherSet).
  ]

  testComparingSets [
    | set anotherSet andAnotherSet |

    set := Set with: 1 with: 2 with: 3.
    anotherSet := Set with: 2 with: 3 with: 1.

    self expect: fillMeIn toEqual: (set = anotherSet).

    andAnotherSet := Set with: 2 with: 3 with: 1 with: 4.

    self expect: fillMeIn toEqual: (set < andAnotherSet).
  ]
]
