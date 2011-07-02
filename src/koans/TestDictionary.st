Koan subclass: TestDictionary [
  <comment: 'A collection of dictionary tests.'>

  testCreatingANewDictionary [
    | dictionary |

    dictionary := Dictionary new.

    self expect: fillMeIn toEqual: dictionary isEmpty.
    self expect: fillMeIn toEqual: dictionary size.
  ]

  testAddingKeysAndValuesUsingAssociations [
    | dictionary |

    dictionary := Dictionary new
                    add: #a   -> 1;
                    add: 'b'  -> 2;
                    add: 100  -> 3;
                    add: true -> 4;
                    add: nil  -> 5;
                    yourself.

    self expect: fillMeIn toEqual: (dictionary at: #a).
    self expect: fillMeIn toEqual: (dictionary at: 'b').
    self expect: fillMeIn toEqual: (dictionary at: 100).
    self expect: fillMeIn toEqual: (dictionary at: true).
    self expect: fillMeIn toEqual: (dictionary at: nil).
  ]

  testAddingAssociationsUsingAtPut [
    | dictionary |

    dictionary := Dictionary new
                    at: #a put: 1;
                    at: #b put: 2;
                    yourself.

    self expect: fillMeIn toEqual: (dictionary at: #a).
    self expect: fillMeIn toEqual: (dictionary at: #b).
  ]

  testReplaceValueAtKey [
    | dictionary |

    dictionary := Dictionary new.

    dictionary at: #a put: 1.
    dictionary at: #a put: 2.

    self expect: fillMeIn toEqual: (dictionary at: #a).
  ]

  testRetrievingCollectionOfKeysAndValues [
    | dictionary |

    dictionary := Dictionary new.

    self expect: fillMeIn toEqual: dictionary keys.
    self expect: fillMeIn toEqual: dictionary values.

    dictionary add: #a -> 1.
    dictionary add: #b -> 2.
    dictionary add: #c -> 3.

    self expect: fillMeIn toEqual: dictionary keys.
    self expect: fillMeIn toEqual: dictionary values.
    self expect: fillMeIn toEqual: dictionary keys class.
    self expect: fillMeIn toEqual: dictionary values class.

    "Why do you think the classes are different?"
  ]

  testRemoveKey [
    | dictionary value |

    dictionary := Dictionary new
                    add: #a -> 1;
                    add: #b -> 3;
                    yourself.

    value := dictionary removeKey: #a.

    self expect: fillMeIn toEqual: value.
    self expect: fillMeIn toEqual: dictionary keys.

    self expect: [ dictionary removeKey: #c ] toRaise: fillMeIn.

    value := dictionary removeKey: #c ifAbsent: [0].

    self expect: fillMeIn toEqual: value.
  ]

  testIncludesKey [
    | dictionary |

    dictionary := Dictionary new
                    add: #daft -> 5;
                    add: #duck -> 55;
                    yourself.

    self expect: fillMeIn toEqual: (dictionary includesKey: #daft).
    self expect: fillMeIn toEqual: (dictionary includesKey: #monk).
    self expect: fillMeIn toEqual: (dictionary includesKey: 'daft').
  ]

  testIteratingKeys [
    | dictionary array counter |

    dictionary := Dictionary new
                    add: #a -> 2;
                    add: #c -> 4;
                    add: #e -> 6;
                    yourself.
    array := Array new: dictionary size.
    counter := 1.

    dictionary keysDo: [ :key |
      array at: counter put: key.
      counter := counter + 1.
    ].

    self expect: fillMeIn toEqual: array.
  ]

  testIteratingAssociations [
    | dictionary array counter |

    dictionary := Dictionary new
                    add: #a -> 1;
                    add: #b -> 2;
                    add: #c -> 3;
                    yourself.
    array := Array new: dictionary size.
    counter := 1.

    dictionary associationsDo: [ :association |
      array at: counter put: association.
      counter := counter + 1.
    ].
    array sort.

    self expect: fillMeIn toEqual: array.
    "Be careful how you craft the array."
  ]

  testIteratingKeysAndValues [
    | dictionary array counter |

    dictionary := Dictionary new
                    add: #a -> 1;
                    add: #b -> 2;
                    add: #c -> 3;
                    yourself.
    array := Array new: dictionary size.
    counter := 1.

    dictionary keysAndValuesDo: [ :key :value |
      array at: counter put: (key -> value).
      counter := counter + 1.
    ].

    self expect: fillMeIn toEqual: array.
  ]

  testSmalltalkDictionary [
    self expect: fillMeIn toEqual: Smalltalk class.
    self expect: fillMeIn toEqual: (Smalltalk isKindOf: Dictionary).
  ]
]
