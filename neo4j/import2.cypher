CREATE (n:customer{userid : 'c6',fullname: 'Pravakar Panta',email:'c6@gmail.com',dob:'10/10/1990',discpline_status:'first warning',membership:'bronze'})
CREATE (n:customer{userid : 'c7',fullname: 'Himal Chapagain',email:'c7@gmail.com',dob:'10/10/1991',discpline_status:'first warning',membership:'bronze'})
CREATE (n:customer{userid : 'c8',fullname: 'Hax Dai',email:'c8@gmail.com',dob:'10/10/1992',discpline_status:'first warning',membership:'bronze'})

CREATE (n:feedback {caseid : 'f6',content : 'satisfied' , rating : 3 , userid: "c6"})
CREATE (n:feedback {caseid : 'f7',content : 'satisfied' , rating : 2 , userid: "c8"})

CREATE (n:session{sessionid: 'ses10',gameid:'g4',userid:'c6',datetime:'2020-08-12 19:00:00'})
CREATE (n:session{sessionid: 'ses11',gameid:'g4',userid:'c7',datetime:'2020-09-12 19:00:00'})
CREATE (n:session{sessionid: 'ses12',gameid:'g4',userid:'c8',datetime:'2020-10-12 19:00:00'})

CREATE (n:result{sessionid: 'ses10',resultid:'r12',buyin:500,cashout:1000,difference:-500})
CREATE (n:result{sessionid: 'ses11',resultid:'r13',buyin:800,cashout:100,difference:700})
CREATE (n:result{sessionid: 'ses12',resultid:'r14',buyin:950,cashout:50,difference:900})

MATCH (a:customer),(b:feedback)
WHERE a.userid = 'c6' AND b.userid = 'c6'
CREATE (a)-[r:provides]->(b)
RETURN type(r)

MATCH (a:customer),(b:feedback)
WHERE a.userid = 'c8' AND b.userid = 'c8'
CREATE (a)-[r:provides]->(b)
RETURN type(r)

MATCH (a:customer),(b:session)
WHERE a.userid = 'c6' AND b.userid = 'c6'
CREATE (a)-[r:playing_will_create]->(b)
RETURN type(r)

MATCH (a:customer),(b:session)
WHERE a.userid = 'c7' AND b.userid = 'c7'
CREATE (a)-[r:playing_will_create]->(b)
RETURN type(r)

MATCH (a:customer),(b:session)
WHERE a.userid = 'c8' AND b.userid = 'c8'
CREATE (a)-[r:playing_will_create]->(b)
RETURN type(r)

MATCH (a:session),(b:result)
WHERE a.sessionid = 'ses10' AND b.sessionid = 'ses10'
CREATE (a)-[r:will_determine]->(b)
RETURN type(r)

MATCH (a:session),(b:result)
WHERE a.sessionid = 'ses11' AND b.sessionid = 'ses11'
CREATE (a)-[r:will_determine]->(b)
RETURN type(r)

MATCH (a:session),(b:result)
WHERE a.sessionid = 'ses12' AND b.sessionid = 'ses12'
CREATE (a)-[r:will_determine]->(b)
RETURN type(r)

MATCH (c:customer { userid: 'c1' }),(g:game { gameid: 'g1' })
MERGE (c)-[r:rates{score:3}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c1' }),(g:game { gameid: 'g2' })
MERGE (c)-[r:rates{score:4}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c1' }),(g:game { gameid: 'g3' })
MERGE (c)-[r:rates{score:5}]->(g)
RETURN c.fullname, type(r), r.score, g.gamename

MATCH (c:customer { userid: 'c1' }),(g:game { gameid: 'g4' })
MERGE (c)-[r:rates{score:2}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c2' }),(g:game { gameid: 'g1' })
MERGE (c)-[r:rates{score:4}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c2' }),(g:game { gameid: 'g2' })
MERGE (c)-[r:rates{score:3}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c2' }),(g:game { gameid: 'g3' })
MERGE (c)-[r:rates{score:4}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c2' }),(g:game { gameid: 'g4' })
MERGE (c)-[r:rates{score:5}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c3' }),(g:game { gameid: 'g1' })
MERGE (c)-[r:rates{score:2}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c3' }),(g:game { gameid: 'g2' })
MERGE (c)-[r:rates{score:3}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c3' }),(g:game { gameid: 'g3' })
MERGE (c)-[r:rates{score:2}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c3' }),(g:game { gameid: 'g4' })
MERGE (c)-[r:rates{score:3}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c4' }),(g:game { gameid: 'g1' })
MERGE (c)-[r:rates{score:4}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c4' }),(g:game { gameid: 'g2' })
MERGE (c)-[r:rates{score:5}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c4' }),(g:game { gameid: 'g3' })
MERGE (c)-[r:rates{score:3}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c4' }),(g:game { gameid: 'g4' })
MERGE (c)-[r:rates{score:5}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c5' }),(g:game { gameid: 'g1' })
MERGE (c)-[r:rates{score:4}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c5' }),(g:game { gameid: 'g2' })
MERGE (c)-[r:rates{score:5}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c5' }),(g:game { gameid: 'g3' })
MERGE (c)-[r:rates{score:3}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c5' }),(g:game { gameid: 'g4' })
MERGE (c)-[r:rates{score:5}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c6' }),(g:game { gameid: 'g1' })
MERGE (c)-[r:rates{score:5}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c6' }),(g:game { gameid: 'g2' })
MERGE (c)-[r:rates{score:4}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c6' }),(g:game { gameid: 'g3' })
MERGE (c)-[r:rates{score:5}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c6' }),(g:game { gameid: 'g4' })
MERGE (c)-[r:rates{score:5}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c7' }),(g:game { gameid: 'g1' })
MERGE (c)-[r:rates{score:4}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c7' }),(g:game { gameid: 'g2' })
MERGE (c)-[r:rates{score:3}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c7' }),(g:game { gameid: 'g3' })
MERGE (c)-[r:rates{score:4}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c7' }),(g:game { gameid: 'g4' })
MERGE (c)-[r:rates{score:5}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c8' }),(g:game { gameid: 'g1' })
MERGE (c)-[r:rates{score:3}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c8' }),(g:game { gameid: 'g2' })
MERGE (c)-[r:rates{score:4}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c8' }),(g:game { gameid: 'g3' })
MERGE (c)-[r:rates{score:3}]->(g)
RETURN c.fullname, type(r), g.gamename

MATCH (c:customer { userid: 'c8' }),(g:game { gameid: 'g4' })
MERGE (c)-[r:rates{score:4}]->(g)
RETURN c.fullname, type(r), g.gamename







