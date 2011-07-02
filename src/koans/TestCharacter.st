Koan subclass: TestCharacter [
  <comment: 'A collection of character tests.'>

  testCharactersCanBeCompared [
    | character anotherCharacter |

    character := $A.
    anotherCharacter := $B.

    self expect: fillMeIn toEqual: (character < anotherCharacter).
    self expect: fillMeIn toEqual: (character max: anotherCharacter).
  ]

  testCharacterAsciiValue [
    | character anotherCharacter andAnotherCharacter |

    character := $s.
    anotherCharacter := $1.
    andAnotherCharacter := $$.

    self expect: fillMeIn toEqual: character asciiValue.
    self expect: fillMeIn toEqual: anotherCharacter asciiValue.
    self expect: fillMeIn toEqual: andAnotherCharacter asciiValue.
  ]

  testUnprintableCharacters [
    | character anotherCharacter |

    "Smalltalk provides messages for 'unprintable' characters."

    character := Character tab.
    anotherCharacter := Character backspace.

    self expect: fillMeIn toEqual: (character = (Character value: 9)).
    "Imma let you finish, but 'Unprintable' characters can actually be printed."
    self expect: fillMeIn toEqual: (anotherCharacter = ($<8>)).
  ]

  testDigitAndLetter [
    | character anotherCharacter |

    character := $A.
    anotherCharacter := $9.

    self expect: fillMeIn toEqual: character isLetter.
    self expect: fillMeIn toEqual: anotherCharacter isDigit.
    self expect: fillMeIn toEqual: character isAlphaNumeric.
  ]

  testLetterCase [
    | character anotherCharacter |

    character := $C.
    anotherCharacter := $x.

    self expect: fillMeIn toEqual: character isUppercase.
    self expect: fillMeIn toEqual: anotherCharacter isLowercase.
  ]

  testLetterCaseConversion [
    | character anotherCharacter |

    character := $a.
    anotherCharacter := $X.

    self expect: fillMeIn toEqual: character asUppercase.
    self expect: fillMeIn toEqual: anotherCharacter asLowercase.
  ]

  testWhitespace [
    | character anotherCharacter |

    character := Character space.
    anotherCharacter := Character tab.

    self expect: fillMeIn toEqual: character isSeparator.
    self expect: fillMeIn toEqual: anotherCharacter isSeparator.
  ]

  testPunctuation [
    | character anotherCharacter andAnotherCharacter |

    character := $'.
    anotherCharacter := $?.
    andAnotherCharacter := $#.

    self expect: fillMeIn toEqual: character isPunctuation.
    self expect: fillMeIn toEqual: anotherCharacter isPunctuation.
    self expect: fillMeIn toEqual: andAnotherCharacter isPunctuation.
  ]

  testRepeatingCharacters [
    | character |

    character := $J.

    self expect: fillMeIn toEqual: (character * 5).
  ]

  testIdenticalCharactersAreASingleInternalObject [
    | character anotherCharacter |

    character := $K.
    anotherCharacter := $K.

    self expect: fillMeIn toEqual: (character hash = anotherCharacter hash).
  ]
]
