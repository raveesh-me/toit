import monitor
import system.services show ServiceClient ServiceResourceProxy
import .service

class NotificationServiceClient extends ServiceClient:
  static SELECTOR ::= NotificationService.SELECTOR

  constructor selector=SELECTOR:
    assert: selector.matches SELECTOR
    super selector

  connect -> Connection:
    handle := invoke_ NotificationService.CONNECT_INDEX null
    proxy := Connection this handle
    return proxy

  send_ handle/int message/string -> none:
    invoke_ NotificationService.CONNECTION_SEND_INDEX [handle, message]

class Connection extends ServiceResourceProxy:
  channel_ := monitor.Channel 10

  constructor client/ServiceClient handle/int:
    super client handle

  send message/string -> none:
    client := (client_ as NotificationServiceClient)
    client.send_ handle_ message

  receive -> string:
    return channel_.receive

  on_notified_ notification/any -> none:
    channel_.send notification
