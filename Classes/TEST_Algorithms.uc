// NOTICE: This file was automatically generated by UCPP; do not edit this file manualy.
// UCPP Version 1.4; http://wiki.beyondunreal.com/wiki/UCPP
// #pragma ucpp include ../../UsUnit/macros.inc
class TEST_Algorithms extends TestCase;

// #define TEST_PERFORMANCE 1

function run()
{
    local string s1, s2, s3, s4;
    local int i, h1, h2;
    // #if TEST_PERFORMANCE
    local float timing;
    // #endif
    local HttpUtil.xURL URLstruct;

    // simple hash algorithm testing

    s1 = "http://www.beyondunreal.com";
    s2 = "http://www.elmuerte.com";
    h1 = class'HttpCache'.static.createHash(s1);
    h2 = class'HttpCache'.static.createHash(s2);
    check((s1 != s2) && (h1 != h2), "hash(http://www.beyondunreal.com) != hash(http://www.elmuerte.com)"$chr(3)$"d:\\dev\\ut2004\\ut2-code\\LibHTTP_Tests\\Classes\\TEST_Algorithms.uc"$"("$string(23)$")");

    for (i = 0; i < 10; i++)
    {
        s1 = class'HttpSock'.static.randString(16+rand(128));
        s2 = class'HttpSock'.static.randString(16+rand(128));

        // #if TEST_PERFORMANCE
        Clock(timing);
        // #endif
        h1 = class'HttpCache'.static.createHash(s1);
        // #if TEST_PERFORMANCE
        UnClock(timing);
        log("createHash "$string(timing*1000)$"ms "$string(timing*1000/len(s1))$"ms/char");
        // #endif
        h2 = class'HttpCache'.static.createHash(s2);


        check((s1 != s2) && (h1 != h2), "s1 != s2 && hash(s1) != hash(s2);"$chr(3)$"d:\\dev\\ut2004\\ut2-code\\LibHTTP_Tests\\Classes\\TEST_Algorithms.uc"$"("$string(41)$")");
    }

    // md5 checksum testing

    s1 = "http://www.beyondunreal.com";
    s2 = "http://www.elmuerte.com";
    s3 = class'HttpUtil'.static.MD5String(s1);
    s4 = class'HttpUtil'.static.MD5String(s2);
    check((s1 != s2) && (h1 != h2), "hash(http://www.beyondunreal.com) != hash(http://www.elmuerte.com)"$chr(3)$"d:\\dev\\ut2004\\ut2-code\\LibHTTP_Tests\\Classes\\TEST_Algorithms.uc"$"("$string(50)$")");

    check(class'HttpUtil'.static.MD5String("") == "d41d8cd98f00b204e9800998ecf8427e", "md5(\"\") == d41d8cd98f00b204e9800998ecf8427e"$chr(3)$"d:\\dev\\ut2004\\ut2-code\\LibHTTP_Tests\\Classes\\TEST_Algorithms.uc"$"("$string(52)$")");
    check(class'HttpUtil'.static.MD5String("testestest") == "01b03dbf1fa5a4c56066f27b0fc95efb", "md5(\"testestest\") == 01b03dbf1fa5a4c56066f27b0fc95efb"$chr(3)$"d:\\dev\\ut2004\\ut2-code\\LibHTTP_Tests\\Classes\\TEST_Algorithms.uc"$"("$string(53)$")");

    for (i = 0; i < 10; i++)
    {
        s1 = class'HttpSock'.static.randString(16+rand(128));
        s2 = class'HttpSock'.static.randString(16+rand(128));

        // #if TEST_PERFORMANCE
        Clock(timing);
        // #endif
        s3 = class'HttpUtil'.static.MD5String(s1);
        // #if TEST_PERFORMANCE
        UnClock(timing);
        log("MD5String "$string(timing*1000)$"ms "$string(timing*1000/len(s1))$"ms/char");
        // #endif
        s4 = class'HttpUtil'.static.MD5String(s2);


        check((s1 != s2) && (s3 != s4), "s1 != s2 && md5(s1) != md5(s2);"$chr(3)$"d:\\dev\\ut2004\\ut2-code\\LibHTTP_Tests\\Classes\\TEST_Algorithms.uc"$"("$string(71)$")");
    }

    // base64 testing


    // URL parsing testing
    check(class'HttpUtil'.static.parseURL("protocol://username:password@hostname/location?query#hash", URLstruct), "Valid URL parsing: protocol://username:password@hostname/location?query#hash"$chr(3)$"d:\\dev\\ut2004\\ut2-code\\LibHTTP_Tests\\Classes\\TEST_Algorithms.uc"$"("$string(78)$")");
    check(URLstruct.protocol == "protocol", "URLstruct.protocol == \"protocol\""$chr(3)$"d:\\dev\\ut2004\\ut2-code\\LibHTTP_Tests\\Classes\\TEST_Algorithms.uc"$"("$string(79)$")");
    check(URLstruct.username == "username", "URLstruct.username == \"username\""$chr(3)$"d:\\dev\\ut2004\\ut2-code\\LibHTTP_Tests\\Classes\\TEST_Algorithms.uc"$"("$string(80)$")");
    check(URLstruct.password == "password", "URLstruct.password == \"password\""$chr(3)$"d:\\dev\\ut2004\\ut2-code\\LibHTTP_Tests\\Classes\\TEST_Algorithms.uc"$"("$string(81)$")");
    check(URLstruct.hostname == "hostname", "URLstruct.hostname == \"hostname\""$chr(3)$"d:\\dev\\ut2004\\ut2-code\\LibHTTP_Tests\\Classes\\TEST_Algorithms.uc"$"("$string(82)$")");
    check(URLstruct.location == "/location", "URLstruct.location == \"/location\""$chr(3)$"d:\\dev\\ut2004\\ut2-code\\LibHTTP_Tests\\Classes\\TEST_Algorithms.uc"$"("$string(83)$")");
    check(URLstruct.query == "query", "URLstruct.query == \"query\""$chr(3)$"d:\\dev\\ut2004\\ut2-code\\LibHTTP_Tests\\Classes\\TEST_Algorithms.uc"$"("$string(84)$")");
    check(URLstruct.hash == "hash", "URLstruct.hash == \"hash\""$chr(3)$"d:\\dev\\ut2004\\ut2-code\\LibHTTP_Tests\\Classes\\TEST_Algorithms.uc"$"("$string(85)$")");
    check(!class'HttpUtil'.static.parseURL("protocol:///location?query#hash", URLstruct), "Invalid URL parsing: protocol:///location?query#hash"$chr(3)$"d:\\dev\\ut2004\\ut2-code\\LibHTTP_Tests\\Classes\\TEST_Algorithms.uc"$"("$string(86)$")");
    check(!class'HttpUtil'.static.parseURL("://hostname/location?query#hash", URLstruct), "Invalid URL parsing: ://hostname/location?query#hash"$chr(3)$"d:\\dev\\ut2004\\ut2-code\\LibHTTP_Tests\\Classes\\TEST_Algorithms.uc"$"("$string(87)$")");
    check(!class'HttpUtil'.static.parseURL("protocol://", URLstruct), "Invalid URL parsing: protocol://"$chr(3)$"d:\\dev\\ut2004\\ut2-code\\LibHTTP_Tests\\Classes\\TEST_Algorithms.uc"$"("$string(88)$")");

    Done();
}

defaultproperties
{
    TestName="LibHTTP Algrithm Tests"
    TestDescription="Tests all algorithms defined in the LibHTTP package"
}