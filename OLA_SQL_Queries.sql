Drop database ola;

Create database OLA;
Use OLA;

#1. Retrieve all successful bookings:
Create view Successful_Booking as 
Select * from bookings
where Booking_Status ='Success';

#2. Find the average ride distance for each vehicle type:
Create view Ride_Dist_for_each_Vech as 
Select Vehicle_Type, avg(Ride_Distance)
as Avg_Distance from Bookings
Group by Vehicle_Type;

# 3. Get the total number of cancelled rides by customers:
Create view Canceled_rides_by_Customers as
Select count(*) from Bookings 
where Booking_Status= 'Canceled by Customer';

#4. List the top 5 customers who booked the highest number of rides:
Create view Top_5_Customers as  
SELECT Customer_ID, COUNT(Booking_ID) as Total_rides 
FROM Bookings 
GROUP BY Customer_ID 
ORDER BY total_rides DESC LIMIT 5;

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create view Canceled_rides_by_Drivers as
Select count(*) from Bookings 
where Booking_Status= 'Canceled by Driver';

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create view Max_and_Min_Ratings as 
SELECT MAX(Driver_Ratings) as Max_Rating, MIN(Driver_Ratings) as Min_Rating 
FROM Bookings 
WHERE Vehicle_Type = 'Prime Sedan';

#7. Retrieve all rides where payment was made using UPI:
Create view UPI_Payment_Mode as 
SELECT * FROM Bookings 
WHERE Payment_Method = 'UPI';

#8. Find the average customer rating per vehicle type:
Create view Avg_Cust_Rating_Per_Veh as 
SELECT Vehicle_Type, AVG(Customer_Rating) as Avg_Customer_Rating 
FROM Bookings
GROUP BY Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully:
 Create view Completed_Booking_Value as 
 SELECT SUM(Booking_Value) as Total_Booking_Value 
 FROM Bookings 
 WHERE Booking_Status = 'Success';

#10. List all incomplete rides along with the reason:
Create view All_Incompletd_Rides as 
SELECT Booking_ID, Incomplete_Rides_Reason 
FROM Bookings 
WHERE Incomplete_Rides ='Yes';


