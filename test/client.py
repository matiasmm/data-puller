import gearman, time

def check_request_status(job_request, gm_client):
    gm_client.get_job_status(job_request)

    if job_request.complete:
        print "Job %s finished!  Result: %s - %s" % (job_request.job.unique, job_request.state, job_request.result)
    elif job_request.timed_out:
        print "Job %s timed out!" % job_request.unique
    elif job_request.state == JOB_UNKNOWN:
        print "Job %s connection failed!" % job_request.unique
    else:
        print "Hola"

gm_client = gearman.GearmanClient(['localhost:4730'])

submitted_job_request = gm_client.submit_job('reverse', 'helllooow world')
while True:
    check_request_status(submitted_job_request, gm_client)
    time.sleep(1)
