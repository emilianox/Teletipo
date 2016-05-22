# all the commands

_commandlist =
  "/test2":
    fn: test2
  "/onlySudo":
    fn: test1
    roles:["sudo"]
  "/review":
    fn: justReviewFn
    roles: ["reviewer"]
  "/start":
    fn: startCommand
