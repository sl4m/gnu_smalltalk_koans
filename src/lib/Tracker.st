Object subclass: Tracker [
  |status error |

  Tracker class >> create [
    ^self new
      status: true;
      error: nil;
      yourself
  ]

  status [
    ^status
  ]

  status: newStatus [
    status := newStatus.
  ]

  error [
    ^error
  ]

  error: newError [
    error := newError.
  ]
]
