Short insructions for Users:
---------------------------

 1. Download & Install Java-8, Maven

 2. $ mvn clean package
    $ cd target
    $ java -XX:+UseSerialGC -server -XX:CompileThreshold=2 -jar CardRaytracerMt-1.0.jar 4 G_RATIO AD 2048 out.png

 3. Look at the ./out folder


