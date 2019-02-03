Test subclass: UITestCase [
  | ui output |

  setUp [
    output := FakeOut create.
    ui     := UI create: output withAnswers: true.
  ]

  testRandomZenMessage [
    self assert: ui randomZenMessage ~= ''.
  ]

  testClassName [
    self assert: (ui className: $a) = 'Character'.
    self assert: (ui className: 'abc') = 'String'.
    self assert: (ui className: #()) = 'Array'.
  ]

  testAnInstanceOf [
    self assert: (ui anInstanceOf: 0) = ' (an instance of SmallInteger)'.
  ]

  testDisplayClassTest [
    ui displayClass: Object test: 'someTest' line: '123'.

    self assert: (output message =~ 'Object#someTest has damaged your karma.') matched.
    self assert: (output message =~ 'in src/koans/Object\.st:122-123') matched.
  ]

  testDisplayEndMessageFailed [
    ui displayEndMessage: 100 failed: 20.

    self assert: (output message =~ '100 passed, 20 failed.') matched.
  ]

  testDisplayExpectedActual [
    ui displayExpected: $a actual: $b.

    self assert: (output message =~ 'Expected : \$a') matched.
    self assert: (output message =~ 'Actual   : \$b') matched.
  ]

  testDisplayExpectedWithoutActual [
    | uiWithoutDisplayingAnswer |

    uiWithoutDisplayingAnswer := UI create: output withAnswers: false.
    uiWithoutDisplayingAnswer displayExpected: $a actual: $b.

    self assert: (output message =~ 'Expected : \$a') matched.
    self assert: (output message =~ 'Actual   : \$b') matched not.
    self assert: (output message =~ 'Actual   : \(not revealed\)') matched.
  ]

  testDisplay [
    | dictionary |

    dictionary := Dictionary new
                             add: #message  -> 'Hello World!';
                             add: #line     -> '123';
                             add: #expected -> 15;
                             add: #actual   -> nil;
                             add: #class    -> Object;
                             add: #test     -> 'someTest';
                             add: #passed   -> 1000;
                             add: #failed   -> 1;
                             yourself.
    ui display: dictionary.

    self assert: (output message =~ 'Hello World!') matched.
    self assert: (output message =~ 'Expected : 15') matched.
    self assert: (output message =~ 'Actual   : nil') matched.
  ]

  testPrettifyFillMeIn [
    self assert: (ui prettify: 'FILL ME IN') = 'FILL ME IN'.
  ]

  testPrettifyBooleans [
    self assert: (ui prettify: true) = 'true'.
    self assert: (ui prettify: false) = 'false'.
  ]

  testPrettifyNil [
    self assert: (ui prettify: nil) = 'nil'.
  ]

  testPrettifyCharacter [
    self assert: (ui prettify: $a) = '$a'.
  ]

  testPrettifySymbol [
    self assert: (ui prettify: #b) = '#b'.
  ]

  testPrettifyAssociation [
    self assert: (ui prettify: (1 -> 2)) = '1->2'.
  ]

  testPrettifyArray [
    | array prettifiedValue |

    array := #(1 's' $a #b true nil).
    prettifiedValue := '%1 (an instance of %2)'.

    self assert: (ui prettify: array) = (prettifiedValue % { array printString . 'Array' }).
  ]

  testPrettifyOrderedCollection [
    | array prettifiedValue collection |

    array := #(1 's' $a #b true nil).
    prettifiedValue := '%1 (an instance of %2)'.
    collection := OrderedCollection new
                                    addAll: array;
                                    yourself.

    self assert: (ui prettify: collection) = (prettifiedValue % { array printString . 'OrderedCollection' }).
  ]

  testPrettifySortedCollection [
    | array prettifiedValue collection |

    array := #(1 2 3).
    prettifiedValue := '%1 (an instance of %2)'.
    collection := SortedCollection new
                                   addAll: array;
                                   yourself.

    self assert: (ui prettify: collection) = (prettifiedValue % { array printString . 'SortedCollection' }).
  ]

  testPrettifyBag [
    | array collection |

    array := #(1 's' $a #b true).
    collection := Bag new
                      addAll: array;
                      yourself.

    output := ui prettify: collection.
    self assert: (output =~ '1:1') matched.
    self assert: (output =~ 'true:1') matched.
    self assert: (output =~ '\$a:1') matched.
    self assert: (output =~ '#b:1') matched.
    self assert: (output =~ '''s'':1') matched.
    self assert: (output =~ 'an instance of Bag') matched.
  ]

  testPrettifyDictionary [
    | collection |

    collection := Dictionary new
                             add: 2    -> 'b';
                             add: nil  -> #c;
                             add: $d   -> 3;
                             add: true -> $e;
                             yourself.

    output := ui prettify: collection.
    self assert: (output =~ 'true->\$e') matched.
    self assert: (output =~ '2->''b''') matched.
    self assert: (output =~ 'nil->#c') matched.
    self assert: (output =~ '\$d->3') matched.
    self assert: (output =~ 'an instance of Dictionary') matched.
  ]

  testPrettifySet [
    | array collection |

    array := #(1 #b).
    collection := Set new
                      addAll: array;
                      yourself.

    output := ui prettify: collection.
    self assert: (output =~ '1') matched.
    self assert: (output =~ '#b') matched.
    self assert: (output =~ 'an instance of Set') matched.
    "self assert: (ui prettify: collection) = ('(1 #b ) (an instance of Set)')."
  ]

  testPrettifyException [
    self assert: (ui prettify: Exception) = 'Exception'.
  ]

  testPrettifyClass [
    self assert: (ui prettify: Object) = 'Object'.
  ]

  testPrettifyMetaclass [
    self assert: (ui prettify: Object class) = 'Object class'.
  ]
]
