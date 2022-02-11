#!/bin/bash

folderName="Pipeline"
fileName="Piipeline-test.zip"
srcPath="/var/www/html"
dstnPath="/var/www/html/tc"
filePath="$srcPath/$fileName"
zipfileName1="Piipeline-test.zip"

zipfileName="tc.bkp.zip"
cd $srcPath

rm $zipfileName
zipCmd="zip -r $zipfileName tc/"
echo $zipCmd

$zipCmd


delete="rm -rf $dstnPath/*"
echo $delete
$delete
cpCmd="cp -r /var/lib/jenkins/pratik/$fileName $dstnPath/"
echo $cpCmd
$cpCmd

cd $dstnPath
unzip="unzip -o $fileName"
echo $unzip
$unzip

cpCmd="cp -r $dstnPath/index.html $srcPath/"
echo $cpCmd
$cpCmd

cd $dstnPath
rm $zipfileName1
