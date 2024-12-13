
select *
from election_results.constituencywise_details;



select *
from election_results.constituencywise_results;



select *
from election_results.partywise_results;


select *
from election_results.states;



select *
from election_results.statewise_results;



-- First we need to calculate the total seats 


select 
distinct count(`Parliament Constituency`) as total_seats 
from election_results.constituencywise_results;


-- total number of seats available  for elections in each state 


select 
distinct count(cr.`Parliament Constituency`) as total_seats ,
s.state as state_name
from election_results.constituencywise_results as  cr 
inner join election_results.statewise_results as sr  
on  cr.`Parliament Constituency`= sr.`Parliament Constituency`
inner join election_results.states as s
on sr.`State ID` = s.`State ID`
group by 2;




-- Total seats won by NDA  Alliance 




SELECT 
    SUM(
        CASE 
            WHEN party IN (
                'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
                'Janata Dal (United) - JD(U)', 
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP', 
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
                'Janata Dal (Secular) - JD(S)', 
                'Lok Janshakti Party (Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP', 
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
            ) 
            THEN Won
            ELSE 0 
        END
    ) AS NDA_Total_Seats_Won

from election_results.partywise_results;




-- seats won by NDA Alliance parites 

select 
party as party_name ,
won as Won_seats 
from election_results.partywise_results
where 
party IN (
                'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
                'Janata Dal (United) - JD(U)', 
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP', 
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
                'Janata Dal (Secular) - JD(S)', 
                'Lok Janshakti Party (Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP', 
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
            ) 
            order by 2 desc ;
            
            
            
            
-- Total seats won by india Alliance 



SELECT 
party,
won
FROM election_results.partywise_results
where party in(
        'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK')
order by won desc;






SELECT 
SUM( CASE
	    WHEN  party IN (
        'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK')
        THEN won
        ELSE 0
        END) AS indea_total_seats_won
        
FROM election_results.partywise_results;




-- Add new column field  in the table party wise _results to get paty allianz as nda ,INDIA and other 


select 
* 
from election_results.partywise_results;


alter table election_results.partywise_results
add party_alliance  varchar(50);



 update election_results.partywise_results
 set party_alliance = 'I.N.D.I.A'
WHERE party IN (
    'Indian National Congress - INC',
    'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Bharat Adivasi Party - BHRTADVSIP',
    'Communist Party of India  (Marxist) - CPI(M)',
    'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',	
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Rashtriya Loktantrik Party - RLTP',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK'
);

 SET SQL_SAFE_UPDATES = 0; 





update election_results.partywise_results
 set party_alliance = 'NDA'
WHERE party IN (
    'Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal  (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal  (Secular) - JD(S)',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM'
);




update election_results.partywise_results
set party_alliance ='other'
where party_alliance is null;



select 
party_alliance ,
sum(won)
from election_results.partywise_results
group by 1;







-- winning candidate's name ,their party name , total votes and margin of the victory for specific state and constituency 


select 
cr.`Winning Candidate`,
cr.`Total Votes`,
cr.Margin,
cr.`Constituency Name`,
pr.Party,
s.State
from election_results.constituencywise_results as cr
inner join election_results.partywise_results as pr
on cr.`Party ID` = pr. `Party ID`


inner join election_results.statewise_results as sr 
on cr.`Parliament Constituency` = sr. `Parliament Constituency`


inner join election_results.states as s 
on sr.`State ID`= s.`State ID`


where cr.`Constituency Name`= 'AGRA';





-- What is the distrebution of EVM votes versus postal votes for candidates in a specific constituency 



select 
cd. `EVM Votes`,
cd.`Postal Votes`,
cd.`Total Votes`,
cd.`Candidate`,
cr.`Constituency Name`
from election_results.constituencywise_results as cr 
join election_results.constituencywise_details as cd 
on cd.`Constituency ID`= cr.`Constituency ID`

 where cr.`Constituency Name`= 'AMROHA';






-- which parties won the most seats in a state , and how many seats did each party win 


SELECT 
    p.`party`, 
    COUNT(cr.`Constituency ID`) AS seats_won
