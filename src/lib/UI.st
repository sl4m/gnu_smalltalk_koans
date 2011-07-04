Object subclass: UI [
  | zenMessageCollection output displayAnswer |

  UI class >> create: stdOut withAnswers: displayAnswer [
    ^self new initialize: stdOut withAnswers: displayAnswer;
          yourself
  ]

  initialize: stdOut withAnswers: display [
    output := stdOut.
    displayAnswer := display.
    zenMessageCollection := #(
      'Do not lose hope.'
      'Believe in yourself.'
      'Heroes have no fears.'
    ).
  ]

  randomZenMessage [
    ^zenMessageCollection at: (Random between: 1 and: zenMessageCollection size)
  ]

  className: value [
    ^value class name asString
  ]

  anInstanceOf: value [
    ^' (an instance of ', (self className: value), ')'
  ]

  displayClass: klass test: testName line: line [
    | klassName lineApprox |

    klassName := klass name asString.
    lineApprox := (line asNumber - 1) asString, '-', line.
    output cr;
           show: klassName, '#', testName asString, ' has damaged your karma.';
           cr;
           show: '(in src/koans/', klassName, '.st:', lineApprox, ')';
           cr; cr.
  ]

  displayEndMessage: passed failed: failed [
    output cr;
           show: passed asString, ' passed, ', failed asString, ' failed.';
           cr; cr.
  ]

  prettify: value [
    (value = 'FILL ME IN')
      ifTrue: [ ^value ].
    ((value isKindOf: Collection) & (value class ~~ String) & (value class ~~ Symbol))
      ifTrue: [
        ^(value displayString replacingRegex: (self className: value) with: '') trimSeparators, (self anInstanceOf: value)
      ].
    (value respondsTo: #printString)
      ifTrue: [ ^value printString ].
  ]

  displayExpected: expected actual: actual [
    output show: 'Expected : ', (self prettify: expected);
           cr.
    displayAnswer
      ifTrue: [
        output show: 'Actual   : ', (self prettify: actual).
      ] ifFalse: [
        output show: 'Actual   : (not revealed)'.
      ].
    output cr; cr.
  ]

  display: dictionary [
    | klass test line message passed failed |

    klass    := dictionary at: #class.
    test     := dictionary at: #test.
    line     := dictionary at: #line.
    message  := dictionary at: #message.
    passed   := dictionary at: #passed.
    failed   := dictionary at: #failed.

    self displayClass: klass test: test line: line.
    output show: self randomZenMessage, '  ', message;
           cr; cr.
    (dictionary includesKey: #expected) & (dictionary includesKey: #actual)
      ifTrue: [
        self displayExpected: (dictionary at: #expected) actual: (dictionary at: #actual)
      ].
    self displayEndMessage: passed failed: failed.
  ]
]
