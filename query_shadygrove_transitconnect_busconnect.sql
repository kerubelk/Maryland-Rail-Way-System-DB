-- List of transit connections and connecting bus routes that lead to the station 
-- shady grove
select station.Station_Name, transit.Transit_Connections, transit.Connecting_BusRoutes from station
 join transit
 where Station_Name = 'Shady Grove';