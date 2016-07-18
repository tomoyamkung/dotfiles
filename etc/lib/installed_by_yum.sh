
function installed_by_yum() {
    yum list installed | grep $1 > /dev/null 2>&1
}
