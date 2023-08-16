SELECT `Custom_Inv_ID`, 
`Date`, 
`Time`, 
current_date() AS SysDate,
 STR_TO_DATE(`Date`, "%Y-%m-%d") AS InvDateObj, 
 DATEDIFF(CURDATE() , 
STR_TO_DATE(`Date`, "%Y-%m-%d")) AS NoOfDays 
FROM invoice;