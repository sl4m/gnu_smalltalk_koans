Koan subclass: TestException [
  <comment: 'A collection of exception tests.'>

  testHaltAndError [
    self expect: [ self halt ] toRaise: fillMeIn.
    self expect: [ self error: 'Error' ] toRaise: fillMeIn.

    "All classes have halt and error messages."
  ]

  testSignal [
    self expect: [ Exception signal ] toRaise: fillMeIn.
    self expect: [ Exception signal: 'Hello World' ] toRaise: fillMeIn.
  ]

  testCatchingExceptionsWithOnDo [
    | result |

    result := [ nil ifTrue: [] ]
                on: SystemExceptions.MustBeBoolean
                do: [ :e | e return: true ].

    self expect: fillMeIn toEqual: result.

    result := [ 'Hello' + ' World!' ]
                on: MessageNotUnderstood
                do: [ :e | e return: true ].

    self expect: fillMeIn toEqual: result.
  ]
]
