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

    self expect: fillMeIn toEqual: number.
  ]

  testBinaryMessage [
    | sum |

    "
    A binary message consists of:
      * non-alphanumeric selector (e.g., +, -) of 1 to 2 characters in length
      * exactly one argument
    "
    sum := 100 + 50.  "#+ is the selector, 50 is the argument"

    self expect: fillMeIn toEqual: sum.
  ]

  testKeywordMessage [
    "
    A keyword message consists of:
      * one or more alphanumeric selectors, each ending with a colon
      * each selector will have an argument
    "
    self expect: fillMeIn toEqual: (1.02 min: 1.01).
    "#min is the selector, 1.01 is the argument"

    self expect: fillMeIn toEqual: (20 between: 10 and: 15).
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

    self expect: fillMeIn toEqual: value.
  ]

  testArithmeticPrecedence [
    | value anotherValue |

    "
    Arithmetic precedence does not exist in Smalltalk.
    It follows message precedence like everything else.
    "

    value := 1 + 7 * 8.
    anotherValue := 1 + (7 * 8).

    self expect: fillMeIn toEqual: value.
    self expect: fillMeIn toEqual: anotherValue.
  ]

  testControllingPrecedenceWithParentheses [
   | value |

   value := 7 - 1 * 11 - 2 / 3.

   "Hint: use multiple parentheses to control order of precedence."

   self expect: (value) toEqual: 4.
   "You should not be changing the value '4'."
  ]

  testMessageChaining [
    | value |

    "Sending multiple messages to the same receiver."

    value := 1 class name asString.  "message chaining of #class, #name, #asString"

    self expect: fillMeIn toEqual: value.
  ]

  testMessageCascading [
    | value |

    value := 3 + 2; * 100.  "';' separates each message sent to '3'"

    self expect: fillMeIn toEqual: value.

    "Think about it: we are sending multiple messages to '3'."
  ]

  testYourselfIsReferenceToSelf [
    | object anotherObject |

    "yourself is a reference to self."

    object := (Array new: 2)
                at: 1 put: 'a';
                at: 2 put: 'b'.
    anotherObject := (Array new: 2)
                      at: 1 put: 'a';
                      at: 2 put: 'b';
                      yourself.

    self expect: fillMeIn toEqual: object class.
    self expect: fillMeIn toEqual: anotherObject class.

    "yourself often used with message cascading."
  ]

  testRespondsTo [
    self expect: fillMeIn toEqual: (3 respondsTo: #+).
    self expect: fillMeIn toEqual: ('hello' respondsTo: #size).
  ]
]
