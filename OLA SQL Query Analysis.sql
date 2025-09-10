#1. Retrieve all successful bookings:
Create view successful_bookings As

SELECT * FROM bookings 
WHERE Booking_Status = 'Success';

select * from successful_bookings;

#2. Find the average ride distance for each vehicle type:
Create view ride_distance_for_each_vehicle As

SELECT Vehicle_Type, 
AVG(Ride_Distance) as avg_distance 
FROM bookings GROUP BY
Vehicle_Type;

select * from ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
Create view cancelled_rides_by_customers As

SELECT COUNT(*) 
FROM bookings
 WHERE Booking_Status = 'cancelled by Customer';

select * from cancelled_rides_by_customers;


#4. List the top 5 customers who booked the highest number of rides:
Create View top_5_Customers As

SELECT Customer_ID, COUNT(Booking_ID) as total_rides FROM bookings GROUP BY
Customer_ID ORDER BY total_rides DESC LIMIT 5;

select * from top_5_Customers;


#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View rides_cancelled_by_drivers_PC_issues As

SELECT COUNT(*) FROM bookings 
WHERE canceled_Rides_by_Driver = 'Personal & Car related issue';

Select * from rides_cancelled_by_drivers_PC_issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create view Max_Min_driver_rating as

SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating FROM
bookings WHERE Vehicle_Type = 'Prime Sedan';


Select * from Max_Min_driver_rating;

#7. Retrieve all rides where payment was made using UPI:
Create view payment_using_UPI As

SELECT * FROM bookings 
WHERE Payment_Method = 'UPI';

Select * from payment_using_UPI;

#8. Find the average customer rating per vehicle type:
Create View AVG_Cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) 
as avg_customer_rating FROM bookings
GROUP BY Vehicle_Type;

Select * from AVG_Cust_Rating;


#9. Calculate the total booking value of rides completed successfully:
Create View rides_completed_successfully As
SELECT SUM(Booking_Value) 
as total_successful_value FROM bookings 
WHERE
Booking_Status = 'Success';

Select * from rides_completed_successfully;

#10. List all incomplete rides along with the reason:
Create view Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason
 FROM bookings
 WHERE Incomplete_Rides ='Yes';

select * from Incomplete_Rides_Reason;