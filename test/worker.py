import gearman, time

gm_worker = gearman.GearmanWorker(['localhost:4730'])



# See gearman/job.py to see attributes on the GearmanJob
# Send back a reversed version of the 'data' string
def task_listener_reverse(gearman_worker, gearman_job):
    for x in xrange(10):
        time.sleep(1)
        gearman_worker.send_job_status(gearman_job, x, 10)
    return gearman_job.data

# gm_worker.set_client_id is optional
#gm_worker.set_client_id(str(int(time.time())))
gm_worker.register_task('reverse', task_listener_reverse)


# Enter our work loop and call gm_worker.after_poll() after each time we timeout/see socket activity
gm_worker.work()