FROM 
    election_results.constituencywise_results AS cr
JOIN 
    election_results.partywise_results AS p 
    ON cr.`Party ID` = p.`Party ID`
JOIN 
    election_results.statewise_results AS sr 
    ON cr.`Parliament Constituency` = sr.`Parliament Constituency`
JOIN 
    election_results.states AS s 
    ON sr.`State ID` = s.`State ID`
WHERE 
    s.`State` = 'Andhra Pradesh'
GROUP BY 
    p.`party`
ORDER BY 
    seats_won DESC;




-- what is the total number of seats won by each party alliance (NDA,INDIA and other ) in each state for the india election 



SELECT 
    s.`state`,
    pr.`party_alliance`
FROM 
    election_results.constituencywise_results AS cr
JOIN 
    election_results.partywise_results AS pr
    ON cr.`Party ID` = pr.`Party ID`
JOIN 
    election_results.statewise_results AS sr 
    ON cr.`Parliament Constituency` = sr.`Parliament Constituency`
JOIN 
    election_results.states AS s 
    ON sr.`State ID` = s.`State ID`
WHERE 
    s.`State` = 'Andhra Pradesh';
    
    
    
    
    
    SELECT 
    s.`state`,
   sum(case when pr.`party_alliance` = 'NDA' then 1 else 0 end )as NDA_SEATS_WON,
   sum( case when pr.`party_alliance` = 'I.N.D.I.A' then 1 else 0 end ) as india_seats_won,
   sum(case when pr.`party_alliance` = 'other' then 1 else 0 end )as other_won_seats 
FROM 
    election_results.constituencywise_results AS cr
JOIN 
    election_results.partywise_results AS pr
    ON cr.`Party ID` = pr.`Party ID`
JOIN 
    election_results.statewise_results AS sr 
    ON cr.`Parliament Constituency` = sr.`Parliament Constituency`
JOIN 
    election_results.states AS s 
    ON sr.`State ID` = s.`State ID`
    group by s.`State`;
    
    
    
    
    -- which candidate recived the hightest number of EVM votes in each constituency 
    
    
    
    
    
   SELECT 
    cd.`Candidate`, 
    cd.`EVM Votes`, 
    cd.`Constituency ID`, 
    cr.`Constituency Name`
FROM 
    election_results.constituencywise_details AS cd
INNER JOIN 
    election_results.constituencywise_results AS cr 
    ON cr.`Constituency ID` = cd.`Constituency ID`
WHERE 
    cd.`EVM Votes` = (
        SELECT 
            MAX(`EVM Votes`) 
        FROM 
            election_results.constituencywise_details
    )
ORDER BY 
    cd.`EVM Votes` DESC
LIMIT 10;
   
   
   
   
   
   -- Which candidate won and which candidate was the runner-up in each constituency of State for the 2024 elections?


WITH Ranked_Candidates AS (
    SELECT 
        cd.`Constituency ID`,
        cd.`Candidate`,
        cd.`Party`,
        cd.`EVM Votes`,
        cd.`Postal Votes`,
        cd.`EVM Votes` + cd.`Postal Votes` AS Total_Votes,
        ROW_NUMBER() OVER (PARTITION BY cd.`Constituency ID` ORDER BY cd.`EVM Votes` + cd.`Postal Votes` DESC) AS VoteRank
    FROM election_results.constituencywise_details AS cd
    JOIN election_results.constituencywise_results AS cr 
        ON cr.`Constituency ID` = cd.`Constituency ID`
    JOIN election_results.statewise_results AS sr 
        ON cr.`Parliament Constituency` = sr.`Parliament Constituency`
    JOIN election_results.states AS s 
        ON s.`State ID` = sr.`State ID`
    WHERE s.State = 'Maharashtra'
)


SELECT * 
FROM Rankedcandidate;
        
        select 
        cr.`Constituency Name`,
        max(case when rc.VoteRank= 1 then rc.candidate END) as winnig_Candidate ,
        max(case when rc.VoteRank= 2 then rc.candidate END) as Runnerup_candidate 
        from 
        Rankedcandidate as rc  ;
        
   
   
   
   
   
