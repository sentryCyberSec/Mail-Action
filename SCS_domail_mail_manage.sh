#!/bin/bash
source ./htmlTemp_Demo.sh

function _Generate_Users_StrongPassword_Algorithm(){
	local i tmp size max rand
	# $RANDOM % (i+1) is biased because of the limited range of $RANDOM
	# Compensate by using a range which is a multiple of the array size.
	Pass_Sting_Array=('b' 'i' 'n' 'a' 'x' 'n' '$' '@' '%' '#' '3' '2' '4' '5' 'B' 'I' 'N' 'A' 'X' 'N')
	size=${#Pass_Sting_Array[*]}
	max=$(( 32768 / size * size ))
	for ((i=size-1; i>0; i--)); do
		while (( (rand=$RANDOM) >= max )); do :; done
		rand=$(( rand % (i+1) ))
		tmp=${Pass_Sting_Array[i]} Pass_Sting_Array[i]=${Pass_Sting_Array[rand]} Pass_Sting_Array[rand]=$tmp
	done
}

function _Domain_MainAccess_Manage_ByAdmin(){
	_Pass_From_GUSP_Algo=$(printf "%s" "${Pass_Sting_Array[@]}")

#	try to access main list.
# 	MAIL_List_result=$(curl -H "PddToken: ${Define_PDD_Token}" \
# 	-H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:93.0) Gecko/20100101 Firefox/93.0
# Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8" \
# 	"$Aceess_EmailList_Manage_API/list?domain=$Access_Domain")

#	add user.
	ADD_MAIL_List_Request=$(curl -H "PddToken: ${Define_PDD_Token}" \
	-H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:93.0) Gecko/20100101 Firefox/93.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8" \
	-d "domain=$Access_Domain&login=$Define_Mail_UsernameNosuffix&password=$_Pass_From_GUSP_Algo" \
	"$Aceess_EmailList_Manage_API/add" \
	)
}

function  _SCSMAIN_Domain_Mail_Manage_Logic(){
	_Generate_Users_StrongPassword_Algorithm
	_Domain_MainAccess_Manage_ByAdmin
	echo -e "$EmailhtmlTempStart$Define_Mail_FullUsername\n密码为:\n $_Pass_From_GUSP_Algo\n$EmailhtmlTempEnd\n" > result.html
}

# Set gobal var here. Visit https://yandex.com/dev/domain/doc/reference/email-add.html to access api.
Aceess_EmailList_Manage_API="https://pddimp.yandex.ru/api2/admin/email"
Access_Domain="sentrylab.cn" #yournickname@yourdomain.com -> Access_Domain="yourdomain.com"

# in action command is: bash SCS_domail_mail_manage.sh ${{ secrets.SENTRY_MAIL_PDDTOKEN }}
Define_PDD_Token=$1
Define_Mail_UsernameNosuffix=$2
Define_Mail_FullUsername="$Define_Mail_UsernameNosuffix@$Access_Domain"

_SCSMAIN_Domain_Mail_Manage_Logic