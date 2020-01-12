test "test" {
  case "ok1" {
    concurrency = 1
    err = ""
    stdout = "2"
    delayone = 1
    delaytwo = 0
  }

  case "ok2" {
    concurrency = 1
    err = ""
    stdout = "2"
    delayone = 0
    delaytwo = 1
  }

  case "ok3" {
    concurrency = 2
    err = ""
    stdout = "2"
    delayone = 1
    delaytwo = 0
  }

  case "ok4" {
    concurrency = 2
    err = ""
    stdout = "2"
    delayone = 0
    delaytwo = 1
  }

  case "ng1" {
    concurrency = 0
    err = "concurrency less than 1 can not be set. If you wanted 0 for a concurrency equals to the number of steps, is isn't a good idea. Some system has a relatively lower fd limit that can make your command fail only when there are too many steps. Always use static number of concurrency"
    stdout = ""
    delayone = 0
    delaytwo = 1
  }

  run "test" {
    concurrency = case.concurrency
    delayone = case.delayone
    delaytwo = case.delaytwo
  }

  assert "err" {
    condition = run.err == case.err
  }

  assert "stdout" {
    condition = run.res.stdout == case.stdout
  }
}
