SELECT * FROM [httparchive:runs.latest_pages] as pages JOIN (
  SELECT pageid, REGEXP_EXTRACT(url, r'(maps.googleapis.com)') AS link2
  FROM [httparchive:runs.latest_requests] as requests
  WHERE REGEXP_MATCH(url, r'maps.googleapis.com')
) AS lib ON pages.pageid = lib.pageid

SELECT urlShort FROM [httparchive:runs.latest_pages] as pages JOIN (
  SELECT pageid, REGEXP_EXTRACT(url, r'(mapbox.com)') AS link2
  FROM [httparchive:runs.latest_requests] as requests
  WHERE REGEXP_MATCH(url, r'mapbox.com')
) AS lib ON pages.pageid = lib.pageid
GROUP BY urlShort;

SELECT * FROM [httparchive:runs.latest_pages] as pages JOIN (
SELECT url, pageid, REGEXP_EXTRACT(url, r'(maps.googleapis.com|google.com.*maps|maps.google.com|maps.gstatic.com)') AS shortlink
FROM [httparchive:runs.latest_requests] as requests
WHERE REGEXP_MATCH(url, r'maps.googleapis.com|google.com.*maps|maps.google.com|maps.gstatic.com')
) AS lib ON pages.pageid = lib.pageid;
