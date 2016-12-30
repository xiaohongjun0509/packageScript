#! /bin/sh

#shell脚本中，变量名和=之间不能有空格。这个所有的语言都是不一样的。
srcDir= '/Users/xhj/ios' 

destDir= '/Users/xhj/Desktop/apps'

cd destDir

rm -rf *.app

cd '/Users/xhj/Documents/mycode/LLDownloadManager'

xcodebuild clean

#获得函数的返回值。。注意，变量的赋值的形式。变量名的右边不能有空格。这是用来获得上一次函数的执行的结果。  只可能是0 或者 1 来进行表示。
ret= $?

if $ret 
	then
	echo 'xiaohongjun--->clean successful'
else
	echo 'xiaohongjun--->clean failed'	
fi

xcodebuild -project LLDownloadManager.xcodeproj -configuration Debug

ret= $?
if $ret 
	then
	echo 'xiaohongjun--->build successful'
else
	echo 'xiaohongjun--->build failed'	
fi

xcrun -sdk iphoneos -v PackageApplication ./build/Debug-iphoneos/LLDownloadManager.app -o ~/Desktop/apps/LLDownloadManager.ipa

ret= $?
if $ret 
	then
	echo 'xiaohongjun--->xcrun successful'
else
	echo 'xiaohongjun--->xcrun failed'	
fi

echo '打包完成'





