Koan subclass: TestMessage [
  <comment: 'A collection of message tests.'>

  testUnaryMessage [
    | number |

    "
    A unary message consists of:
      * an alphanumeric selector
      * no arguments
    "
    number := 'hello' size.  "#size is the selector"

    self expect: (self fillMeIn) toEqual: (number).
  ]

  testBinaryMessage [
    | sum |

    "
    A binary message consists of:
      * non-alphanumeric selector (e.g., +, -) of 1 to 2 characters in length
      * exactly one argument
    "
    sum := 100 + 50.  "#+ is the selector, 50 is the argument"

    self expect: (self fillMeIn) toEqual: (sum).
  ]

  testKeywordMessage [
    "
    A keyword message consists of:
      * one or more alphanumeric selectors, each ending with a colon
      * each selector will have an argument
    "
    self expect: (self fillMeIn) toEqual: (1.02 min: 1.01).
    "#min is the selector, 1.01 is the argument"

    self expect: (self fillMeIn) toEqual: (20 between: 10 and: 15).
    "#between:and: are the keyword selectors, with respective arguments,
     10 and 15"
  ]

  testMessagePrecedence [
    | value |

    "
    Unary > Binary > Keyword

    Unary wins followed by Binary, then Keyword.
    "

    value := 7 - 1 between: 'hello' size and: 1 * 9.

    self expect: (self fillMeIn) toEqual: value.
  ]

  testArithmeticPrecedence [
    | value anotherValue |

    "
    Arithmetic precedence does not exist in Smalltalk.
    It follows message precedence like everything else.
    "

    value := 1 + 7 * 8.
    anotherValue := 1 + (7 * 8).

    self expect: (self fillMeIn) toEqual: value.
    self expect: (self fillMeIn) toEqual: anotherValue.
  ]

  testControllingPrecedenceWithParentheses [
   | value |

   value := 7 - 1 * 'hello world' size - 2 sqrt asInteger.
   
   "Hint: use multiple parentheses to control order of precedence."

   self expect: (value) toEqual: 4.
   "You should not be changing the value '4'."
  ]

  testMessageChaining [
    | value |

    "Sending multiple messages to the same receiver."

    value := 1 class name asString.  "message chaining of #class, #name, #asString"

    self expect: (self fillMeIn) toEqual: value.
  ]

  testMessageCascading [
    | value |

    value := 3 + 2; * 100.

    self expect: (self fillMeIn) toEqual: value.

    "Think about it: we're sending multiple messages to '3'."
  ]

  testYourselfIsReferenceToSelf [
    | object anotherObject |

    "yourself is a reference to self."

    object := OrderedCollection new
                add: 1;
                add: 2.
    anotherObject := OrderedCollection new
                      add: 1;
                      add: 2;
                      yourself.

    self expect: (self fillMeIn) toEqual: (object class).
    self expect: (self fillMeIn) toEqual: (anotherObject class).

    "yourself often used with message cascading."
  ]

  testRespondsTo [
    self expect: (self fillMeIn) toEqual: (3 respondsTo: #+).
    self expect: (self fillMeIn) toEqual: ('hello' respondsTo: #size).
  ]
]
