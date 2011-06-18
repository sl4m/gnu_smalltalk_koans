Koan subclass: TestAssociation [
  testCreatingAssociationThreeDifferentWays [
    | association anotherAssociation andAnotherAssociation |

    association := #a -> 0.

    self expect: (self fillMeIn) toEqual: (association key).
    self expect: (self fillMeIn) toEqual: (association value).

    anotherAssociation := Association new key: #b value: 1.

    self expect: (self fillMeIn) toEqual: (anotherAssociation key).
    self expect: (self fillMeIn) toEqual: (anotherAssociation value).

    andAnotherAssociation := Association key: #c value: 2.

    self expect: (self fillMeIn) toEqual: (andAnotherAssociation key).
    self expect: (self fillMeIn) toEqual: (andAnotherAssociation value).
  ]

  testAssociationKeysCanBeAnyObject [
    | association |

    association := 'a' -> 0.

    self expect: (self fillMeIn) toEqual: (association key).

    association := 0 -> 1.

    self expect: (self fillMeIn) toEqual: (association key).

    association := true -> 2.

    self expect: (self fillMeIn) toEqual: (association key).

    association := nil -> 3.

    self expect: (self fillMeIn) toEqual: (association key).

    association := $b -> 4.

    self expect: (self fillMeIn) toEqual: (association key).
  ]

  testComparingAssociations [
    | association anotherAssociation |

    association := Association key: #a value: 0.

    self expect: (self fillMeIn) toEqual: (association = (#a -> 0)).

    anotherAssociation := Association key: #b value: 1.

    self expect: (self fillMeIn) toEqual: (association = (#b -> 2)).
    self expect: (self fillMeIn) toEqual: (association = (#c -> 1)).
  ]

  testAssociationsActLikeSingletons [
    | association anotherAssociation |

    association := Association new key: #a value: 0.
    anotherAssociation := #a -> 0.

    self expect: (self fillMeIn) toEqual: (association = anotherAssociation).
  ]
]
