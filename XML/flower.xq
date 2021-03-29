declare default element namespace "www.haxd.com/casino.html";
for $game in doc("my_xml")/casino/game let $id:="g1" where $game/gameid=$id return $game/session

declare default element namespace "www.haxd.com/casino.html";
for $game in doc("my_xml")/casino/game let $id:="d1" where $game/userid=$id return count ($game/session)

declare default element namespace "www.haxd.com/casino.html";
for $session in doc("my_xml")/casino/game/session let $uid:="c3" where $session/userid=$uid return $session

declare default element namespace "www.haxd.com/casino.html";
for $session in doc("my_xml")/casino/game/session let $uid:="c1" where $session/userid=$uid order by xs:dateTime($session/datetime) return $session

declare default element namespace "www.haxd.com/casino.html";
for $session in doc("my_xml")/casino/game/session let $uid:="c1" where $session/userid=$uid order by xs:string($session/sessionid) return $session
