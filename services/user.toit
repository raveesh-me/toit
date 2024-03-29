import .client

main:
  name := "client - $Time.now"
  print "My name is $name"
  main --name=name

main --name:
  client := NotificationServiceClient
  client.open
  connection := client.connect
  send_task/Task? := null
  try:
    send_task = task::
      counter := 0
      while true:
        connection.send "hello from $name ($(counter++))"
        sleep (Duration --s=(1 + (random 3)))

    while true:
      message := connection.receive
      if message == "quit":
        break
      print "$name received: $message"

  finally:
    // Make sure we execute all of these finally statements
    // even if one of them yields.
    critical_do:
      if send_task != null:
        send_task.cancel
      connection.close
      client.close
