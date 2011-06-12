Koan subclass: TestCollectionsRevisited [
  <comment: 'A collection of advanced collection tests.'>

  testDo [
    | array sum |

    "Iterate over collection."

    array := #(1 2 3 4).
    sum := 0.
    array do: [ :number | sum := sum + number ].

    self expect: (self fillMeIn) toEqual: (sum).
  ]

  testConform [
    | array result |

    "Meets condition(s)."

    array := #($m $n $o $p).
    result := array conform: [ :character | character > $l & character < $q ].

    self expect: (self fillMeIn) toEqual: (result).
  ]

  testSelect [
    | array result |

    "Return collection of elements that meets condition(s)."

    array := #(1 2 3 4 5).
    result := array select: [ :number | number even ].

    self expect: (self fillMeIn) toEqual: (result).
  ]

  testReject [
    | array result |

    "Return collection of elements that do not meet condition(s)."

    array := #(1 2 3 4 5).
    result := array reject: [ :number | number even ].

    self expect: (self fillMeIn) toEqual: (result).
  ]

  testCollect [
    | array result |

    "Transform each element and return in a new collection."

    array := #($a $b $c $d $e).
    result := array collect: [ :character | character asUppercase ].

    self expect: (self fillMeIn) toEqual: (result).
  ]

  testDetect [
    | array result |

    array := #(56 81 16 77).
    result := array detect: [ :number | number sqrt = 4 ].

    self expect: (self fillMeIn) toEqual: (result).
  ]

  testInject [
    | array result |

    array := #(4 8 12 16).
    result := array inject: 0 into: [ :numOne :numTwo | numOne + numTwo ].

    self expect: (self fillMeIn) toEqual: (result).
  ]
]
