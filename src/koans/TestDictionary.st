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
    dictionary add: #a -> 1.

    self expect: (self fillMeIn) toEqual: (dictionary at: #a).

    "Keys do not have to be symbols."

    dictionary add: 'b' -> 2.

    self expect: (self fillMeIn) toEqual: (dictionary at: 'b').

    dictionary add: 100 -> 3.

    self expect: (self fillMeIn) toEqual: (dictionary at: 100).

    dictionary add: true -> 4.

    self expect: (self fillMeIn) toEqual: (dictionary at: true).

    dictionary add: nil -> 5.

    self expect: (self fillMeIn) toEqual: (dictionary at: nil).
  ]

  testAddingKeysAndValuesUsingAtPut [
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

  testRetrievingKeysAndValues [
    | dictionary |

    dictionary := Dictionary new.

    self expect: (self fillMeIn) toEqual: (dictionary keys).
    self expect: (self fillMeIn) toEqual: (dictionary values).

    dictionary add: #a -> 1.
    dictionary add: #b -> 2.
    dictionary add: #c -> 3.

    self expect: (self fillMeIn) toEqual: (dictionary keys).
    self expect: (self fillMeIn) toEqual: (dictionary values).
  ]
]
