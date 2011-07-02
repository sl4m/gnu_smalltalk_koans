Koan subclass: TestBag [
  <comment: 'A collection of bag tests.'>

  testAddingMultiplesCopiesToCollection [
    | bag |

    bag := Bag new.
    bag add: 'a' withOccurrences: 2.
    bag add: 'b' withOccurrences: 1.
    bag add: 'c'.

    self expect: fillMeIn toEqual: (bag occurrencesOf: 'a').
    self expect: fillMeIn toEqual: (bag occurrencesOf: 'b').
    self expect: fillMeIn toEqual: (bag occurrencesOf: 'c').
  ]

  testCollectionIsNotIndexable [
    | bag |

    bag := Bag new.
    bag add: 1 withOccurrences: 3.
    bag add: 2.

    self expect: [ bag at: 1 ] toRaise: fillMeIn.
  ]

  testComparingBags [
    | bag anotherBag |

    bag := Bag new.
    bag add: 1 withOccurrences: 4.
    bag add: 2 withOccurrences: 3.

    anotherBag := Bag new.
    anotherBag add: 2 withOccurrences: 3.
    anotherBag add: 1 withOccurrences: 4.

    self expect: fillMeIn toEqual: (bag = anotherBag).
  ]
]
