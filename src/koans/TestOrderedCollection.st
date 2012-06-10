Koan subclass: TestOrderedCollection [
  <comment: 'A collection of ordered collection tests.'>

  testActsLikeAnExpandableArray [
    | orderedCollection |

    orderedCollection := OrderedCollection new.
    orderedCollection
      add: 1;
      add: 2;
      add: 3.

    self expect: fillMeIn toEqual: (orderedCollection at: 1).
    self expect: fillMeIn toEqual: (orderedCollection at: 2).
    self expect: fillMeIn toEqual: (orderedCollection at: 3).
  ]

  testCreatingAnOrderedCollectionWithUpToFiveInitialValues [
    | orderedCollection |

    orderedCollection := OrderedCollection with: $a with: $b with: $c with: $d with: $e.

    self expect: fillMeIn toEqual: (orderedCollection).
    self expect: [ OrderedCollection with: 'a' with: 'b' with: 'c' with: 'd' with: 'e' with: 'f' ] toRaise: fillMeIn.

    "OrderedCollection responds to most messages that Array responds to."
  ]

  testCreatingAnOrderedCollectionFromAConstantArray [
    | orderedCollection |

    orderedCollection := OrderedCollection new addAll: #(5 6 7); yourself.

    self expect: fillMeIn toEqual: orderedCollection.
  ]

  testAddElements [
    | orderedCollection |

    orderedCollection := OrderedCollection with: 1.
    orderedCollection addFirst: 2.

    self expect: fillMeIn toEqual: orderedCollection.

    orderedCollection addLast: 3.

    self expect: fillMeIn toEqual: orderedCollection.

    orderedCollection add: 4 afterIndex: 2.

    self expect: fillMeIn toEqual: orderedCollection.

    orderedCollection add: 5 beforeIndex: 2.

    self expect: fillMeIn toEqual: orderedCollection.
  ]

  testRemoveElements [
    | orderedCollection |

    orderedCollection := OrderedCollection with: 1 with: 2 with: 3 with: 4.
    orderedCollection removeFirst.

    self expect: fillMeIn toEqual: orderedCollection.

    orderedCollection removeLast.

    self expect: fillMeIn toEqual: orderedCollection.

    orderedCollection removeAtIndex: 1.

    self expect: fillMeIn toEqual: orderedCollection.
  ]

  testAccessingElements [
    | orderedCollection |

    orderedCollection := #(5 6 7 8) asOrderedCollection.

    self expect: fillMeIn toEqual: (orderedCollection at: 1).
    self expect: fillMeIn toEqual: orderedCollection first.
    self expect: fillMeIn toEqual: orderedCollection second.
    self expect: fillMeIn toEqual: orderedCollection third.
    self expect: fillMeIn toEqual: orderedCollection fourth.
  ]

  testComparingOrderedCollections [
    | orderedCollection anotherOrderedCollection |

    orderedCollection := OrderedCollection with: 1 with: 2.
    anotherOrderedCollection := OrderedCollection with: 2 with: 1.

    self expect: fillMeIn toEqual: (orderedCollection = anotherOrderedCollection).
  ]
]
