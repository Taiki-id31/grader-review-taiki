CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission
if [[ -f ListExamples.java ]]
then
    echo "ListExamples found"
else 
    echo "ListExamples not found"
    exit 1
fi
mkdir lib
cp ../lib/hamcrest-core-1.3.jar ./lib/
cp ../lib/junit-4.13.2.jar ./lib/
cp ../TestListExamples.java ./

javac ListExamples.java

javac -cp $CPATH  TestListExamples.java 

if [[ $? -ne 0 ]]
then 
    echo "compiler error"
fi 

java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples

