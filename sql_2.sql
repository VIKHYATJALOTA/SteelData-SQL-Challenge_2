#1 
select player_name from players where salary > 100000;

#2
select team_name from teams t join
players p on p.team_id=t.team_id
where player_id=3;

#3
select team_name,count(*) as total_players from players p join 
teams t on p.team_id=t.team_id
group by p.team_id;

#4
select p.team_id,team_name,player_name as captain_name from players p join
teams t on p.team_id=t.team_id
where p.team_id=2 and captain_id=player_id;

#5
select player_name,team_name,role from players p join 
teams t on p.team_id=t.team_id
where p.team_id=1;

#6
with cte_1 as ( select match_id,winner_id,match_Date from matches)
select team_id,team_name,count(*) as wins from teams t left join
cte_1 c on c.winner_id = t.team_id
group by t.team_id
order by wins desc;

#7
select t.team_name,round(avg(salary),2) as AVG_USA_SALARY from players p join 
teams t on p.team_id=t.team_id
where country = 'USA'
group by t.team_name;

#8
with cte_1 as ( select match_id,winner_id,match_Date from matches)
select team_name,count(*) AS matches_win from teams t left join
cte_1 c on c.winner_id = t.team_id
group by t.team_id
order by matches_win desc limit 1;

#9
with cte_1 as (select p.team_id ,team_name,player_name,salary from teams t join
players p on p.team_id=t.team_id
where salary>100000)
select team_name,count(*) as no_of_players from cte_1 group by team_id;

#10
select match_date,score_team1,score_team2 from matches
where match_id=3;