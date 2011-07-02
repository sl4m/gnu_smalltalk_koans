Koan subclass: TestAssociation [
  <comment: 'A collection of association tests.'>

  testCreatingAssociationThreeDifferentWays [
    | association anotherAssociation andAnotherAssociation |

    association := #a -> 0.

    self expect: fillMeIn toEqual: association key.
    self expect: fillMeIn toEqual: association value.

    anotherAssociation := Association new key: #b value: 1.

    self expect: fillMeIn toEqual: anotherAssociation key.
    self expect: fillMeIn toEqual: anotherAssociation value.

    andAnotherAssociation := Association key: #c value: 2.

    self expect: fillMeIn toEqual: andAnotherAssociation key.
    self expect: fillMeIn toEqual: andAnotherAssociation value.
  ]

  testAssociationKeysCanBeAnyObject [
    | association |

    association := 'a' -> 0.

    self expect: fillMeIn toEqual: association key.

    association := 0 -> 1.

    self expect: fillMeIn toEqual: association key.

    association := true -> 2.

    self expect: fillMeIn toEqual: association key.

    association := nil -> 3.

    self expect: fillMeIn toEqual: association key.

    association := $b -> 4.

    self expect: fillMeIn toEqual: association key.
  ]

  testComparingAssociations [
    | association anotherAssociation |

    association := Association key: #a value: 0.

    self expect: fillMeIn toEqual: (association = (#a -> 0)).

    anotherAssociation := Association key: #b value: 1.

    self expect: fillMeIn toEqual: (association = (#b -> 2)).
    self expect: fillMeIn toEqual: (association = (#c -> 1)).
  ]

  testAssociationsActLikeSingletons [
    | association anotherAssociation |

    association := Association new key: #a value: 0.
    anotherAssociation := #a -> 0.

    self expect: fillMeIn toEqual: (association = anotherAssociation).
  ]
]
