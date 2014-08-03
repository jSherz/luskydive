base_path = '/home/site/webapps/luskydive/'
log_path = base_path + 'log/unicorn.log'

working_directory base_path + 'current/'

pid base_path + 'pids/unicorn.pid'

stderr_path log_path
stdout_path log_path

listen '/tmp/unicorn.luskydive.sock'

worker_processes 4

timeout 30
