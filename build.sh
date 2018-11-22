#!/bin/sh

message="Please input -t/-p for TEST/PROD environment."
target="exit"

for i in "$@"
do
case $i in
    -ts|--testServer)
        message="Delivered to TEST Server Side."
        target="ubuntu@54.202.180.164:/home/ubuntu/newTest/server"
        pem="/Users/ychen/innowells/pem/moacnodes101.pem"
    ;;
    -ps|--prodServer)
        message="Delivered to PROD"
        target="ubuntu@52.88.19.78:/home/ubuntu/server"
        pem="/Users/ychen/innowells/pem/moacpool.pem"
    ;;
    -c|--china)
        message="Delivered to China Modada Test."
        target="ubuntu@47.107.153.95:/home/ubuntu"
        pem="/Users/ychen/innowells/pem/moacgatewaycn.pem"
    ;;
    -cp|--chinaProd)
        message="Delivered to China Modada Prod."
        target="ubuntu@47.107.153.95:/home/ubuntu/prod"
        pem="/Users/ychen/innowells/pem/moacgatewaycn.pem"
    ;;
    -hkt|--hongkongtest)
        message="Delivered to China Modada Test."
        target="ubuntu@47.244.132.96:/home/ubuntu/test"
        pem="/Users/ychen/innowells/pem/moacgatewaycn.pem"
    ;;
    -hkp|--hongkongprod)
        message="Delivered to China Modada Prod."
        target="ubuntu@47.244.132.96:/home/ubuntu/prod"
        pem="/Users/ychen/innowells/pem/moacgatewaycn.pem"
    ;;
esac
done

if test ${target} != "exit"
then
    meteor build --architecture os.linux.x86_64  ../build/moacnodes_server
    scp -i ${pem} ../build/moacnodes_server/moacnodes_server.tar.gz ${target}
fi

echo ${message}