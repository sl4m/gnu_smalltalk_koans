Koan subclass: TestString [
  <comment: 'A collection of string tests.'>

  testStringsCanOnlyBeCreatedUsingSingleQuotes [
    | string |

    string := 'Hello World'.

    self expect: (self fillMeIn) toEqual: string.
  ]

  testUseSingleQuotesInStrings [
    | string |

    string := 'Bob''s Bakery'.

    self expect: (self fillMeIn) toEqual: string.
    "No quote escaping or character escaping of any kind exist."
  ]

  testStringConcatenation [
    | string |

    string := 'Hello ', 'World'.

    self expect: (self fillMeIn) toEqual: string.

    "Concatenation does not quite work this way..."
    self expect: ['Hello ' + 'World'] toRaise: (self fillMeIn).
  ]

  testStringConcatenationWillLeaveOriginalStringsUnmodified [
    | stringA stringB stringC |

    stringA := 'Good day, '.
    stringB := 'sir!'.
    stringC := stringA, stringB.

    self expect: (self fillMeIn) toEqual: stringA.
    self expect: (self fillMeIn) toEqual: stringB.
  ]

  testStringInterpolation [
    | string |

    string := '%1 is really cool'.

    self expect: (self fillMeIn) toEqual: (string % { 'Smalltalk' }).
  ]

  testSmalltalkExpressionMayBeInterpolated [
    | string |

    string := 'I am %1 years old'.

    self expect: (self fillMeIn) toEqual: (string % { 5 squared }).
  ]

  testSubstring [
    | string |

    string := 'Smalltalk'.

    self expect: (self fillMeIn) toEqual: (string copyFrom: 6 to: 9).
  ]

  testItWillRaiseExceptionIfIndexIsOutOfBounds [
    | string |

    string := 'Smalltalk'.

    self expect: [string copyFrom: 6 to: 10] toRaise: (self fillMeIn).
  ]

  testStringClass [
    self expect: (self fillMeIn) toEqual: (String superclass).
  ]

  testSingleCharacterFromString [
    | string |

    string := 'Smalltalk'.

    self expect: (self fillMeIn) toEqual: (string at: 1).
    self expect: (self fillMeIn) toEqual: (string at: 6).

    "Characters will be covered in another koan."
  ]

  testUniquenessOfStringObjects [
    | a b |

    a := 'a string'.
    b := 'a string'.

    self expect: (self fillMeIn) toEqual: (a = b).
    self expect: (self fillMeIn) toEqual: (a == b).
    self expect: (self fillMeIn) toEqual: (a hash = b hash).
  ]
]
