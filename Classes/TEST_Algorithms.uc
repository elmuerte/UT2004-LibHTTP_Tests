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

    s1 = "http://www.beyondunreal.com";
    s2 = "http://www.elmuerte.com";
    check(s1 != s2, "hash(http://www.beyondunreal.com) != hash(http://www.elmuerte.com)"$chr(3)$"d:\\dev\\ut2004\\ut2-code\\LibHTTP_Tests\\Classes\\TEST_Algorithms.uc"$"("$string(16)$")");

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


        check((s1 != s2) && (h1 != h2), "s1 != s2 && hash(s1) != hash(s2);"$chr(3)$"d:\\dev\\ut2004\\ut2-code\\LibHTTP_Tests\\Classes\\TEST_Algorithms.uc"$"("$string(34)$")");
    }


    s1 = "http://www.beyondunreal.com";
    s2 = "http://www.elmuerte.com";
    check(s1 != s2, "hash(http://www.beyondunreal.com) != hash(http://www.elmuerte.com)"$chr(3)$"d:\\dev\\ut2004\\ut2-code\\LibHTTP_Tests\\Classes\\TEST_Algorithms.uc"$"("$string(40)$")");

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


        check((s1 != s2) && (h1 != h2), "s1 != s2 && md5(s1) != md5(s2);"$chr(3)$"d:\\dev\\ut2004\\ut2-code\\LibHTTP_Tests\\Classes\\TEST_Algorithms.uc"$"("$string(58)$")");
    }


    Done();
}

defaultproperties
{
    TestName="LibHTTP Algrithm Tests"
    TestDescription="Tests all algorithms defined in the LibHTTP package"
}