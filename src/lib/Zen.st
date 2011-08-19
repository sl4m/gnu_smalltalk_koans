Object subclass: Zen [
  | koans passed tracker currentTest ui |

  Zen class >> create: displayAnswer [
    ^super new
           initialize: displayAnswer;
           yourself
  ]

  initialize: displayAnswer [
    koans := #(
      #testAssert
      #testBasic
      #testNil
      #testObject
      #testMessage
      #testNumber
      #testString
      #testCharacter
      #testSymbol
      #testArray
      #testOrderedCollection
      #testSortedCollection
      #testBag
      #testAssociation
      #testDictionary
      #testSet
      #testBlock
      #testCollectionsRevisited
      #testIteration
      #testBoolean
      #testException
      #testRegex
      #testClass
      #testMetaclass
    ).
    passed := 0.
    tracker := Tracker create.
    ui := UI create: Transcript withAnswers: displayAnswer.
  ]

  runKoans [
    koans do: [ :koan |
      tracker status ifFalse: [^nil].
      self perform: koan.
    ].

    tracker status ifTrue: [ui displayEndMessage: passed failed: 0].
  ]

  runTests: tests [
    tests do: [ :test |
      self tally: test.
    ].
  ]

  tally: testName [
    tracker status ifFalse: [^nil].
    currentTest perform: testName.
    tracker status
      ifTrue: [ passed:= (passed + 1). ]
      ifFalse: [
        tracker error add: #class -> currentTest class;
                      add: #test  -> testName;
                      add: #passed -> passed;
                      add: #failed -> 1.
        ui display: tracker error.
      ].
  ]

  testAssert [
    | tests |

    currentTest := TestAssert create: tracker.
    tests := #(
      #testTruth
      #testEquality
      #testStringEquality
      #testNotEqual
    ).
    self runTests: tests.
  ]

  testBasic [
    | tests |

    currentTest := TestBasic create: tracker.
    tests := #(
      #testDeclarationAndAssignment
      #testEqualSignIsNotAnAssignmentOperator
      #testMultipleStatementsInASingleLine
      #testInequality
      #testLogicalOr
      #testLogicalAnd
      #testNot
    ).
    self runTests: tests.
  ]

  testNil [
    | tests |

    currentTest := TestNil create: tracker.
    tests := #(
      #testNilIsAnObject
      #testNilIsTheSameInstance
      #testUndefinedObjectInstancesAreNotTheSame
      #testNilChecking
    ).
    self runTests: tests.
  ]

  testObject [
    | tests |

    currentTest := TestObject create: tracker.
    tests := #(
      #testEverythingIsAnObject
      #testSomeObjectsCanBeConvertedToStrings
      #testNilObjectCannotBeConvertedToString
      #testEveryObjectHasAnId
      #testEveryObjectHasADifferentId
      #testSomeSystemObjectsAlwaysHaveTheSameId
      #testMostIntegersHaveFixedIds
      #testCopyCreatesADifferentObject
    ).
    self runTests: tests.
  ]

  testMessage [
    | tests |

    currentTest := TestMessage create: tracker.
    tests := #(
      #testUnaryMessage
      #testBinaryMessage
      #testKeywordMessage
      #testMessagePrecedence
      #testArithmeticPrecedence
      #testControllingPrecedenceWithParentheses
      #testMessageChaining
      #testMessageCascading
      #testYourselfIsReferenceToSelf
      #testRespondsTo
    ).
    self runTests: tests.
  ]

  testNumber [
    | tests |

    currentTest := TestNumber create: tracker.
    tests := #(
      #testDifferentNumbers
      #testNumberParts
      #testSigns
      #testNegation
      #testRounding
      #testMinMaxOfTwoNumbers
      #testPositiveAndNegative
      #testEvenAndOdd
    ).
    self runTests: tests.
  ]

  testString [
    | tests |

    currentTest := TestString create: tracker.
    tests := #(
      #testStringsCanOnlyBeCreatedUsingSingleQuotes
      #testUseSingleQuotesInStrings
      #testStringConcatenation
      #testStringConcatenationWillLeaveOriginalStringsUnmodified
      #testStringInterpolation
      #testSmalltalkExpressionMayBeInterpolated
      #testSubstring
      #testItWillRaiseExceptionIfIndexIsOutOfBounds
      #testSingleCharacterFromString
      #testUniquenessOfStringObjects
    ).
    self runTests: tests.
  ]

  testCharacter [
    | tests |

    currentTest := TestCharacter create: tracker.
    tests := #(
      #testCharactersCanBeCompared
      #testCharacterAsciiValue
      #testUnprintableCharacters
      #testDigitAndLetter
      #testLetterCase
      #testLetterCaseConversion
      #testWhitespace
      #testPunctuation
      #testRepeatingCharacters
      #testIdenticalCharactersAreASingleInternalObject
    ).
    self runTests: tests.
  ]

  testSymbol [
    | tests |

    currentTest := TestSymbol create: tracker.
    tests := #(
      #testSymbolsStartWithHash
      #testSymbolsInheritFromString
      #testSymbolsCanBeCompared
      #testIdenticalSymbolsAreASingleInternalObject
      #testMethodNamesBecomeSymbols
      #testStringToSymbolConversion
      #testSymbolConversionWhenStringContainsNonAlphaNumerics
      #testSymbolsHaveStringMethodsThroughInheritance
    ).
    self runTests: tests.
  ]

  testArray [
    | tests |

    currentTest := TestArray create: tracker.
    tests := #(
      #testCreatingAnEmptyArray
      #testCreatingAnArrayWithSpecifiedSize
      #testCreatingAnArrayWithUpToFiveInitialValues
      #testConstantArraysAreImmutable
      #testReplaceValueAtElement
      #testCreatingAnArrayThatEvaluatesExpressions
      #testAccessingElements
      #testIncludesElement
      #testOccurrences
    ).
    self runTests: tests.
  ]

  testOrderedCollection [
    | tests |

    currentTest := TestOrderedCollection create: tracker.
    tests := #(
      #testActsLikeAnExpandableArray
      #testCreatingAnOrderedCollectionWithUpToFiveInitialValues
      #testCreatingAnOrderedCollectionFromAConstantArray
      #testAddElements
      #testRemoveElements
      #testAccessingElements
      #testComparingOrderedCollections
    ).
    self runTests: tests.
  ]

  testSortedCollection [
    | tests |

    currentTest := TestSortedCollection create: tracker.
    tests := #(
      #testDefaultSortCriteria
      #testSpecifySortCriteria
      #testComparingSortedCollections
    ).
    self runTests: tests.
  ]

  testBag [
    | tests |

    currentTest := TestBag create: tracker.
    tests := #(
      #testAddingMultiplesCopiesToCollection
      #testCollectionIsNotIndexable
      #testComparingBags
    ).
    self runTests: tests.
  ]

  testAssociation [
    | tests |

    currentTest := TestAssociation create: tracker.
    tests := #(
      #testCreatingAssociationThreeDifferentWays
      #testAssociationKeysCanBeAnyObject
      #testComparingAssociations
      #testAssociationsActLikeSingletons
    ).
    self runTests: tests.
  ]

  testDictionary [
    | tests |

    currentTest := TestDictionary create: tracker.
    tests := #(
      #testCreatingANewDictionary
      #testAddingKeysAndValuesUsingAssociations
      #testAddingAssociationsUsingAtPut
      #testReplaceValueAtKey
      #testRetrievingCollectionOfKeysAndValues
      #testRemoveKey
      #testIncludesKey
      #testIteratingKeys
      #testIteratingAssociations
      #testIteratingKeysAndValues
      #testSmalltalkDictionary
    ).
    self runTests: tests.
  ]

  testSet [
    | tests |

    currentTest := TestSet create: tracker.
    tests := #(
      #testDuplicateObjectsNotAllowed
      #testAddingSets
      #testSubtractingSets
      #testIntersectionOfSets
      #testComparingSets
    ).
    self runTests: tests.
  ]

  testBlock [
    | tests |

    currentTest := TestBlock create: tracker.
    tests := #(
      #testBlockCreation
      #testSendingValueMessageExecutesBlocks
      #testBlocksReturnAnyKindOfValue
      #testPassingArgumentsToBlocks
      #testBlockArgumentLimit
      #testPassingMoreThanThreeArguments
      #testPassingMoreArgumentsThanExpected
      #testIterateUsingInterval
      #testClosure
      #testRealClosure
      #testCull
      #testEachBlockIsAUniqueObject
    ).
    self runTests: tests.
  ]

  testCollectionsRevisited [
    | tests |

    currentTest := TestCollectionsRevisited create: tracker.
    tests := #(
      #testDo
      #testConform
      #testSelect
      #testReject
      #testCollect
      #testDetect
      #testInject
      #testCollectionConversion
      #testFailSafeAccessToElements
      #testFailSafeRemoveElementsFromCollection
    ).
    self runTests: tests.
  ]

  testIteration [
    | tests |

    currentTest := TestIteration create: tracker.
    tests := #(
      #testWhileTrue
      #testWhileFalse
      #testTimesRepeat
    ).
    self runTests: tests.
  ]

  testBoolean [
    | tests |

    currentTest := TestBoolean create: tracker.
    tests := #(
      #testTrueIsTreatedAsTrue
      #testFalseIsTreatedAsFalse
      #testNilIsNotTreatedAsABoolean
      #testIfTrueAndIfFalseOnlyRespondsToBooleans
      #testAndShortCircuit
      #testOrShortCircuit
      #testEqv
      #testXor
    ).
    self runTests: tests.
  ]

  testException [
    | tests |

    currentTest := TestException create: tracker.
    tests := #(
      #testHaltAndError
      #testSignal
      #testCatchingExceptionsWithOnDo
    ).
    self runTests: tests.
  ]

  testRegex [
    | tests |

    currentTest := TestRegex create: tracker.
    tests := #(
      #testSearchRegex
      #testUsingPerlSyntax
      #testUsingTilde
      #testIfMatchedBlock
      #testControlCaseSensitivityWithInlineModifier
      #testQuestionMark
      #testPlus
      #testAsterisk
      #testLeftMostMatchWins
      #testCharacterClasses
      #testDigits
      #testDigitRange
      #testWhitespaces
      #testWords
      #testPeriod
      #testNegation
      #testCharacterClassNegation
      #testStartOfString
      #testEndOfString
      #testStartOfLine
      #testEndOfLine
      #testWordBoundary
      #testGroupingWithParentheses
      #testParenthesesAlsoCaptureMatchedContentByNumber
      #testPipeCharacter
      #testAllOccurrencesOfRegex
      #testReplacingRegex
      #testReplacingAllRegex
      #testMatchingRegexResults
      #testFailedMatchRegexResults
    ).
    self runTests: tests.
  ]

  testClass [
    | tests |

    currentTest := TestClass create: tracker.
    tests := #(
      #testName
      #testPragmas
      #testInstanceVariableCollection
      #testInstSize
      #testClassInstanceVariableCollection
      #testMessageCollection
      #testAllInstances
      #testSuperclass
      #testAllSuperclasses
      #testAllSubclasses
    ).
    self runTests: tests.
  ]

  testMetaclass [
    | tests |

    currentTest := TestMetaclass create: tracker.
    tests := #().
    self runTests: tests.
  ]
]
