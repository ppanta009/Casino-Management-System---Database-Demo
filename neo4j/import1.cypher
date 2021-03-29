LOAD csv with headers from "file:///customer.csv" as row
CREATE (n:customer)
SET n = row,
n.userid = tostring(row.userid),
n.fullname = tostring(row.fullname),
n.email = tostring(row.email),
n.discpline_status = tostring(row.discpline_status),
n.membership = tostring(row.membership)

LOAD csv with headers from "file:///employee.csv" as row
CREATE (n:employee)
SET n = row,
n.userid = tostring(row.userid),
n.fullname = tostring(row.fullname),
n.email = tostring(row.email),
n.discpline_status = tostring(row.discpline_status)

LOAD csv with headers from "file:///dealer.csv" as row
CREATE (n:dealer)
SET n = row

LOAD csv with headers from "file:///supervisor.csv" as row
CREATE (n:supervisor)
SET n = row

MATCH (a:employee),(b:dealer)
WHERE a.userid = b.userid
CREATE (b)-[:is_a_part_of]->(a)
return a,b

MATCH (a:employee),(b:supervisor)
WHERE a.userid = b.userid
CREATE (b)-[:is_a_part_of]->(a)
return a,b

LOAD csv with headers from "file:///feedback.csv" as row
CREATE (n:feedback)
SET n = row,
n.caseid = tostring(row.caseid),
n.content = tostring(row.content),
n.rating = tointeger(row.rating),
n.userid = tostring(row.userid)

MATCH (a:customer),(b:feedback)
WHERE a.userid= b.userid
CREATE (a)-[:provides]->(b)
return a,b

LOAD csv with headers from "file:///games.csv" as row
CREATE (n:game)
SET n = row,
n.gamename = tostring(row.gamename),
n.gameid = tostring(row.gameid)
return n

LOAD csv with headers from "file:///play.csv" as row
MATCH (a:customer),(b:game)
WHERE a.userid = row.userid and b.gameid=row.gameid
CREATE (a)-[:plays]->(b)
return a,b

MATCH (a:dealer),(b:game)
WHERE a.userid=b.userid
CREATE (a)-[:deals]->(b)
return a,b

LOAD csv with headers from "file:///supervisegame.csv" as row
MATCH (a:supervisor),(b:game)
WHERE a.userid=row.userid and b.gameid=row.gameid
CREATE (a)-[:manages]->(b)
return a,b	

LOAD csv with headers from "file:///supervise.csv" as row
MATCH (a:dealer),(b:supervisor)
WHERE a.userid = row.dealer_userid and b.userid = row.Supervisor_userid
CREATE (b)-[:supervises]->(a)
return a,b

LOAD csv with headers from "file:///session.csv" as row
CREATE (n:session)
SET n = row,
n.sessionid = tostring(row.sessionid),
n.gameid = tostring(row.gameid),
n.userid = tostring(row.userid)

MATCH (a:game),(b:session)
WHERE a.gameid = b.gameid
CREATE (a)-[:creats]->(b)			
return a,b

LOAD csv with headers from "file:///result.csv" as row
CREATE (n:result)
SET n = row,
n.sessionid = tostring(row.sessionid),
n.resultid = tostring(row.resultid),
n.buyin = tointeger(row.buyin),
n.cashout = tointeger(row.cashout),
n.difference = tointeger(row.difference)
return n

MATCH (a:session),(b:result)
WHERE a.sessionid=b.sessionid
CREATE (a)-[:will_determine]->(b)			
return a,b

MATCH (a:customer),(b:session)
WHERE a.userid = b.userid
CREATE (a)-[:playing_will_create]->(b)
return a,b

CREATE CONSTRAINT ON (a:customer) ASSERT a.userid IS UNIQUE
CREATE CONSTRAINT ON (a:employee) ASSERT a.userid IS UNIQUE
CREATE CONSTRAINT ON (a:dealer) ASSERT a.userid IS UNIQUE
CREATE CONSTRAINT ON (a:supervisor) ASSERT a.userid IS UNIQUE
CREATE CONSTRAINT ON (a:feedback) ASSERT a.caseid IS UNIQUE
CREATE CONSTRAINT ON (a:game) ASSERT a.gameid IS UNIQUE
CREATE CONSTRAINT ON (a:session) ASSERT a.sessionid IS UNIQUE
CREATE CONSTRAINT ON (a:result) ASSERT a.resultid IS UNIQUE



