DECLARE @Year INT = 2025;
DECLARE @Month INT = 4;

;WITH Dates AS (
    SELECT DATEFROMPARTS(@Year, @Month, 1) AS DateValue
    UNION ALL
    SELECT DATEADD(DAY, 1, DateValue)
    FROM Dates
    WHERE MONTH(DateValue) = @Month
),
Calendar AS (
    SELECT 
        DateValue,
        DATEPART(WEEK, DateValue) - DATEPART(WEEK, DATEFROMPARTS(YEAR(DateValue), MONTH(DateValue), 1)) 
            + CASE DATEPART(WEEKDAY, DATEFROMPARTS(YEAR(DateValue), MONTH(DateValue), 1))
                 WHEN 1 THEN 0 ELSE 1 END AS WeekNum,
        DATENAME(WEEKDAY, DateValue) AS WeekDayName,
        DATEPART(WEEKDAY, DateValue) AS WeekDayNumber
    FROM Dates
)
SELECT
    MAX(CASE WHEN DATEPART(WEEKDAY, DateValue) = 1 THEN DAY(DateValue) END) AS Sunday,
    MAX(CASE WHEN DATEPART(WEEKDAY, DateValue) = 2 THEN DAY(DateValue) END) AS Monday,
    MAX(CASE WHEN DATEPART(WEEKDAY, DateValue) = 3 THEN DAY(DateValue) END) AS Tuesday,
    MAX(CASE WHEN DATEPART(WEEKDAY, DateValue) = 4 THEN DAY(DateValue) END) AS Wednesday,
    MAX(CASE WHEN DATEPART(WEEKDAY, DateValue) = 5 THEN DAY(DateValue) END) AS Thursday,
    MAX(CASE WHEN DATEPART(WEEKDAY, DateValue) = 6 THEN DAY(DateValue) END) AS Friday,
    MAX(CASE WHEN DATEPART(WEEKDAY, DateValue) = 7 THEN DAY(DateValue) END) AS Saturday
FROM Calendar
GROUP BY WeekNum
ORDER BY WeekNum;
