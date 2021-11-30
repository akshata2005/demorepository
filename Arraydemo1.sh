#!/bin/bash -x


IS_FULL_TIME=1;
IS_PART_TIME=2;
NUM_WORKING_DAYS_IN_MONTH=20;
EMP_RATE_PER_HR=20;

#VARIABLE
totalEmpHr=0;
totalWorkingDays=0;

function getWorkingHrs () {
      empCheck=$((RANDOM%3));
      case $empCheck in
         $IS_FULL_TIME)
               empHrs=8
               ;;
         $IS_PART_TIME)
               empHrs=4
               ;;
         *)
               empHrs=0;
               ;;
      esac
      echo $empHrs;
}


function getPerDaySalary () {
  
 echo $2;
   salaryPerDay=$(($1*20));
   echo $salaryPerDay;
}


while [[ $totalWorkingDays -lt $NUM_WORKING_DAYS_IN_MONTH ]]
do
      ((totalWorkingDays++))
      empHrs="$( getWorkingHrs $(()) )";
      perDaySalary="$( getPerDaySalary $((empHrs)))";
      totalEmpHr=$((totalEmpHr+empHrs));
      ArrayOfEmpPerDaySalary[$totalWorkingDays]=$perDaySalary;
done
      echo ${ArrayOfEmpPerDaySalary[@]};
      echo ${totalWorkingDays[*]};
      echo $totalEmpHr;
      salaryOfMonth=$((totalEmpHr*EMP_RATE_PER_HR));
