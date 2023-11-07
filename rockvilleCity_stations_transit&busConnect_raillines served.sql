-- Stations in the city of rockville including:connecting bus routes, transit connections, and rail lines served
select *  from station join transit
where Jurisdiction = 'City of Rockville';
