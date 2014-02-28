-- this script is an exilirily script to combine the data results from (pricePredictor.pig) and join it to the initail set
-- To Run the script
-- pig -x local -f best_pair.pig -param filename=cc.csv


data = load '$filename' using PigStorage('\t') as (first:chararray, second:chararray, pref:chararray);
data1 = foreach data generate *;

join_dd = join data by $0, data1 by $1;

--some = limit join_dd 10;

join_d = distinct join_dd;
dups = filter join_d by ($0==$4 AND $1==$3 AND $2!= $5);
no_dups = filter join_d by NOT ($0==$4 AND $1==$3 AND $2!= $5);
--store dups into 'dups';
store no_dups into 'no_dups';
D = foreach join_d generate $0, $1, $4, $2, $5;
--store D into 'join_d';
/**
0				1				2				3		4

Ajvqy_L3C8     KPP5NbjW9eI     aAjvqy_L3C8     left    right
aAjvqy_L3C8     KPP5NbjW9eI     aAjvqy_L3C8     left    left
aAjvqy_L3C8     KPP5NbjW9eI     aAjvqy_L3C8     left    right
aAjvqy_L3C8     KPP5NbjW9eI     aAjvqy_L3C8     left    right
aAjvqy_L3C8     KPP5NbjW9eI     aAjvqy_L3C8     left    left
aAjvqy_L3C8     KPP5NbjW9eI     aAjvqy_L3C8     left    left
aAjvqy_L3C8     Uomk60wP2mI     aAjvqy_L3C8     left    right
aAjvqy_L3C8     Uomk60wP2mI     aAjvqy_L3C8     left    left
aAjvqy_L3C8     Uomk60wP2mI     aAjvqy_L3C8     left    right
aAjvqy_L3C8     Uomk60wP2mI     aAjvqy_L3C8     left    right
eqs = filter D by ($3==$4);
split eqs into tl if ($3=='left'),  tr if ($4=='right');
**/

eqs = filter D by ($3==$4);
eq_d = distinct eqs;
split eq_d into tl if ($3=='left'),  tr if ($4=='right');

--store eq_d into 'eq';
--store tl into 'tl';
--store tr into 'tr';

--D_transitive = filter D by ($2==$4);
--store D_transitive into 'D_trasitive';
-- http://gdata.youtube.com/feeds/api/videos/9ZVwJfkM0Eg?v=2&alt=json

-- "title":{"$t":"Cyanide & Happiness - I Did It"}


-- http://stackoverflow.com/questions/17626992/php-youtube-video-download

/**
YouTubeQuery query = new YouTubeQuery(new URL("http://gdata.youtube.com/feeds/api/videos"));
// order results by the number of views (most viewed first)
query.setOrderBy(YouTubeQuery.OrderBy.VIEW_COUNT);

// search for puppies and include restricted content in the search results
query.setFullTextQuery("puppy");
query.setSafeSearch(YouTubeQuery.SafeSearch.NONE);

VideoFeed videoFeed = service.query(query, VideoFeed.class);


-- 

for(VideoEntry videoEntry : videoFeed.getEntries() ) {
     YouTubeMediaGroup mediaGroup = videoEntry.getMediaGroup();
     mediaGroup.getVideoId(); // the video ID
}
**/
--dump some;

/**
(u_-U9PBiA8c,#NAME?,right,#NAME?,9ZVwJfkM0Eg,right)
(u_-U9PBiA8c,#NAME?,right,#NAME?,DvnbnwSouf4,right)
(u_-U9PBiA8c,#NAME?,right,#NAME?,UYwpN-vtPd4,left)
(u_-U9PBiA8c,#NAME?,right,#NAME?,_ZrEWwbjMK4,left)
(u_-U9PBiA8c,#NAME?,right,#NAME?,cS9Bvw0L7VE,right)
(u_-U9PBiA8c,#NAME?,right,#NAME?,fYWRkTbduSo,right)
(u_-U9PBiA8c,#NAME?,right,#NAME?,u2D8i8bGC2o,left)
(u_-U9PBiA8c,#NAME?,right,#NAME?,xFP4CD9vgJs,left)
(u_-U9PBiA8c,#NAME?,right,#NAME?,xzOzixdZEO8,right)
(u_-U9PBiA8c,#NAME?,right,#NAME?,yYGn4PDEob8,left)
**/