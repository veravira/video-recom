HW
======
## Instructions ##
Clone the repository:
``` 	git clone https://github.com/veravira/video-recom.git ```

Build the jar
```	mvn clean compile assembly:single ```
```	mvn clean package ```

``` pig -x local -f normalize.pig -param filename=comedy_c.csv ```

### To Predict Prices ###

