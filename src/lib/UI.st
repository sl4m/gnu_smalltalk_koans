Object subclass: UI [
  | zenMessageCollection output |

  UI class >> create: stdOut [
    ^self new initialize: stdOut;
          yourself
  ]

  initialize: stdOut [
    output := stdOut.
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

  displayClass: klass test: testName [
    | klassName |

    klassName := klass name asString.
    output cr;
           show: klassName, '#', testName asString, ' has damaged your karma.';
           cr;
           show: '(in src/koans/', klassName, '.st)';
           cr; cr.
  ]

  displayEndMessage: passed failed: failed [
    output cr;
           show: '', passed asString, ' passed, ', failed asString, ' failed.';
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
           cr;
           show: 'Actual   : ', (self prettify: actual);
           cr; cr.
  ]

  display: dictionary [
    self displayClass: (dictionary at: #class) test: (dictionary at: #test).
    output show: self randomZenMessage, '  ', (dictionary at: #message);
           cr; cr.
    (dictionary includesKey: #expected) & (dictionary includesKey: #actual)
      ifTrue: [
        self displayExpected: (dictionary at: #expected)
             actual: (dictionary at: #actual)
      ].
    self displayEndMessage: (dictionary at: #passed) failed: (dictionary at: #failed).
  ]
]
