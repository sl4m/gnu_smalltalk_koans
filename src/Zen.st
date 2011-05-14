Object subclass: Tracker [
  |status|

  status [
    ^status
  ]

  status: newStatus [
    status := newStatus
  ]
]

Object subclass: Zen [
  | passed tracker currentTest |

  Zen class >> new [
    ^super new initialize
  ]

  initialize [
    passed := 0.
    tracker := Tracker new.
    tracker status: true.
  ]

  tracker [
    ^tracker
  ]

  testAssert [
    currentTest := TestAssert create: (self tracker).
    self tally: #testTruth.
    self tally: #testEquality.
    self tally: #testStringEquality.
    self tally: #testInequality.
  ]

  testBasic [
    currentTest := TestBasic create: (self tracker).
    self tally: #testDeclarationAndAssignment.
    self tally: #testEquals.
    self tally: #testNotEquals.
  ]

  testNil [
    currentTest := TestNil create: (self tracker).
    self tally: #testNilIsAnObject.
    self tally: #testNilIsTheSameInstance.
    self tally: #testNilInstancesAreNotTheSame.
    self tally: #testNilChecking.
  ]

  testObject [
    currentTest := TestObject create: (self tracker).
    self tally: #testEverythingIsAnObject.
    self tally: #testSomeObjectsCanBeConvertedToStrings.
    self tally: #testEveryObjectHasAnId.
    self tally: #testEveryObjectHasADifferentId.
    self tally: #testSomeSystemObjectsAlwaysHaveTheSameId.
    self tally: #testMostIntegersHaveFixedIds.
    self tally: #testCopyCreatesADifferentObject.
  ]

  testMessage [
    currentTest := TestMessage create: (self tracker).
    self tally: #testUnaryMessage.
    self tally: #testBinaryMessage.
    self tally: #testKeywordMessage.
    self tally: #testMessagePrecedence.
    self tally: #testArithmeticPrecedence.
    self tally: #testMessageChaining.
  ]

  testNumber [
    currentTest := TestNumber create: (self tracker).
    self tally: #testDifferentNumbers.
    self tally: #testSomeInterestingMessages.
    self tally: #testNumberIsAnAbstractClass.
  ]

  testArray [
    currentTest := TestArray create: (self tracker).
    self tally: #testCreatingArray.
    self tally: #testCreatingArrayWithSpecifiedSize.
    self tally: #testCreatingConstantArray.
    self tally: #testIncludesElement.
    self tally: #testOccurrences.
  ]

  testString [
    currentTest := TestString create: (self tracker).
  ]

  testCharacter [
    currentTest := TestCharacter create: (self tracker).
  ]

  testSymbol [
    currentTest := TestSymbol create: (self tracker).
  ]

  testRegex [
    currentTest := TestRegex create: (self tracker).
  ]

  testBoolean [
    currentTest := TestBoolean create: (self tracker).
  ]

  testSet [
    currentTest := TestSet create: (self tracker).
  ]

  testBlock [
    currentTest := TestBlock create: (self tracker).
  ]

  testClass [
    currentTest := TestClass create: (self tracker).
  ]

  testMetaclass [
    currentTest := TestMetaclass create: (self tracker).
  ]

  runKoans [
    self testAssert
    self testBasic.
    self testNil.
    self testObject.
    self testMessage.    "three types of messages, order of precedence, sending, chaining, cascading, parentheses"
    self testNumber.     "arithmetic precedence, fractions"
    self testArray.
    self testString.     "concatenation"
    self testCharacter.
    self testSymbol.
    self testRegex.
    self testBoolean.
    self testSet.
    self testBlock.      "array each, select, inject, ifTrue/ifFalse, loops"
    self testClass.      "inheritance, cool methods"
    self testMetaclass.  "metaprogramming"

    self displayEndMessage: 0.
  ]

  tally: testName [
    currentTest perform: testName.
    (self tracker status)
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
