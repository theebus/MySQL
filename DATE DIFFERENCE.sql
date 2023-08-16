SELECT UNIX_TIMESTAMP(Date) AS integer_date,

UNIX_TIMESTAMP(current_date()) AS Today_Int,
(UNIX_TIMESTAMP(current_date())-UNIX_TIMESTAMP(Date))/86400 as ANumber

from invoice; 

-- THIS CODE I USED FOR FILTER THE DATE DIFFERENCE 


 