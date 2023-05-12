//customer messages - 1001 to 1100

const message = {
  200: {
    message: "",
    httpCode: 200,
    status: 1,
  },
  201: {
    message: "Record Created Successfully",
    httpCode: 201,
    status: 1,
  },

  204: {
    message: "No record found",
    httpCode: 200,
    status: 1,
  },
  400: {
    message: "Bad Request",
    httpCode: 400,
    status: 0,
  },
  401: {
    message: "You are not authorized to perform this action.",
    httpCode: 401,
    status: 0,
  },
  500: {
    message: "Error occured while processing request, please try again later",
    httpCode: 200,
    status: 0,
  },

  1001: {
    message: "Otp sent successfully",
    httpCode: 200,
    status: 1,
  },

  1002: {
    message: "Otp verified successfully",
    httpCode: 200,
    status: 1,
  },

  1003: {
    message: "Otp expired, please try again",
    httpCode: 200,
    status: 0,
  },
  1004: {
    message: "Invalid otp, please try again",
    httpCode: 200,
    status: 0,
  },
  1005: {
    message: "Request Type is required",
    httpCode: 400,
    status: 0,
  },
  1006:{
    message: 'Customer not found',
    httpCode: 200,
    status: 0
  },
  1007:{
    message: 'Please enter first name',
    httpCode: 400,
    status: 0
  },
  1008:{
    message: 'Please enter email',
    httpCode: 400,
    status: 0
  },
  1009:{
    message: 'Mobile Number is required',
    httpCode: 400,
    status: 0
  },
  1010:{
    message: 'Invalid email address',
    httpCode: 400,
    status: 0
  },
  1011:{
    message: 'Invalid mobile number',
    httpCode: 400,
    status: 0
  },
  1012:{
    message: 'Please enter otp',
    httpCode: 400,
    status: 0
  },
  1013:{
    message: 'Profile updated successfully',
    httpCode: 200,
    status: 1
  },
  1014:{
    message: 'Please enter vehicle registration number',
    httpCode: 400,
    status: 0
  },
  1015:{
    message: 'Please select vehicle type',
    httpCode: 400,
    status: 0
  },
  1016:{
    message: 'Please select manufacturer',
    httpCode: 400,
    status: 0
  },
  1017:{
    message: 'Please select vehicle model',
    httpCode: 400,
    status: 0
  },
  1018:{
    message: 'Please select vehicle variant',
    httpCode: 400,
    status: 0
  },
  1019:{
    message: 'Year is required',
    httpCode: 400,
    status: 0
  },
  1020:{
    message: 'Please enter vin_number',
    httpCode: 400,
    status: 0
  },

  1021:{
    message: 'Vehicle updated successfully',
    httpCode: 200,
    status: 1
  },
  1022:{
    message: 'Vehicle id required',
    httpCode: 400,
    status: 0
  },
  1023:{
    message: 'Vehicle deleted successfully',
    httpCode: 200,
    status: 1
  },
  1024:{
    message: 'connector id required',
    httpCode: 400,
    status: 0
  },
  1025:{
    message: 'Please select usage',
    httpCode: 400,
    status: 0
  },
  1026:{
    message: 'Please select I am',
    httpCode: 400,
    status: 0
  },
  1027:{
    message: 'Mobile number/Email id already exist.',
    httpCode: 400,
    status: 0
  },
  1028:{
    message: 'Mobile number not found try to register first.',
    httpCode: 400,
    status: 0
  },
  1029:{
    message: 'Please enter last name',
    httpCode: 400,
    status: 0
  },
  1030: {
    message: "Invalid mobile otp. Please try again",
    httpCode: 400,
    status: 0,
  },
  1031: {
    message: "Invalid email otp. Please try again",
    httpCode: 400,
    status: 0,
  },
  1032: {
    message: "Vehicles not found",
    httpCode: 400,
    status: 0,
  },
  1033: {
    message: "Vehicle already present with same reg no",
    httpCode: 400,
    status: 0,  
  },
  1101:{
    message: 'Content type required',
    httpCode: 400,
    status: 0
  },
  1109: {
    message: 'Email id/Mobile Number is required',
    httpCode: 400,
    status: 0
  },
  1110: {
    message: 'Otp is required',
    httpCode: 400,
    status: 0
  },
  1111: {
    message: 'Source is required',
    httpCode: 400,
    status: 0
  },
  1112: {
    message: 'Destination is required',
    httpCode: 400,
    status: 0
  },
  1113: {
    message: 'Vehicle Id is required',
    httpCode: 400,
    status: 0
  },
  1114: {
    message: 'Trip Id is required',
    httpCode: 400,
    status: 0
  },
  1115: {
    message: 'Amount is required',
    httpCode: 400,
    status: 0
  },
  1116: {
    message: 'Mark atleast one vehicle as default',
    httpCode: 400,
    status: 0
  },
  1020: {
    message: 'Email id and Mobile Number is required',
    httpCode: 400,
    status: 0
  },
  1201:{
    message: 'Address updated successfully.',
    httpCode: 200,
    status: 1
  },
  1202:{
    message: 'Address id required.',
    httpCode: 400,
    status: 0
  },
  1203:{
    message: 'Address type required.',
    httpCode: 400,
    status: 0
  },
  1204:{
    message: 'Please enter full address.',
    httpCode: 400,
    status: 0
  },
  1205:{
    message: 'Please enter floor.',
    httpCode: 400,
    status: 0
  },
  1206:{
    message: 'Please enter landmark.',
    httpCode: 400,
    status: 0
  },
  1207:{
    message: 'Is Default required.',
    httpCode: 400,
    status: 0
  },
  1208:{
    message: 'Address deleted successfully.',
    httpCode: 200,
    status: 1
  },
  1209:{
    message: 'Address id required.',
    httpCode: 400,
    status: 0
  },
  1210:{
    message: 'Charge Point id required.',
    httpCode: 400,
    status: 0
  },
  1211:{
    message: 'Status is required.',
    httpCode: 400,
    status: 0
  },
  1212: {
    message: 'Status should be either 0 or 1.',
    httpCode: 400,
    status: 0
  },
  1213: {
    message: 'Address not found.',
    httpCode: 400,
    status: 0
  },
  1214: {
    message: 'Is Default value should be either 0 or 1.',
    httpCode: 400,
    status: 0
  },
  1215: {
    message:'connector Id is required',
    httpCode:400,
    status:0
  },


  //booking response

  1301:{
    message: 'Connector not available.',
    httpCode: 400,
    status: 0
  },
  1302:{
    message: 'Charge Point id required.',
    httpCode: 400,
    status: 0
  },
  1303:{
    message: 'Connector id required.',
    httpCode: 400,
    status: 0
  },
  1304:{
    message: 'Payable Amount is required',
    httpCode: 400,
    status: 0
  },
  1305:{
    message: 'Please enter gross amount.',
    httpCode: 400,
    status: 0
  },
  1306:{
    message: 'Please enter date',
    httpCode: 400,
    status: 0
  },
  1307:{
    message: 'Please enter to date time.',
    httpCode: 400,
    status: 0
  },
  1308:{
    message: 'Booking created successfully.',
    httpCode: 200,
    status: 1
  },
  1309:{
    message: 'Booking cancelled successfully.',
    httpCode: 200,
    status: 1
  },
  1310:{
    message: 'Booking status updated successfully.',
    httpCode: 200,
    status: 1
  },
  1311:{
    message: 'Booking id required.',
    httpCode: 400,
    status: 0
  },
  1312:{
    message: 'Please select payment mode.',
    httpCode: 400,
    status: 2
  }, 
  1313: {
    message: 'Please enter from time.',
    httpCode: 400,
    status: 0
  },
  1313: {
    message: 'Please enter to time.',
    httpCode: 400,
    status: 0
  },
  1314: {
    message: 'Slot not available. Please choose another one',
    httpCode: 400,
    status: 0
  },
  1315: {
    message: 'Time required value should be in between station open and close timings',
    httpCode: 400,
    status: 0
  },
  1316: {
    message: 'Error while booking. Please try again',
    httpCode: 400,
    status: 0
  },
  1317: {
    message: 'Something went wrong. Please try again',
    httpCode: 400,
    status: 0
  },
  1318: {
    message: 'There is already a booking scheduled. Please try a different connector',
    httpCode: 400,
    status: 0
  },
  1319: {
    message: 'Booking not found',
    httpCode: 400,
    status: 0
  },
  1320: {
    message: 'Error while cancelling booking',
    httpCode: 400,
    status: 0
  },
  1321: {
    message: 'Booking cancelled succesfully',
    httpCode: 200,
    status: 1
  },
  1322: {
    message: 'Error while trying to start charging',
    httpCode: 400,
    status: 0
  },
  1323: {
    message: 'Sorry! Please check your time slot',
    httpCode: 400,
    status: 0
  },

  1401: {
    message: 'Customer id is required',
    httpCode: 400,
    status: 0
  },
  1402: {
    message: 'Feedback id is required',
    httpCode: 400,
    status: 0
  },
  1403: {
    message: 'Feedback updated Successfully',
    httpCode: 200,
    status: 1
  },
  1404: {
    message: 'Feedback deleted Successfully',
    httpCode: 200,
    status: 1
  },
  1405: {
    message: 'Rating/Review is required',
    httpCode: 400,
    status: 0
  },
  1406: {
    message: 'Station id is required',
    httpCode: 400,
    status: 0
  },
  1407: {
    message: 'Charger Rating is required',
    httpCode: 400,
    status: 0
  },
  1408: {
    message: 'Connector Rating is required',
    httpCode: 400,
    status: 0
  },
  1409: {
    message: 'Accuracy Rating is required',
    httpCode: 400,
    status: 0
  },
  1410: {
    message: 'Value Rating is required',
    httpCode: 400,
    status: 0
  },
  1411: {
    message: 'Location Rating is required',
    httpCode: 400,
    status: 0
  },
  1412: {
    message: 'Station not found',
    httpCode: 400,
    status: 0
  },
  1413: {
    message: 'Amenity id is required',
    httpCode: 400,
    status: 0
  },
  1414: {
    message: 'Network id is required',
    httpCode: 400,
    status: 0
  },
  1501: {
    message: 'Please enter name',
    httpCode: 400,
    status: 0
  },
  1502: {
    message: 'Please select member type',
    httpCode: 400,
    status: 0
  },
  1503: {
    message: 'Member Id is required',
    httpCode: 400,
    status: 0
  },
  1504: {
    message: 'Member with same email/mobile already present for customer',
    httpCode: 400,
    status: 0
  },
  1505: {
    message: 'Member updated successfully',
    httpCode: 200,
    status: 1
  },
  1506: {
    message: 'Member deleted successfully',
    httpCode: 200,
    status: 1
  },
  1507: {
    message: 'Member not found',
    httpCode: 400,
    status: 0
  },
  1601: {
    message: 'Unable to send email. Please try again',
    httpCode: 500,
    status: 0
  },
  1602: {
    message: 'Unable to send otp to mobile. Please try again',
    httpCode: 500,
    status: 0
  },
  1603: {
    message: 'Unable to send otp. Please try again',
    httpCode: 500,
    status: 0
  },
  1701: {
    message: 'Attachment is required',
    httpCode: 400,
    status: 0
  },
  1702: {
    message: 'File type is required',
    httpCode: 400,
    status: 0
  },
  1703: {
    message: 'Error while uploading file',
    httpCode: 500,
    status: 0
  },
  1704: {
    message: 'Attachment not found',
    httpCode: 400,
    status: 0
  },
  1705: {
    message: 'Error while fetching link.Please try again',
    httpCode: 500,
    status: 0
  },
  1706: {
    message: 'Error while deleting file.Please try again',
    httpCode: 500,
    status: 0
  },
  1707: {
    message: 'File deleted successfully',
    httpCode: 200,
    status: 1
  },
  1708: {
    message: 'File updated successfully',
    httpCode: 200,
    status: 1
  },
  1709: {
    message: 'Customer/Station/Member id is required',
    httpCode: 400,
    status: 0
  },
  1710: {
    message: 'Attachment already present. Please try updating',
    httpCode: 400,
    status: 0
  },
  1801: {
    message: 'Otp id is required',
    httpCode: 400,
    status: 0
  },
  1802: {
    message: 'Mobile or Email is required',
    httpCode: 400,
    status: 0
  },
  1803: {
    message: 'Otp not found',
    httpCode: 400,
    status: 0
  },

  1804:{
    message:"Faq deleted Successfully ",
    httpCode: 200,
    status: 1
  },
  1805: {
    message: 'Faq id is required',
    httpCode: 400,
    status: 0
  },
  1806: {
    message: 'Faq updated Successfully',
    httpCode: 200,
    status: 1
  },

  //Station Response
  1901: {
    message: 'Name is required',
    httpCode: 400,
    status: 0
  },
  1902: {
    message: 'Email of operator is required',
    httpCode: 400,
    status: 0
  },
  1903: {
    message: 'Mobile of operator is required',
    httpCode: 400,
    status: 0
  },
  1904: {
    message: 'Network type is required',
    httpCode: 400,
    status: 0
  },
  1905: {
    message: 'Type is required',
    httpCode: 400,
    status: 0
  },
  1906: {
    message: 'Type should be either private or public',
    httpCode: 400,
    status: 0
  },
  1907: {
    message: 'Open Time is required',
    httpCode: 400,
    status: 0
  },
  1908: {
    message: 'Close Time is required',
    httpCode: 400,
    status: 0
  },
  1909: {
    message: 'Station Url is required',
    httpCode: 400,
    status: 0
  },
  1910: {
    message: 'Images are required',
    httpCode: 400,
    status: 0
  },
  1910: {
    message: 'Images are required',
    httpCode: 400,
    status: 0
  },
  1911: {
    message: 'Address is required',
    httpCode: 400,
    status: 0
  },
  1912: {
    message: 'Landmark is required',
    httpCode: 400,
    status: 0
  },
  1913: {
    message: 'Pin is required',
    httpCode: 400,
    status: 0
  },
  1914: {
    message: 'Street is required',
    httpCode: 400,
    status: 0
  },
  1915: {
    message: 'City is required',
    httpCode: 400,
    status: 0
  },
  1916: {
    message: 'State is required',
    httpCode: 400,
    status: 0
  },
  1917: {
    message: 'Country is required',
    httpCode: 400,
    status: 0
  },
  1918: {
    message: 'Longitude is required',
    httpCode: 400,
    status: 0
  },
  1919: {
    message: 'Latitude is required',
    httpCode: 400,
    status: 0
  },

  //User Response
  2000: {
    message: 'Name is required',
    httpCode: 400,
    status: 0
  },
  2001: {
    message: 'Pan is required',
    httpCode: 400,
    status: 0
  },
  2002: {
    message: 'Gst no is required',
    httpCode: 400,
    status: 0
  },
  2003: {
    message: 'Business Type is required',
    httpCode: 400,
    status: 0
  },
  2004: {
    message: 'Business mobile is required',
    httpCode: 400,
    status: 0
  },
  2005: {
    message: 'Business email is required',
    httpCode: 400,
    status: 0
  },
  2006: {
    message: 'Date of Birth is required',
    httpCode: 400,
    status: 0
  },
  2007: {
    message: 'Area is required',
    httpCode: 400,
    status: 0
  },
  2008: {
    message: 'Business url is required',
    httpCode: 400,
    status: 0
  },
  2009: {
    message: 'Business email is Invalid',
    httpCode: 400,
    status: 0
  },
  2010: {
    message: 'Business mobile is Invalid',
    httpCode: 400,
    status: 0
  },
  2011: {
    message: 'Vendor with email/mobile already exists',
    httpCode: 400,
    status: 0
  },
  2012: {
    message: 'Invalid Link',
    httpCode: 400,
    status: 0
  },
  2013: {
    message: 'Password set successfully',
    httpCode: 200,
    status: 1
  },
  2014: {
    message: 'Reset Password Code is required',
    httpCode: 400,
    status: 0
  },
  2015: {
    message: 'Password is required',
    httpCode: 400,
    status: 0
  },
  2016: {
    message: 'Vendor Id is required',
    httpCode: 400,
    status: 0
  },
  2017: {
    message: 'Vendor not found',
    httpCode: 400,
    status: 0
  },
  2018: {
    message: 'Password is required',
    httpCode: 400,
    status: 0
  },
  2019: {
    message: 'Invalid email and/or password',
    httpCode: 400,
    status: 0
  },
  2020: {
    message: 'Password rest link sent successfully',
    httpCode: 200,
    status: 1
  },
  2021: {
    message: 'Login Successfull',
    httpCode: 200,
    status: 1
  },
  2022: {
    message: 'Charge point id is required',
    httpCode: 400,
    status: 0
  },
  2023: {
    message: 'Connectors are required',
    httpCode: 400,
    status: 0
  },
  2024: {
    message: 'Charging point not found',
    httpCode: 400,
    status: 0
  },
  2025: {
    message: 'Connector deleted Successfully',
    httpCode: 200,
    status: 1
  },
  2026: {
    message: 'Connector not found',
    httpCode: 400,
    status: 0
  },
  2027: {
    message: 'Price is required',
    httpCode: 400,
    status: 0
  },
  2028: {
    message: 'Power is required',
    httpCode: 400,
    status: 0
  },
  2029: {
    message: 'Charger Type is required',
    httpCode: 400,
    status: 0
  },
  2030: {
    message: 'Reservation Id is required',
    httpCode: 400,
    status: 0
  },
  2031: {
    message: 'Please select your default vehicle',
    httpCode: 400,
    status: 0
  },
  2030:{
    message:'connector not found',
    httpCode:400,
    status:0
  },
  2101:{
    message:'Manufacturer name is required',
    httpCode: 400,
    status:0
  },
  2102:{
    message:'thumbnail is required',
    httpCode: 400,
    status:0
  }, 
  2103:{
    message:'Manufacturer id is required',
    httpCode: 400,
    status:0
  },
  2104:{
    message:'vehicle model name is required',
    httpCode: 400,
    status:0
  },
  2105:{
    message:'vehicle model id is required',
    httpCode: 400,
    status:0
  },
  2106:{
    message:'charger type id is required',
    httpCode: 400,
    status:0
  },
  2107:{
    message:'max_khw is required',
    httpCode: 400,
    status:0
  },
  2108:{
    message:'time is required',
    httpCode: 400,
    status:0
  },
  2109:{
    message:'vehicle connector id is required',
    httpCode: 400,
    status:0
  },
  2110: {
    message:'Connnector updated Successfully',
    httpCode: 200,
    status: 1
  },
  2111: {
    message:'Vocuher has been already claimed',
    httpCode: 400,
    status: 0
  },
  2112: {
    message:'Referal already exists',
    httpCode: 400,
    status: 0
  },
  2113: {
    message:'Error while creating vendor account. Please try again',
    httpCode: 400,
    status: 0
  },
  2114: {
    message:'Time required should be greater than zero',
    httpCode: 400,
    status: 0
  },
  2115: {
    message:'Mentioned time is not possible',
    httpCode: 400,
    status: 0
  },
  2116: {
    message:'Payment has been already made for this booking',
    httpCode: 400,
    status: 0
  },
  2117: {
    message:'Coupon not found',
    httpCode: 400,
    status: 0
  },
  2118: {
    message: 'Vehicle with bookings cannot be deleted',
    httpCode: 400,
    status: 0
  },
  2119: {
    message: 'Default vehicle cannot be deleted',
    httpCode: 400,
    status: 0
  },
  2120: {
    message: 'Coupon Code is required',
    httpCode: 400,
    status: 0
  },
  2121: {
    message: 'Coupon Start date is required',
    httpCode: 400,
    status: 0
  },
  2122: {
    message: 'Coupon title is required',
    httpCode: 400,
    status: 0
  },
  2123: {
    message: 'Coupon expiry date is required',
    httpCode: 400,
    status: 0
  },
  2124: {
    message: 'Coupon description is required',
    httpCode: 400,
    status: 0
  },
  2125: {
    message: 'Coupon type is required',
    httpCode: 400,
    status: 0
  },
  2126: {
    message: 'Coupon Offer is required',
    httpCode: 400,
    status: 0
  },
  2127: {
    message: 'Offer type is required',
    httpCode: 400,
    status: 0
  },
  2128: {
    message: 'Coupon Code is required',
    httpCode: 400,
    status: 0
  },
  2129: {
    message: 'Points should be greater than or equal to 100',
    httpCode: 400,
    status: 0
  },
  2130: {
    message: 'Connector is not available. Please choose a different connector',
    httpCode: 400,
    status: 0
  },
  2131: {
    message: 'Invalid Coupon',
    httpCode: 400,
    status: 0
  },
  2132: {
    message: 'Coupon has been already used',
    httpCode: 400,
    status: 0
  },
  2133: {
    message: 'Coupon applied successfully',
    httpCode: 200,
    status: 1
  },
  2134: {
    message: 'Coupon removed successfully',
    httpCode: 200,
    status: 1
  },
  2136: {
    message: 'Your previous booking payment is pending. Please complete that payment',
    httpCode: 400,
    status: 0
  },
  2137: {
    message: 'Error while fetching vehicle data',
    httpCode: 400,
    status: 0
  },
  2138: {
    message: 'All points has been reedemed',
    httpCode: 400,
    status: 0
  },
  2139: {
    message: "You can't make more than one trip as on going",
    httpCode: 400,
    status: 0
  },
  2140: {
    message:"manufacturer_id is not valid",
    httpCode:400,
    status:0
  },
  2141: {
    message: "Data already saved",
    httpCode:400,
    status:0
  },
  2142: {
    message:"Name already exists",
    httpCode:400,
    status:0
  },
  2143: {
    message: "Record Updated Successfully",
    httpCode: 201,
    status: 1,
  },
  2144: {
    message: "Status Updated Successfully",
    httpCode: 201,
    status: 1,
  },
  2145:{
    message: "Vendor Id already exists",
    httpCode: 400,
    status: 0,
  },
  2146: {
    message: "vehicle connector already exists",
    httpCode: 400,
    status:01,
  },
  2147: {
    message: "Cannot add yourself as a member",
    httpCode: 400,
    status: 0,
  },
  2148: {
    message: "Advance payment not found for this booking",
    httpCode: 400,
    status: 0,
  },
  2149: {
    message: "Enquiry already present with the same mobile number",
    httpCode: 400,
    status: 0,
  },
  2150: {
    message: "Query is required",
    httpCode: 400,
    status: 0,
  },
  2151: {
    message: "Sub category for mentioned category not found",
    httpCode: 400,
    status: 0,
  },
  2152: {
    message: "Convenience should be in percentage",
    httpCode: 400,
    status: 0,
  },
  2153: {
    message: "Coupon Deleted Successfully",
    httpCode: 200,
    status: 0,
  },
  2154: {
    message: "Coupon Not Found",
    httpCode: 400,
    status: 0,
  },
  2156: {
    message: "Disabled successfully",
    httpCode: 200,
    status: 0,
  },
  2157: {
    message: "Enabled successfully",
    httpCode: 200,
    status: 0,
  },
  2158: {
    message: "Coupon with the same code already exists",
    httpCode: 200,
    status: 0,
  },
  2159: {
    message: "Your details are pending for approval",
    httpCode: 400,
    status: 0,
  },
  2160: {
    message: "Your login has been disabled by admin",
    httpCode: 400,
    status: 0,
  },
  2161:{
    message: "Your account has been rejected by admin",
    httpCode: 400,
    status: 0,
  },
  2162:{
    message: "You cannot delete the on going trip",
    httpCode: 400,
    status: 0,
  },
  2163:{
    message: "Variant name is required",
    httpCode: 400,
    status: 0,
  },
  2164:{
    message: "Variant Id is required",
    httpCode: 400,
    status: 0,
  },
  2165:{
    message: "Variant already exists",
    httpCode: 400,
    status: 0,
  },
  2166: {
    message: "Please add charging points",
    httpCode: 400,
    status: 0,
  },
  2167: {
    message: "Account deletion is not possible because of uncompleted bookings",
    httpCode: 400,
    status: 0,
  },
  2168: {
    message: "Voucher claimed successfully",
    httpCode: 200,
    status: 1
  },
  2169: {
    message: "Member doesn't exist , referral request sent",
    httpCode: 200,
    status: 1
  }
};

module.exports = message;
