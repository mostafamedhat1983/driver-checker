touch driver-checker.sh

chmod +x driver-checker.sh

mv driver-checker.sh /bin

contents of file driver-checker.sh

#!/bin/bash

check() {
     name=$1
     age=$2
     vision_rate=$3
     
    if [[ $age -ge 18 && $vision_rate -ge 4 ]]; then
        result="eligible"
    else
        result="not eligible"
    fi

    echo "$name:$age:$vision_rate:$result" >> /var/log/driver-checker.log
    echo "You are $result for a driver's license."
}


get_result() {
     name=$1
     result=$(grep "^$name:" /var/log/driver-checker.log | tail -n 1 | cut -d':' -f4)
    if [[ -z $result ]]; then
        echo "No result found for $name."
    else
        echo "$name:$result"
    fi
}

list_results() {
    awk -F':' '{print $1":"$4}' /var/log/driver-checker.log
}


case $1 in
    new)
        echo "Enter your name"
        read name
        echo "Enter your age" 
read age
        echo "Enter your vision rate (1-6): " 
read vision_rate
        check "$name" "$age" "$vision_rate"
        ;;
    get)
        echo "Enter the name of the user:"
read name 
        get_result "$name"
        ;;
    list)
        list_results
        ;;
    *)
        echo "please enter new OR get OR list"
        exit 1
        ;;
esac








