Object subclass: HelloWorld [
  <comment: 'This is a HelloWorld comment'>
  <category: 'This is a HelloWorld category'>

  Statement := $S.

  | instanceVariable |

  "Unlike other Smalltalks, method statements are inside brackets."

  awesome [
    ^true
  ]

  + string [
    ^'Hello ', string
  ]

  say: something [
    ^self class name asString, ' says ', something
  ]
]

HelloWorld subclass: SubHelloWorld [
  | instanceVariable2 instanceVariable3 |
]

SubHelloWorld subclass: SubSubHelloWorld []

Koan subclass: TestClass [
  <comment: 'A collection of class tests.'>

  "Class variables are defined the same as variable assignments."

  "superclass"
  "allInstances"
  "allSuperclasses"

  testName [
    self expect: fillMeIn toEqual: HelloWorld name.
  ]

  testPragmas [
    "
    Pragmas define:
      class comment
      class category
      imported namespaces
      shape of indexed instance variables.
    "

    self expect: fillMeIn toEqual: HelloWorld comment.
    self expect: fillMeIn toEqual: HelloWorld category.
  ]

  testInstanceVariableCollection [
    self expect: fillMeIn toEqual: HelloWorld instVarNames.
  ]

  testInstSize [
    self expect: fillMeIn toEqual: HelloWorld instSize.
    self expect: fillMeIn toEqual: SubHelloWorld instSize.
  ]

  testClassInstanceVariableCollection [
    self expect: fillMeIn toEqual: HelloWorld classVarNames asArray.
  ]

  testMessageCollection [
    self expect: fillMeIn toEqual: HelloWorld selectors asArray.
  ]

  testSourceCodeAt [
    "
    #sourceCodeAt: returns the source code of the specified message.
    For example: HelloWorld sourceCodeAt: #+ would return:

    '+ string [
      ^''Hello '', string
    ]'
    "
  ]

  testAllInstances [
    | helloWorld |

    helloWorld := HelloWorld new.

    self expect: fillMeIn toEqual: HelloWorld allInstances asArray.
  ]

  testSuperclass [
    self expect: fillMeIn toEqual: HelloWorld superclass.
  ]

  testAllSuperclasses [
    self expect: fillMeIn toEqual: SubHelloWorld allSuperclasses asArray.

    "Note: GNUSmalltalk is the namespace."
  ]

  testAllSubclasses [
    self expect: fillMeIn toEqual: HelloWorld allSubclasses asArray.
  ]
]
