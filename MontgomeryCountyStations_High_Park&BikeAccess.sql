-- Montgomery County Jurisdiction stations with parking and bike access score above 3
select Station_Name, Parking_Score, Bike_Access_Score from station 
join station_score
where Parking_Score > 3
and Bike_Access_Score > 3
and Jurisdiction = 'Montgomery County';
