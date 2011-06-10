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
  "
    self testAssert.
    self testBasic.
    self testNil.
    self testObject.
    self testMessage.
    self testNumber.
    self testArray.
    self testString.
    self testCharacter.
    self testSymbol.
  "
    self testBlock.          "ifTrue/ifFalse, loops"
    self testArrayRevisited. "array each, select, inject"
    self testBoolean.
    self testRegex.
    self testSet.
    self testClass.          "inheritance, cool methods"
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
    self tally: #testNumberAndMagnitudeAreAbstractClasses.
  ]

  testArray [
    currentTest := TestArray create: (self tracker).
    self tally: #testCreatingArrays.
    self tally: #testCreatingArrayWithSpecifiedSize.
    self tally: #testCreatingConstantArray.
    self tally: #testCreatingAnArrayThatEvaluatesExpressions.
    self tally: #testAccessingElements.
    self tally: #testIncludesElement.
    self tally: #testOccurrences.
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
    self tally: #testStringClass.
    self tally: #testSingleCharacterFromString.
    self tally: #testUniquenessOfStringObjects.
  ]

  testCharacter [
    currentTest := TestCharacter create: (self tracker).
    self tally: #testCharactersBeCompared.
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

  testBlock [
    currentTest := TestBlock create: (self tracker).
    "
    self tally: #testBlockCreation.
    self tally: #testSendingValueMessageExecutesBlocks.
    self tally: #testBlocksReturnAnyKindOfValue.
    self tally: #testPassingArgumentsToBlocks.
    self tally: #testBlockArgumentLimit.
    self tally: #testPassingMoreThanThreeArguments.
    self tally: #testPassingMoreArgumentsThanExpected.
    self tally: #testIntegerLoop.
    self tally: #testClosure.
    self tally: #testRealClosure.
    "
    self tally: #testCull.
    self tally: #testEachBlockIsAUniqueObject.
  ]

  testArrayRevisited [
    currentTest := TestBlock create: (self tracker).
  ]

  testBoolean [
    currentTest := TestBoolean create: (self tracker).
  ]

  testRegex [
    currentTest := TestRegex create: (self tracker).
    self tally: #testSearchRegex.
    self tally: #testUsingPerlSyntax.
    self tally: #testUsingTilde.
    self tally: #testIfMatchedBlock.
    self tally: #testControlCaseSensitivityWithInlineModifier.
    self tally: #testQuestionMark.
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

  testSet [
    currentTest := TestSet create: (self tracker).
  ]

  testClass [
    currentTest := TestClass create: (self tracker).
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
