# option to delete BBB-REST-API
echo "remove BBB-REST-API [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        echo "removing bbb-py-rest dir"
        cd "/home/$user"
        pwd
        
else
        echo "nothing to delete"
fi