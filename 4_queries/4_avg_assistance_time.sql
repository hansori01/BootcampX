-- Get the average time of an assistance request.


SELECT AVG(completed_at - started_at) as avg_assistance_req_dur
FROM assistance_requests;