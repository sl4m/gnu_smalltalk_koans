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

  testObject [

  ]

  testMessage [

  ]

  testNumber [

  ]

  testArray [

  ]

  testString [

  ]

  testCharacter [

  ]

  testSymbol [

  ]

  testBoolean [

  ]

  testSet [

  ]

  testBlock [

  ]

  testClass [

  ]

  testMetaclass [

  ]

  runKoans [

    "self testAssert."
    "self testNil."
    self testObject.
    self testMessage.    "three types of messages, order of precedence, sending, chaining, cascading"
    self testNumber.     "arithmetic precedence"
    self testArray.
    self testString.     "concatenation"
    self testCharacter.
    self testSymbol.
    self testBoolean.
    self testSet.
    self testBlock.      "array each, select, inject, ifTrue/ifFalse, loops"
    self testClass.      "inheritance, cool methods"
    self testMetaclass.  "metaprogramming"

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
