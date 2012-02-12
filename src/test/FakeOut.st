Object subclass: FakeOut [
  | message |

  FakeOut class >> create [
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
