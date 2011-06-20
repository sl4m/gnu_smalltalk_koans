Koan subclass: TestException [
  <comment: 'A collection of exception tests.'>

  testHaltAndError [
    self expect: [ self halt ] toRaise: (self fillMeIn).
    self expect: [ self error: 'Error' ] toRaise: (self fillMeIn).

    "All classes have halt and error messages."
  ]

  testSignal [
    self expect: [ Exception signal ] toRaise: (self fillMeIn).
    self expect: [ Exception signal: 'Hello World' ] toRaise: (self fillMeIn).
  ]

  testCatchingExceptionsWithOnDo [
    | result |

    result := [ nil ifTrue: [] ]
                on: SystemExceptions.MustBeBoolean
                do: [ :e | e return: true ].

    self expect: (self fillMeIn) toEqual: result.

    result := [ 'Hello' + ' World!' ]
                on: MessageNotUnderstood
                do: [ :e | e return: true ].

    self expect: (self fillMeIn) toEqual: result.
  ]
]
