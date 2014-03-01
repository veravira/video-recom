a = LOAD 'sample.json' USING JsonLoader('reels:{(symbol:chararray, yoffset:int)}');
-- use the following for example 
-- {"reels":[{"symbol":"Blank","yoffset":-1100},{"symbol":"Single bar","yoffset":-2200},{"symbol":"Blank","yoffset":-1900}]}
-- 
DESCRIBE a;
DUMP a;