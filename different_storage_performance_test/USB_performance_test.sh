#Author：Issac Lin
#Ext: 7536
#version:1.1
#different_storage_performance_test
#log_location:/data/ca7_PGandCG_stress.log
#

sd_stat=$1
usb_stat=$2
copy_num=$3
cpfile_size=$4
#USB to emmc
echo "////////////////////////////////"
echo "////////////////////////////////" >> different_storage_copy-compare_test.log
echo "start USB to emmc test|copy /storage/usbdisk1/CPFILE to /sdcard"
echo "start USB to emmc test|copy /storage/usbdisk1/CPFILE to /sdcard" >> different_storage_copy-compare_test.log
for i in $(seq $copy_num)
do
	if test -d /sdcard/CPFILE
	then
		rm -r /sdcard/CPFILE
		echo "delete /sdcard/CPFILE folder"
		echo "delete /sdcard/CPFILE folder" >> different_storage_copy-compare_test.log
	fi
	echo "%%% USB to emmc test : $i time %%%"
	echo "%%% USB to emmc test : $i time %%%" >> different_storage_copy-compare_test.log
	date
	date >> different_storage_copy-compare_test.log
	(time cp -rf /storage/usbdisk1/CPFILE /sdcard) 2>> different_storage_copy-compare_test.log

	if test $? -eq 0
	then
		echo "finish copy /storage/usbdisk1/CPFILE to /sdcard"
		echo "finish copy /storage/usbdisk1/CPFILE to /sdcard" >> different_storage_copy-compare_test.log
	else
		echo "error when copy /storage/usbdisk1/CPFILE to /sdcard"
		echo "error when copy /storage/usbdisk1/CPFILE to /sdcard" >> different_storage_copy-compare_test.log
	fi
	speed=`expr $(expr $size /* 1000) / $cp_time`
	let total+=speed
	echo "speed of $i time: $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s"
	echo "speed of $i time: $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s" >> different_storage_copy-compare_test.log
done
speed=`expr $speed / $copy_num`
echo "*** average speed : $speed ***"
echo "*** average speed : $speed ***" >> different_storage_copy-compare_test.log
date
date >> different_storage_copy-compare_test.log
echo "finish USB to emmc test"
echo "finish USB to emmc test" >> different_storage_copy-compare_test.log
#USB to SD
echo "////////////////////////////////"
echo "////////////////////////////////" >> different_storage_copy-compare_test.log
if test sd_stat -eq 1
then
	echo "start USB to SD test|copy /storage/usbdisk1/CPFILE to /storage/extsdcard/CPFILE"
	echo "start USB to SD test|copy /storage/usbdisk1/CPFILE to /storage/extsdcard/CPFILE" >> different_storage_copy-compare_test.log
	for i in $(seq $copy_num)
	do
		if test -d /storage/extsdcard/CPFILE
		then 
			rm -r /storage/extsdcard/CPFILE
			echo "delete /storage/extsdcard/CPFILE"
			echo "delete /storage/extsdcard/CPFILE" >> different_storage_copy-compare_test.log
		fi
		echo "%%% USB to emmc test : $i time %%%"
		echo "%%% USB to emmc test : $i time %%%" >> different_storage_copy-compare_test.log
		date
		date >> different_storage_copy-compare_test.log
		(time cp -rf /storage/usbdisk1/CPFILE /storage/extsdcard) 2>> different_storage_copy-compare_test.log

		if test $? -eq 0
		then
			echo "finish copy /storage/usbdisk1/CPFILE to /storage/extsdcard"
			echo "finish copy /storage/usbdisk1/CPFILE to /storage/extsdcard" >> different_storage_copy-compare_test.log
		else
			echo "error when copy /storage/usbdisk1/CPFILE to /storage/extsdcard"
			echo "error when copy /storage/usbdisk1/CPFILE to /storage/extsdcard" >> different_storage_copy-compare_test.log
		fi
		speed=`expr $(expr $size /* 1000) / $cp_time`
		let total+=speed
		echo "speed of $i time: $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s"
		echo "speed of $i time: $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s" >> different_storage_copy-compare_test.log
	done
	speed=`expr $speed / $copy_num`
	echo "*** average speed : $speed ***"
	echo "*** average speed : $speed ***" >> different_storage_copy-compare_test.log
	date
	date >> different_storage_copy-compare_test.log
	echo "finish USB to SD test"
	echo "finish USB to SD test" >> different_storage_copy-compare_test.log
else 
	echo "skip USB to SD test"
	echo "skip USB to SD test" >> different_storage_copy-compare_test.log
fi
#USB to USB
echo "////////////////////////////////"
echo "////////////////////////////////" >> different_storage_copy-compare_test.log
echo "start USB to USB test|copy /storage/extsdcard/CPFILE folder to /storage/usbdisk1/CPTEMP"
echo "start USB to USB test|copy /storage/extsdcard/CPFILE folder to /storage/usbdisk1/CPTEMP" >> different_storage_copy-compare_test.log
for i in $(seq $copy_num)
do
	if test -d /storage/usbdisk1/CPTEMP
	then 
		rm -r /storage/usbdisk1/CPTEMP
		echo "delete /storage/usbdisk1/CPTEMP"
		echo "delete /storage/usbdisk1/CPTEMP" >> different_storage_copy-compare_test.log
	fi
	echo "%%% USB to emmc test : $i time %%%"
	echo "%%% USB to emmc test : $i time %%%" >> different_storage_copy-compare_test.log
	date
	date >> different_storage_copy-compare_test.log
	(time cp -rf /storage/usbdisk1/CPFILE /storage/usbdisk1/CPTEMP) 2>> different_storage_copy-compare_test.log

	if test $? -eq 0
	then
		echo "finish copy /storage/usbdisk1/CPFILE to /storage/usbdisk1/CPTEMP"
		echo "finish copy /storage/usbdisk1/CPFILE to /storage/usbdisk1/CPTEMP" >> different_storage_copy-compare_test.log
	else
		echo "error when copy /storage/usbdisk1/CPFILE to /storage/usbdisk1/CPTEMP"
		echo "error when copy /storage/usbdisk1/CPFILE to /storage/usbdisk1/CPTEMP" >> different_storage_copy-compare_test.log
	fi
	speed=`expr $(expr $size /* 1000) / $cp_time`
	let total+=speed
	echo "speed of $i time: $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s"
	echo "speed of $i time: $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s" >> different_storage_copy-compare_test.log
done
speed=`expr $speed / $copy_num`
echo "*** average speed : $speed ***"
echo "*** average speed : $speed ***" >> different_storage_copy-compare_test.log
date
date >> different_storage_copy-compare_test.log
echo "finish USB to USB test"
echo "finish USB to USB test" >> different_storage_copy-compare_test.log