USE mavenfuzzyfactory

WITH 
select website_session_id, MIN(website_pageview_id)
from website_pageviews
where date(created_at) < '2012-06-13'
GROUP BY 1
;

SELECT pageview_url, COUNT(DISTINCT website_session_id) sessions
FROM website_pageviews
WHERE website_pageviews.created_at < '2012-06-10'
GROUP BY pageview_url;

SELECT device_type, COUNT(distinct website_session_id), count(distinct order_id), count(distinct order_id)/COUNT(distinct website_session_id) as cvr
FROM website_sessions
LEFT JOIN orders USING (website_session_id)
WHERE DATE(website_sessions.created_at) < '2012-05-12' AND utm_source = 'gsearch' AND utm_campaign = 'nonbrand'
GROUP BY 1;


SELECT COUNT(DISTINCT website_session_id), COUNT(DISTINCT order_id), COUNT(DISTINCT order_id)/COUNT(DISTINCT website_session_id)*100 as CVR
FROM website_sessions
LEFT JOIN orders USING (website_session_id)
WHERE DATE(website_sessions.created_at) < '2012-04-14' AND utm_source = 'gsearch' AND utm_campaign = 'nonbrand';

SELECT utm_source, utm_campaign, http_referer,
		count(website_session_id)
FROM website_sessions
WHERE created_at < '2012-04-13'
GROUP BY 1, 2, 3;