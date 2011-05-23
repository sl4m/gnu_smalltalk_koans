Koan subclass: TestSymbol [
  <comment: 'A collection of symbol tests.'>

  testSymbolsStartWithHash [
    | symbol |

    symbol := #smalltalk.

    self expect: (self fillMeIn) toEqual: (symbol isMemberOf: Symbol).
  ]

  testSymbolsInheritFromString [
    | symbol |

    symbol := #smalltalk.

    self expect: (self fillMeIn) toEqual: (symbol class superclass).
  ]

  testSymbolsCanBeCompared [
    | symbol anotherSymbol andAnotherSymbol |

    symbol := #smalltalk.
    anotherSymbol := #ruby.
    andAnotherSymbol := #smalltalk.

    self expect: (self fillMeIn) toEqual: (symbol = anotherSymbol).
    self expect: (self fillMeIn) toEqual: (symbol = andAnotherSymbol).
  ]

  testIdenticalSymbolsAreASingleInternalObject [
    | symbol anotherSymbol |

    symbol := #smalltalk.
    anotherSymbol := #smalltalk.

    self expect: (self fillMeIn) toEqual: (symbol hash = anotherSymbol hash).
  ]

  testMethodNamesBecomeSymbols [
    | allSymbols |

    allSymbols := Symbol allInstances.

    self expect: (self fillMeIn) toEqual: (allSymbols includes: #testMethodNamesBecomeSymbols).
    "Why do you think we store all instances of Symbol before evaluating if it is included in allSymbols?"
  ]

  testStringToSymbolConversion [
    | string |

    string := 'smalltalk'.

    self expect: (self fillMeIn) toEqual: (string asSymbol).
  ]

  testSymbolConversionWhenStringContainsNonAlphaNumerics [
    | string |

    string := 'hello world!'.

    self expect: (self fillMeIn) toEqual: (string asSymbol).
  ]

  testSymbolsHaveStringMethodsThroughInheritance [
    | symbol |

    "But with unexpected behavior..."

    symbol := #smalltalk.

    self expect: (self fillMeIn) toEqual: (symbol reverse).
    self expect: (self fillMeIn) toEqual: (symbol, ' is fun!').
    self expect: (self fillMeIn) toEqual: (symbol size).
    self expect: (self fillMeIn) toEqual: (symbol at: 1).
  ]
]
