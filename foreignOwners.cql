load csv with headers from "https://raw.githubusercontent.com/mneedham/graphconnect2017-hackathon/master/data/OV_FULL_2016_02.csv" AS row
UNWIND [row.`Proprietor_Name_1`, row.`Proprietor_Name_2`, row.`Proprietor_Name_3`, row.`Proprietor_Name_4`] AS proprietor
WITH row, proprietor WHERE proprietor <> ""
RETURN row.`Property_Address`, proprietor
LIMIT 100;

create constraint on (p:Proprietor)
assert p.name is unique;

create constraint on (p:Property)
assert p.address is unique;
