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

  runKoans [
    self testAssert.
    self testBasic.
    self testNil.
    self testObject.
    self testMessage.
    self testNumber.
    self testString.
    self testCharacter.
    self testSymbol.
    self testArray.
    self testOrderedCollection.
    self testSortedCollection.
    self testBag.
    self testSet.
    self testBlock.
    self testCollectionsRevisited.
    self testBoolean.
    self testRegex.
    self testClass.          "inheritance, cool methods"
    self testClassHierarchy.
    self testMetaclass.      "metaprogramming"

    self displayEndMessage: 0.
  ]

  testAssert [
    currentTest := TestAssert create: (self tracker).
    self tally: #testTruth.
    self tally: #testEquality.
    self tally: #testStringEquality.
    self tally: #testNotEqual.
  ]

  testBasic [
    currentTest := TestBasic create: (self tracker).
    self tally: #testDeclarationAndAssignment.
    self tally: #testEqualSignIsNotAnAssignmentOperator.
    self tally: #testMultipleStatementsInASingleLine.
    self tally: #testInequality.
    self tally: #testLogicalOr.
    self tally: #testLogicalAnd.
    self tally: #testNot.
  ]

  testNil [
    currentTest := TestNil create: (self tracker).
    self tally: #testNilIsAnObject.
    self tally: #testNilIsTheSameInstance.
    self tally: #testUndefinedObjectInstancesAreNotTheSame.
    self tally: #testNilChecking.
  ]

  testObject [
    currentTest := TestObject create: (self tracker).
    self tally: #testEverythingIsAnObject.
    self tally: #testSomeObjectsCanBeConvertedToStrings.
    self tally: #testNilObjectCannotBeConvertedToString.
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
    self tally: #testControllingPrecedenceWithParentheses.
    self tally: #testMessageChaining.
    self tally: #testMessageCascading.
  ]

  testNumber [
    currentTest := TestNumber create: (self tracker).
    self tally: #testDifferentNumbers.
    self tally: #testNumberParts.
    self tally: #testSigns.
    self tally: #testNegation.
    self tally: #testRounding.
    self tally: #testMinMaxOfTwoNumbers.
  ]

  testString [
    currentTest := TestString create: (self tracker).
    self tally: #testStringsCanOnlyBeCreatedUsingSingleQuotes.
    self tally: #testUseSingleQuotesInStrings.
    self tally: #testStringConcatenation.
    self tally: #testStringConcatenationWillLeaveOriginalStringsUnmodified.
    self tally: #testStringInterpolation.
    self tally: #testSmalltalkExpressionMayBeInterpolated.
    self tally: #testSubstring.
    self tally: #testItWillRaiseExceptionIfIndexIsOutOfBounds.
    self tally: #testSingleCharacterFromString.
    self tally: #testUniquenessOfStringObjects.
  ]

  testCharacter [
    currentTest := TestCharacter create: (self tracker).
    self tally: #testCharactersCanBeCompared.
    self tally: #testCharacterAsciiValue.
    self tally: #testUnprintableCharacters.
    self tally: #testDigitAndLetter.
    self tally: #testLetterCase.
    self tally: #testLetterCaseConversion.
    self tally: #testWhitespace.
    self tally: #testPunctuation.
    self tally: #testRepeatingCharacters.
    self tally: #testIdenticalCharactersAreASingleInternalObject.
  ]

  testSymbol [
    currentTest := TestSymbol create: (self tracker).
    self tally: #testSymbolsStartWithHash.
    self tally: #testSymbolsInheritFromString.
    self tally: #testSymbolsCanBeCompared.
    self tally: #testIdenticalSymbolsAreASingleInternalObject.
    self tally: #testMethodNamesBecomeSymbols.
    self tally: #testStringToSymbolConversion.
    self tally: #testSymbolConversionWhenStringContainsNonAlphaNumerics.
    self tally: #testSymbolsHaveStringMethodsThroughInheritance.
  ]

  testArray [
    currentTest := TestArray create: (self tracker).
    self tally: #testCreatingAnEmptyArray.
    self tally: #testCreatingAnArrayWithSpecifiedSize.
    self tally: #testCreatingAnArrayWithUpToFiveInitialValues.
    self tally: #testConstantArraysAreImmutable.
    self tally: #testCreatingAnArrayThatEvaluatesExpressions.
    self tally: #testAccessingElements.
    self tally: #testIncludesElement.
    self tally: #testOccurrences.
  ]

  testOrderedCollection [
    currentTest := TestOrderedCollection create: (self tracker).
    self tally: #testActsLikeAnExpandableArray.
    self tally: #testCreatingAnOrderedCollectionWithUpToFiveInitialValues.
    self tally: #testCreatingAnOrderedCollectionFromAConstantArray.
    self tally: #testAddElements.
    self tally: #testRemoveElements.
    self tally: #testAccessingElements.
    self tally: #testComparingOrderedCollections.
  ]

  testSortedCollection [
    currentTest := TestSortedCollection create: (self tracker).
    self tally: #testDefaultSortCriteria.
    self tally: #testSpecifySortCriteria.
    self tally: #testComparingSortedCollections.
  ]

  testBag [
    currentTest := TestBag create: (self tracker).
    self tally: #testAddingMultiplesCopiesToCollection.
    self tally: #testCollectionIsNotIndexable.
    self tally: #testComparingBags.
  ]

  testSet [
    currentTest := TestSet create: (self tracker).
    self tally: #testDuplicateObjectsNotAllowed.
    self tally: #testAddingSets.
    self tally: #testSubtractingSets.
    self tally: #testIntersectionOfSets.
    self tally: #testComparingSets.
  ]

  testBlock [
    currentTest := TestBlock create: (self tracker).
    self tally: #testBlockCreation.
    self tally: #testSendingValueMessageExecutesBlocks.
    self tally: #testBlocksReturnAnyKindOfValue.
    self tally: #testPassingArgumentsToBlocks.
    self tally: #testBlockArgumentLimit.
    self tally: #testPassingMoreThanThreeArguments.
    self tally: #testPassingMoreArgumentsThanExpected.
    self tally: #testIterateUsingInterval.
    self tally: #testClosure.
    self tally: #testRealClosure.
    self tally: #testCull.
    self tally: #testEachBlockIsAUniqueObject.
  ]

  testCollectionsRevisited [
    currentTest := TestCollectionsRevisited create: (self tracker).
    self tally: #testDo.
    self tally: #testConform.
    self tally: #testSelect.
    self tally: #testReject.
    self tally: #testCollect.
    self tally: #testDetect.
    self tally: #testInject.
  ]

  testBoolean [
    currentTest := TestBoolean create: (self tracker).
    self tally: #testIfTrueAndIfFalse.
  ]

  testRegex [
    currentTest := TestRegex create: (self tracker).
    self tally: #testSearchRegex.
    self tally: #testUsingPerlSyntax.
    self tally: #testUsingTilde.
    self tally: #testIfMatchedBlock.
    self tally: #testControlCaseSensitivityWithInlineModifier.
    self tally: #testQuestionMark.
    self tally: #testPlus.
    self tally: #testAsterisk.
    self tally: #testLeftMostMatchWins.
    self tally: #testCharacterClasses.
    self tally: #testDigits.
    self tally: #testDigitRange.
    self tally: #testWhitespaces.
    self tally: #testWords.
    self tally: #testPeriod.
    self tally: #testNegation.
    self tally: #testCharacterClassNegation.
    self tally: #testStartOfString.
    self tally: #testEndOfString.
    self tally: #testStartOfLine.
    self tally: #testEndOfLine.
    self tally: #testWordBoundary.
    self tally: #testGroupingWithParentheses.
    self tally: #testParenthesesAlsoCaptureMatchedContentByNumber.
    self tally: #testPipeCharacter.
    self tally: #testAllOccurrencesOfRegex.
    self tally: #testReplacingRegex.
    self tally: #testReplacingAllRegex.
    self tally: #testMatchingRegexResults.
    self tally: #testFailedMatchRegexResults.
  ]

  testClass [
    currentTest := TestClass create: (self tracker).
  ]

  testClassHierarchy [
    currentTest := TestClassHierarchy create: (self tracker).
  ]

  testMetaclass [
    currentTest := TestMetaclass create: (self tracker).
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
