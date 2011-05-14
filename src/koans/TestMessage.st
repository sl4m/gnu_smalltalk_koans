Koan subclass: TestMessage [
  <comment: 'A collection of message tests.'>

  testUnaryMessage [
    | number |

    "A unary message consists of:
      * an alphanumeric selector
      * no arguments
    "
    number := 'hello' size.  "#size is the selector"

    self expect: (self fillMeIn) toEqual: (number).
  ]

  testBinaryMessage [
    | sum |

    "A binary message consists of:
      * non-alphanumeric selector (e.g., +, -) of 1 to 2 characters in length
      * exactly one argument
    "
    sum := 100 + 50.  "#+ is the selector, 50 is the argument"

    self expect: (self fillMeIn) toEqual: (sum).
  ]

  testKeywordMessage [
    "A keyword message consists of:
      * an alphanumeric selector ending with a colon
      * one or more arguments
    "
    self expect: (self fillMeIn) toEqual: (1.02 min: 1.01).
    "#min is the selector, 1.01 is the argument"

    self expect: (self fillMeIn) toEqual: (20 between: 10 and: 15).
    "#between:and: are the keyword selectors, with respective arguments,
     10 and 15"
  ]

  testMessagePrecedence [
    | value |

    "Unary > Binary > Keyword, use parentheses to control order"

    value := 7 - 1 between: 'hello' size and: 1 * 9.

    self expect: (self fillMeIn) toEqual: value.
  ]

  testArithmeticPrecedence [
    | value anotherValue |

    "There is no such thing as arithmetic precedence in Smalltalk"

    value := 1 + 7 * 8.
    anotherValue := 1 + (7 * 8).

    self expect: (self fillMeIn) toEqual: value.
    self expect: (self fillMeIn) toEqual: anotherValue.
  ]

  testMessageChaining [
    | value |

    value := 1 class name asString.  "message chaining of #class, #name, #asString"

    self expect: (self fillMeIn) toEqual: value.
  ]

  testMessageCascading [
    "
    Sending multiple messages to the same receiver.

    Transcript show: 'hello';
               show: 'world!';
               cr.
    "
  ]
]
