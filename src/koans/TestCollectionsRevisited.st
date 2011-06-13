Koan subclass: TestCollectionsRevisited [
  <comment: 'A collection of advanced collection tests.'>

  testDo [
    | array sum orderedCollection |

    "Iterate over collection."

    array := #(1 2 3 4).
    sum := 0.
    array do: [ :number | sum := sum + number ].

    self expect: (10) toEqual: (sum).

    orderedCollection := OrderedCollection new addAll: array; yourself.
    sum := 0.
    orderedCollection do: [ :number | sum := sum + number ].

    self expect: (self fillMeIn) toEqual: (sum).

    "#do: also works on SortedCollection, Bag, and Set."
  ]

  testConform [
    | array result sortedCollection |

    "Meets condition(s)."

    array := #($m $n $o $p).
    result := array conform: [ :character | character > $l & character < $q ].

    self expect: (self fillMeIn) toEqual: (result).

    sortedCollection := SortedCollection new addAll: array; yourself.
    result := sortedCollection conform: [ :character | character > $l & character < $q ].

    self expect: (self fillMeIn) toEqual: (result).

    "#conform: also works on OrderedCollection, Bag, and Set."
  ]

  testSelect [
    | array result bag |

    "Return collection of elements that meets condition(s)."

    array := #(1 2 3 4 5).
    result := array select: [ :number | number even ].

    self expect: (self fillMeIn) toEqual: (result).

    bag := Bag new addAll: array; yourself.
    result := bag select: [ :number | number even ].

    self expect: (self fillMeIn) toEqual: (result).

    "#select: also works on OrderedCollection, SortedCollection, and Set."
  ]

  testReject [
    | array result set |

    "Return collection of elements that do not meet condition(s)."

    array := #(1 2 3 4 5).
    result := array reject: [ :number | number even ].

    self expect: (self fillMeIn) toEqual: (result).

    set := Set new addAll: array; yourself.
    result := set reject: [ :number | number even ].

    self expect: (self fillMeIn) toEqual: (result).

    "#reject: also works on OrderedCollection, SortedCollection, and Bag."
  ]

  testCollect [
    | array result |

    "Transform each element and return in a new collection."

    array := #($a $b $c $d $e).
    result := array collect: [ :character | character asUppercase ].

    self expect: (self fillMeIn) toEqual: (result).

    "#collect: also works on OrderedCollection, SortedCollection, Bag, and Set"
  ]

  testDetect [
    | array result |

    array := #(56 81 16 77).
    result := array detect: [ :number | number sqrt = 4 ].

    self expect: (self fillMeIn) toEqual: (result).

    "#detect: also works on OrderedCollection, SortedCollection, Bag, and Set"
  ]

  testInject [
    | array result |

    array := #(4 8 12 16).
    result := array inject: 0 into: [ :numOne :numTwo | numOne + numTwo ].

    self expect: (self fillMeIn) toEqual: (result).

    "#inject: also works on OrderedCollection, SortedCollection, Bag, and Set"
  ]

  testCollectionConversion [
    | array orderedCollection sortedCollection bag set |

    array := Array with: 1 with: 2 with: 3.
    orderedCollection := OrderedCollection with: 1 with: 2 with: 3.
    sortedCollection := SortedCollection with: 1 with: 2 with: 3.
    bag := Bag with: 1 with: 2 with: 3.
    set := Set with: 1 with: 2 with: 3.

    self expect: (true) toEqual: (array = orderedCollection asArray).
    self expect: (true) toEqual: (array = sortedCollection asArray).
    self expect: (true) toEqual: (array = bag asArray).
    self expect: (true) toEqual: (array = set asArray).

    "
    The following messages also can be used to convert from one collection to another:
     * asOrderedCollection
     * asSortedCollection
     * asBag
     * asSet
    "
  ]
]
