Koan subclass: TestSymbol [
  <comment: 'A collection of symbol tests.'>

  testSymbolsStartWithHash [
    | symbol |

    symbol := #smalltalk.

    self expect: fillMeIn toEqual: (symbol isMemberOf: Symbol).
  ]

  testSymbolsInheritFromString [
    | symbol |

    symbol := #smalltalk.

    self expect: fillMeIn toEqual: symbol class superclass.
  ]

  testSymbolsCanBeCompared [
    | symbol anotherSymbol andAnotherSymbol |

    symbol := #smalltalk.
    anotherSymbol := #ruby.
    andAnotherSymbol := #smalltalk.

    self expect: fillMeIn toEqual: (symbol = anotherSymbol).
    self expect: fillMeIn toEqual: (symbol = andAnotherSymbol).
  ]

  testIdenticalSymbolsAreASingleInternalObject [
    | symbol anotherSymbol |

    symbol := #smalltalk.
    anotherSymbol := #smalltalk.

    self expect: fillMeIn toEqual: (symbol hash = anotherSymbol hash).
  ]

  testMethodNamesBecomeSymbols [
    | allSymbols |

    allSymbols := Symbol allInstances.

    self expect: fillMeIn toEqual: (allSymbols includes: #testMethodNamesBecomeSymbols).
    "Why do you think we store all instances of Symbol before evaluating if it is included in allSymbols?"
  ]

  testStringToSymbolConversion [
    | string |

    string := 'smalltalk'.

    self expect: fillMeIn toEqual: string asSymbol.
  ]

  testSymbolConversionWhenStringContainsNonAlphaNumerics [
    | string |

    string := 'hello world!'.

    self expect: fillMeIn toEqual: string asSymbol.
  ]

  testSymbolsHaveStringMethodsThroughInheritance [
    | symbol |

    "But with unexpected behavior..."

    symbol := #smalltalk.

    self expect: fillMeIn toEqual: symbol reverse.
    self expect: fillMeIn toEqual: (symbol, ' is fun!').
    self expect: fillMeIn toEqual: symbol size.
    self expect: fillMeIn toEqual: (symbol at: 1).
  ]
]
