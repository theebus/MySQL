SELECT  JobCustom_ID,
    Vehicle_No,
    Technician_Name,
    Extra_Discount,
    Sub_Total,
    Net_Total,
    Started_Date,
    Completed_Date,
    IFNULL(Service_Total, 0.0) AS Service_Amount, IFNULL(Parts_Total, 0.0) AS Sparepart_Amount FROM 
(SELECT Job_CustomID AS JobCustom_ID,
    Vehicle_No,
    Technician_Name,
    Extra_Discount,
    Sub_Total,
    Net_Total,
    Started_Date,
    Completed_Date,
    CreateDate FROM job_card) jobCard
left JOIN (SELECT SUM(LineTotal) AS Service_Total, Job_Custom_ID FROM job_card_maintenance GROUP BY Job_Custom_ID) jobService ON jobCard.JobCustom_ID = jobService.Job_Custom_ID 
left JOIN (SELECT SUM(Line_Total) AS Parts_Total, Job_Custom_ID FROM job_card_parts GROUP BY Job_Custom_ID) jobPart ON jobCard.JobCustom_ID = jobPart.Job_Custom_ID
WHERE  jobCard.Sub_Total > "NaN" AND (jobCard.`JobCustom_ID` = $P{Job_CustomID}
 OR jobCard.`Completed_Date` = $P{Completed_Date}
 OR jobCard.`Vehicle_No` = $P{Vehicle_No}
 OR jobCard.`Technician_Name` = $P{Technician_Name})