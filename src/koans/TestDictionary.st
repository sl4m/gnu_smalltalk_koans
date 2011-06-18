Koan subclass: TestDictionary [
  testCreatingANewDictionary [
    | dictionary |

    dictionary := Dictionary new.

    self expect: (self fillMeIn) toEqual: (dictionary isEmpty).
    self expect: (self fillMeIn) toEqual: (dictionary size).
  ]

  testAddingKeysAndValuesUsingAssociations [
    | dictionary |

    dictionary := Dictionary new.
    dictionary
      add: #a   -> 1;
      add: 'b'  -> 2;
      add: 100  -> 3;
      add: true -> 4;
      add: nil  -> 5.

    self expect: (self fillMeIn) toEqual: (dictionary at: #a).
    self expect: (self fillMeIn) toEqual: (dictionary at: 'b').
    self expect: (self fillMeIn) toEqual: (dictionary at: 100).
    self expect: (self fillMeIn) toEqual: (dictionary at: true).
    self expect: (self fillMeIn) toEqual: (dictionary at: nil).
  ]

  testAddingAssociationsUsingAtPut [
    | dictionary |

    dictionary := Dictionary new.
    dictionary
      at: #a put: 1;
      at: #b put: 2.

    self expect: (self fillMeIn) toEqual: (dictionary at: #a).
    self expect: (self fillMeIn) toEqual: (dictionary at: #b).
  ]

  testReplaceValueAtKey [
    | dictionary |

    dictionary := Dictionary new.

    dictionary at: #a put: 1.
    dictionary at: #a put: 2.

    self expect: (self fillMeIn) toEqual: (dictionary at: #a).
  ]

  testRetrievingCollectionOfKeysAndValues [
    | dictionary |

    dictionary := Dictionary new.

    self expect: (self fillMeIn) toEqual: (dictionary keys).
    self expect: (self fillMeIn) toEqual: (dictionary values).

    dictionary add: #a -> 1.
    dictionary add: #b -> 2.
    dictionary add: #c -> 3.

    self expect: (self fillMeIn) toEqual: (dictionary keys).
    self expect: (self fillMeIn) toEqual: (dictionary values).
    self expect: (self fillMeIn) toEqual: (dictionary keys class).
    self expect: (self fillMeIn) toEqual: (dictionary values class).
  ]
]
