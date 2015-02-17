#!/bin/bash
find . | sed -E 's/^[.]\/?//' | perl -ne '
chomp; 
$dir= $_; 
$file=$_; 
$file =~ s/^.*[\/]//; 
$file_asc = $file;
$dir =~ s/[\/].*//; 
$dir =~ s/([^A-Za-z0-9])/sprintf("%%%02X", ord($1))/seg; 
$file =~ s/([^A-Za-z0-9])/sprintf("%%%02X", ord($1))/seg; 
print("<li><a href=\"$dir/$file\">$file_asc</a></li>\n");
' > photos.html
