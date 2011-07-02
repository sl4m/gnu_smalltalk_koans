Object subclass: Tracker [
  |status|

  Tracker class >> create [
    ^self new
      status: true;
      yourself
  ]

  status [
    ^status
  ]

  status: newStatus [
    status := newStatus
  ]
]
