MATCH (a:feedback)
WHERE a.rating>=0 and a.rating<=3
RETURN count(a) as total_dissatisfied_rating

MATCH (b:customer)-[:provides]->(c:feedback) 
RETURN b.userid,b.membership,c.caseid,c.content,c.rating,b.fullname,b.email,b.dob,b.discipline_status

MATCH (c:customer)-[:playing_will_create]->(s:session),(s:session)-[:will_determine]->(r)
WHERE r.buyin>=1000 
RETURN c.userid as customer_id, c.fullname,c.email,c.dob ,c.discipline_status, count(c.userid) as number_of_times_bought_in_morethan_1000, count(c.userid)>=3 as is_patron_addicted





MATCH(c:customer)-[:playing_will_create]-()-[:will_determine]->(b:result)
RETURN c.userid,c.fullname,c.dob,c.email,sum(b.difference) as Total_business_made_from_Player

MATCH (c:customer)-[:playing_will_create]->(session)
RETURN c.fullname as FULL_NAME,COLLECT(session.sessionid) as LIST_OF_SESSIONS

MATCH (c:customer)-[:playing_will_create]->()-[:will_determine]-> (a:result)
WHERE a.difference>0
RETURN   c.fullname ,max(a.difference) as Biggest_Loss

MATCH (n:customer)
WHERE EXISTS (n.fullname)
RETURN n.fullname AS name, EXISTS ((n)-[:provides]->()) AS provided_Feedback

MATCH (c)-[:playing_will_create]-> (b)-[:will_determine]-> (a:result)
WHERE sign(a.difference) = -1
RETURN  b.userid,c.fullname,b.sessionid,a.difference

MATCH (a)
WHERE a.userid = 'c1'
RETURN distinct labels(a)

MATCH (n)-[r]->()
WHERE n.userid = 'c2'
RETURN distinct type(r)


MATCH (c1:customer {userid: 'c1'})-[rated:rates]->(game)
WITH c1, gds.alpha.similarity.asVector(game, rated.score) AS c1Vector
MATCH (c2:customer {userid: 'c2'})-[rated:rates]->(game)
WITH c1, c2, c1Vector, gds.alpha.similarity.asVector(game, rated.score) AS c2Vector
RETURN c1.fullname AS from,
       c2.fullname AS to,
       gds.alpha.similarity.pearson(c1Vector, c2Vector, {vectorType: "maps"}) AS similarity


MATCH (c:customer), (g:game)
OPTIONAL MATCH (c)-[rated:rates]->(g)
WITH {item:id(c), weights: collect(coalesce(rated.score, gds.util.NaN()))} AS userData
WITH collect(userData) AS data
CALL gds.alpha.similarity.pearson.stream({
 data: data,
 similarityCutoff: 1,
 topK: 0
})
YIELD item1, item2, count1, count2, similarity
RETURN gds.util.asNode(item1).fullname AS from, gds.util.asNode(item2).fullname AS to, similarity
ORDER BY similarity DESC
