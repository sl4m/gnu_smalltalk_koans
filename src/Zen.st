Object subclass: Zen [
  | passed currentTest |

  Zen class >> new [
    ^super new initialize
  ]

  initialize [
    passed := 0.
  ]

  testAssert [
    currentTest := TestAssert new.
    self tally: #testTruth.
    self tally: #testEquality.
    self tally: #testStringEquality.
    self tally: #testInequality.
  ]

  testNil [
    currentTest := TestNil new.
    self tally: #testNilIsAnObject.
    self tally: #testNilInstancesCanBeDifferent.
    self tally: #testNilChecking.
  ]

  runKoans [
    | test |

    "self testAssert."
    "self testNil."

    self displayEndMessage: 0.
  ]

  tally: testName [
    (currentTest perform: testName)
      ifTrue: [ passed:= (passed + 1). ]
      ifFalse: [
        self displayClass: currentTest class test: testName.
        self displayEndMessage: 1.
        self halt.
      ].
  ]

  displayClass: klass test: testName [
    Transcript show: klass name asString, '#', testName asString, ' needs your attention.';
               cr; cr.
  ]

  displayEndMessage: failed [
    Transcript cr;
               show: ('', passed asString, ' passed, ', failed asString, ' failed.');
               cr; cr.
  ]
]
