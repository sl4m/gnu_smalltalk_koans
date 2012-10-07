Object subclass: Zen [
  | passed tracker ui |

  Koans := {
    TestAssert -> #(
      #testTruth
      #testEquality
      #testStringEquality
      #testNotEqual).
    TestBasic -> #(
      #testDeclarationAndAssignment
      #testEqualSignIsNotAnAssignmentOperator
      #testMultipleStatementsInASingleLine
      #testInequality
      #testLogicalOr
      #testLogicalAnd
      #testNot).
    TestNil -> #(
      #testNilIsAnObject
      #testNilIsTheSameInstance
      #testUndefinedObjectInstancesAreNotTheSame
      #testNilChecking).
    TestObject -> #(
      #testEverythingIsAnObject
      #testSomeObjectsCanBeConvertedToStrings
      #testNilObjectCannotBeConvertedToString
      #testEveryObjectHasAnId
      #testEveryObjectHasADifferentId
      #testSomeSystemObjectsAlwaysHaveTheSameId
      #testMostIntegersHaveFixedIds
      #testCopyCreatesADifferentObject).
    TestMessage -> #(
      #testUnaryMessage
      #testBinaryMessage
      #testKeywordMessage
      #testMessagePrecedence
      #testArithmeticPrecedence
      #testControllingPrecedenceWithParentheses
      #testMessageChaining
      #testMessageCascading
      #testYourselfIsReferenceToSelf
      #testRespondsTo).
    TestNumber -> #(
      #testDifferentNumbers
      #testNumberParts
      #testSigns
      #testNegation
      #testRounding
      #testMinMaxOfTwoNumbers
      #testPositiveAndNegative
      #testEvenAndOdd).
    TestString -> #(
      #testStringsCanOnlyBeCreatedUsingSingleQuotes
      #testUseSingleQuotesInStrings
      #testStringConcatenation
      #testStringConcatenationWillLeaveOriginalStringsUnmodified
      #testStringInterpolation
      #testSmalltalkExpressionMayBeInterpolated
      #testSubstring
      #testItWillRaiseExceptionIfIndexIsOutOfBounds
      #testSingleCharacterFromString
      #testUniquenessOfStringObjects).
    TestCharacter -> #(
      #testCharactersCanBeCompared
      #testCharacterAsciiValue
      #testUnprintableCharacters
      #testDigitAndLetter
      #testLetterCase
      #testLetterCaseConversion
      #testWhitespace
      #testPunctuation
      #testRepeatingCharacters
      #testIdenticalCharactersAreASingleInternalObject).
    TestSymbol -> #(
      #testSymbolsStartWithHash
      #testSymbolsInheritFromString
      #testSymbolsCanBeCompared
      #testIdenticalSymbolsAreASingleInternalObject
      #testMethodNamesBecomeSymbols
      #testStringToSymbolConversion
      #testSymbolConversionWhenStringContainsNonAlphaNumerics
      #testSymbolsHaveStringMethodsThroughInheritance).
    TestArray -> #(
      #testCreatingAnEmptyArray
      #testCreatingAnArrayWithSpecifiedSize
      #testCreatingAnArrayWithUpToFiveInitialValues
      #testConstantArraysAreImmutable
      #testReplaceValueAtElement
      #testCreatingAnArrayThatEvaluatesExpressions
      #testAccessingElements
      #testIncludesElement
      #testOccurrences).
    TestOrderedCollection -> #(
      #testActsLikeAnExpandableArray
      #testCreatingAnOrderedCollectionWithUpToFiveInitialValues
      #testCreatingAnOrderedCollectionFromAnArray
      #testAddElements
      #testRemoveElements
      #testAccessingElements
      #testComparingOrderedCollections).
    TestSortedCollection -> #(
      #testDefaultSortCriteria
      #testSpecifySortCriteria
      #testComparingSortedCollections).
    TestBag -> #(
      #testAddingMultiplesCopiesToCollection
      #testCollectionIsNotIndexable
      #testComparingBags).
    TestSet -> #(
      #testDuplicateObjectsNotAllowed
      #testAddingSets
      #testSubtractingSets
      #testIntersectionOfSets
      #testComparingSets).
    TestAssociation -> #(
      #testCreatingAssociationThreeDifferentWays
      #testAssociationKeysCanBeAnyObject
      #testComparingAssociations
      #testAssociationsActLikeSingletons).
    TestDictionary -> #(
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
      #testSmalltalkDictionary).
    TestBlock -> #(
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
      #testEachBlockIsAUniqueObject).
    TestCollectionsRevisited -> #(
      #testDo
      #testConform
      #testSelect
      #testReject
      #testCollect
      #testDetect
      #testInject
      #testCollectionConversion
      #testFailSafeAccessToElements
      #testFailSafeRemoveElementsFromCollection).
    TestIteration -> #(
      #testWhileTrue
      #testWhileFalse
      #testTimesRepeat).
    TestBoolean -> #(
      #testTrueIsTreatedAsTrue
      #testFalseIsTreatedAsFalse
      #testNilIsNotTreatedAsABoolean
      #testIfTrueAndIfFalseOnlyRespondsToBooleans
      #testAndShortCircuit
      #testOrShortCircuit
      #testEqv
      #testXor).
    TestException -> #(
      #testHaltAndError
      #testSignal
      #testCatchingExceptionsWithOnDo).
    TestRegex -> #(
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
      #testFailedMatchRegexResults).
    TestClass -> #(
      #testName
      #testPragmas
      #testInstanceVariableCollection
      #testInstSize
      #testClassInstanceVariableCollection
      #testMessageCollection
      #testAllInstances
      #testSuperclass
      #testAllSuperclasses
      #testAllSubclasses).
    TestMetaclass -> #().
  }.

  Zen class >> create: displayAnswer [
    ^super new
           initialize: displayAnswer;
           yourself
  ]

  initialize: displayAnswer [
    passed := 0.
    tracker := Tracker create.
    ui := UI create: Transcript withAnswers: displayAnswer.
  ]

  runKoans [
    | currentTest |

    Zen.Koans do: [ :koan |
      tracker status ifFalse: [^nil].
      currentTest := koan key create: tracker.
      koan value do: [ :testMethod |
        tracker status ifFalse: [^nil].
        self runKoan: currentTest method: testMethod.
      ].
    ].

    tracker status ifTrue: [ui displayEndMessage: passed failed: 0].
  ]

  runKoan: test method: testMethod [
    test perform: testMethod.
    tracker status
      ifTrue: [ passed:= (passed + 1). ]
      ifFalse: [
        tracker error add: #class -> test class;
                      add: #test  -> testMethod;
                      add: #passed -> passed;
                      add: #failed -> 1.
        ui display: tracker error.
      ].
  ]
]
