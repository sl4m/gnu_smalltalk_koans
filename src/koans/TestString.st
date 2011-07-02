Koan subclass: TestString [
  <comment: 'A collection of string tests.'>

  testStringsCanOnlyBeCreatedUsingSingleQuotes [
    | string |

    string := 'Hello World'.

    self expect: fillMeIn toEqual: string.
  ]

  testUseSingleQuotesInStrings [
    | string |

    string := 'Bob''s Bakery'.

    self expect: fillMeIn toEqual: string.
    "No quote escaping or character escaping of any kind exist."
  ]

  testStringConcatenation [
    | string |

    string := 'Hello ', 'World'.

    self expect: fillMeIn toEqual: string.

    "Concatenation does not quite work this way..."
    self expect: [ 'Hello ' + 'World' ] toRaise: fillMeIn.
  ]

  testStringConcatenationWillLeaveOriginalStringsUnmodified [
    | stringA stringB stringC |

    stringA := 'Good day, '.
    stringB := 'sir!'.
    stringC := stringA, stringB.

    self expect: fillMeIn toEqual: stringA.
    self expect: fillMeIn toEqual: stringB.
  ]

  testStringInterpolation [
    | string |

    string := '%1 is really cool'.

    self expect: fillMeIn toEqual: (string % { 'Smalltalk' }).
  ]

  testSmalltalkExpressionMayBeInterpolated [
    | string |

    string := 'I am %1 years old'.

    self expect: fillMeIn toEqual: (string % { 5 squared }).
  ]

  testSubstring [
    | string |

    string := 'Smalltalk'.

    self expect: fillMeIn toEqual: (string copyFrom: 6 to: 9).
  ]

  testItWillRaiseExceptionIfIndexIsOutOfBounds [
    | string |

    string := 'Smalltalk'.

    self expect: [ string copyFrom: 6 to: 10 ] toRaise: fillMeIn.
  ]

  testSingleCharacterFromString [
    | string |

    string := 'Smalltalk'.

    self expect: fillMeIn toEqual: (string at: 1).
    self expect: fillMeIn toEqual: (string at: 6).

    "Characters will be covered in another koan."
  ]

  testUniquenessOfStringObjects [
    | a b |

    a := 'a string'.
    b := 'a string'.

    self expect: fillMeIn toEqual: (a = b).
    self expect: fillMeIn toEqual: (a == b).
    self expect: fillMeIn toEqual: (a hash = b hash).
  ]
]
