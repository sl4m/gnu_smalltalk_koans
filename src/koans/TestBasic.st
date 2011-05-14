Koan subclass: TestBasic [
  <comment: 'A collection of introductory tests.'>

  testComment [
    "Look at me, I'm a comment!  All comments are wrapped in double quotes."
  ]

  testDeclarationAndAssignment [
    | declaration anotherDeclaration |

    "You must declare variables before using them"
    "Variables are separated by a single space"

    declaration _ 1.  "old way to assign value"
    anotherDeclaration := 'string'.  "common way"

    self expect: (self fillMeIn) toEqual: declaration.
    self expect: (self fillMeIn) toEqual: anotherDeclaration.
  ]

  testEquals [
    | variableA variableB value |

    variableA := variableB := 1234.
    value := variableA = variableB.  "equal is not assignment"

    self expect: (self fillMeIn) toEqual: (variableA = variableB).
    "#== checks identity"
  ]

  testNotEquals [
    self expect: (self fillMeIn) toEqual: ('hello' ~= 'world').
    "#~~ checks if identity is not equal"
  ]
]
