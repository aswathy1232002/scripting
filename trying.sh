#!/bin/bash
alert="\033[1;36m"
success="\033[1;32m"
warning="\033[1;33m"
error="\033[1;31m"
purple="\033[0;35m"
nocolour="\033[00m"

os=$(uname -o)
hostname=$(hostname)
ip=$(ifconfig | awk '/inet .*broadcast/{print $2}')
public_ip=$(curl -s icanhazip.com)
ram=$(free -h | awk '/Mem:/ {print $2}')
storage=$(df -h | awk '/\/$/ {print $2}')
used=$(df -h | awk '/\/$/ {print $3}')
available=$(df -h | awk '/\/$/ {print $4}')

echo "<html>
<head>
<title>System Information</title>
<style>
    table {
        font-family: Arial, sans-serif;
        border-collapse: collapse;
        width: 60%;
        margin: auto;
        margin-top: 20px;
    }
    th, td {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }
    th {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>
<h1>${warning}SYSTEM RESOURCES${nocolour}</h1>
<hr>
<table>
    <tr>
        <th>Item</th>
        <th>Value</th>
    </tr>
    <tr>
        <td>${purple}OS name${nocolour}</td>
        <td>$os</td>
    </tr>
    <tr>
        <td>${purple}Hostname${nocolour}</td>
        <td>$hostname</td>
    </tr>
    <tr>
        <td>${purple}Public IP address${nocolour}</td>
        <td>$public_ip</td>
    </tr>
    <tr>
        <td>${purple}Private IP address${nocolour}</td>
        <td>$ip</td>
    </tr>
    <tr>
        <td>${purple}System RAM${nocolour}</td>
        <td>$ram</td>
    </tr>
    <tr>
        <td>${purple}System storage${nocolour}</td>
        <td>$storage</td>
    </tr>
    <tr>
        <td>${purple}Used storage${nocolour}</td>
        <td>$used</td>
    </tr>
    <tr>
        <td>${purple}Available storage${nocolour}</td>
        <td>$available</td>
    </tr>
</table>
</body>
</html>"
