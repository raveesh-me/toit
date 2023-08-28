import system.services show ServiceSelector

/**
A notification service that connects multiple clients to each other.
*/
interface NotificationService:
  static SELECTOR ::= ServiceSelector
      --uuid="c6f4862f-c17f-4624-865b-fa19467865c5"
      --major=0
      --minor=1

  /**
  Connects this client to the notification service.

  Returns a handle (int) to the Connection.
  */
  connect -> int
  static CONNECT_INDEX ::= 0

  connection_send handle/int message/string -> none
  static CONNECTION_SEND_INDEX ::= 1
