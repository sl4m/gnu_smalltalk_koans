Object subclass: FakeOutput [
  | message |

  FakeOutput class >> create [
    ^self new initialize;
          yourself
  ]

  initialize [
    message := ''.
  ]

  message [
    ^message
  ]

  show: newMessage [
    message := message, ' ', newMessage.
  ]

  cr []
]

Test subclass: UITestCase [
  | ui output |

  setUp [
    output := FakeOutput create.
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

    self assert: (ui prettify: collection) = ('(1:1 true:1 $a:1 ''s'':1 #b:1 ) (an instance of Bag)').
  ]

  testPrettifyDictionary [
    | collection |

    collection := Dictionary new
                             add: #a   -> 1;
                             add: 2    -> 'b';
                             add: nil  -> #c;
                             add: $d   -> 3;
                             add: true -> $e;
                             yourself.

    self assert: (ui prettify: collection) = ('(
	#a->1
	2->''b''
	nil->#c
	$d->3
	true->$e
) (an instance of Dictionary)').
  ]

  testPrettifySet [
    | array collection |

    array := #(1 's' $a #b true).
    collection := Set new
                      addAll: array;
                      yourself.

    self assert: (ui prettify: collection) = ('(1 #b $a true ''s'' ) (an instance of Set)').
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
