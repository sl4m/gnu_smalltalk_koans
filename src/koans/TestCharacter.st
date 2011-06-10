Koan subclass: TestCharacter [
  <comment: 'A collection of character tests.'>

  testCharactersCanBeCompared [
    | character anotherCharacter |

    character := $A.
    anotherCharacter := $B.

    self expect: (self fillMeIn) toEqual: (character < anotherCharacter).
    self expect: (self fillMeIn) toEqual: (character max: anotherCharacter).
  ]

  testCharacterAsciiValue [
    | character anotherCharacter andAnotherCharacter |

    character := $s.
    anotherCharacter := $1.
    andAnotherCharacter := $$.

    self expect: (self fillMeIn) toEqual: (character asciiValue).
    self expect: (self fillMeIn) toEqual: (anotherCharacter asciiValue).
    self expect: (self fillMeIn) toEqual: (andAnotherCharacter asciiValue).
  ]

  testUnprintableCharacters [
    | character anotherCharacter |

    "Smalltalk provides messages for 'unprintable' characters."

    character := Character tab.
    anotherCharacter := Character backspace.

    self expect: (self fillMeIn) toEqual: (character = (Character value: 9)).
    "Imma let you finish, but 'Unprintable' characters can actually be printed."
    self expect: (self fillMeIn) toEqual: (anotherCharacter = ($<8>)).
  ]

  testDigitAndLetter [
    | character anotherCharacter |

    character := $A.
    anotherCharacter := $9.

    self expect: (self fillMeIn) toEqual: (character isLetter).
    self expect: (self fillMeIn) toEqual: (anotherCharacter isDigit).
    self expect: (self fillMeIn) toEqual: (character isAlphaNumeric).
  ]

  testLetterCase [
    | character anotherCharacter |

    character := $C.
    anotherCharacter := $x.

    self expect: (self fillMeIn) toEqual: (character isUppercase).
    self expect: (self fillMeIn) toEqual: (anotherCharacter isLowercase).
  ]

  testLetterCaseConversion [
    | character anotherCharacter |

    character := $a.
    anotherCharacter := $X.

    self expect: (self fillMeIn) toEqual: (character asUppercase).
    self expect: (self fillMeIn) toEqual: (anotherCharacter asLowercase).
  ]

  testWhitespace [
    | character anotherCharacter |

    character := Character space.
    anotherCharacter := Character tab.

    self expect: (self fillMeIn) toEqual: (character isSeparator).
    self expect: (self fillMeIn) toEqual: (anotherCharacter isSeparator).
  ]

  testPunctuation [
    | character anotherCharacter andAnotherCharacter |

    character := $'.
    anotherCharacter := $?.
    andAnotherCharacter := $#.

    self expect: (self fillMeIn) toEqual: (character isPunctuation).
    self expect: (self fillMeIn) toEqual: (anotherCharacter isPunctuation).
    self expect: (self fillMeIn) toEqual: (andAnotherCharacter isPunctuation).
  ]

  testRepeatingCharacters [
    | character |

    character := $J.

    self expect: (self fillMeIn) toEqual: (character * 5).
  ]

  testIdenticalCharactersAreASingleInternalObject [
    | character anotherCharacter |

    character := $K.
    anotherCharacter := $K.

    self expect: (self fillMeIn) toEqual: (character hash = anotherCharacter).
  ]
]
