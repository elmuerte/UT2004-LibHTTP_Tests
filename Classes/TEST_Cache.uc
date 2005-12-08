// NOTICE: This file was automatically generated by UCPP; do not edit this file manualy.
// UCPP Version 1.6; http://wiki.beyondunreal.com/wiki/UCPP
// #pragma ucpp include ../../UsUnit/macros.inc
class TEST_Cache extends TEST_BaseRequest;

var HttpCache htcache;

function setUp()
{
    htcache = spawn(class'HttpCache');
    htcache.OnComplete = CacheDownloadComplete;
    htcache.OnCreateSock = SocketCreated;
    idx = -1;
}

function tearDown()
{
    htcache.Destroy();
    htcache = none;
}

function Run()
{
    idx++;
    if (idx == 3)
    {
        Done();
        return;
    }
    htcache.get(GetUrl(idx));
}

function SocketCreated(HttpCache Sender, HttpSock Socket)
{
    Socket.iVerbose = class'HttpUtil'.default.LOGDATA;
}

function CacheDownloadComplete(HttpCache Sender, HttpCacheObject Data, HttpCache.EDataOrigin origin)
{
    local FileLog f;
    local int i;
    local bool bFoundToken;

    bFoundToken = false;

    f = spawn(class'FileLog');
    f.OpenLog(string(class)$"-"$idx$"_"$string(Sender.Tag), "html", true);
    f.logf("<!-- ");
    f.logf("Origin:"@GetEnum(enum'EDataOrigin', origin));
    f.logf("URL:"@Data.URL);
    f.logf("LastModification:"@Data.LastModification);
    f.logf("ExpiresOn:"@Data.ExpiresOn);
    f.logf("-->");
    for (i = 0; i < Data.Data.length; i++)
    {
        if (!bFoundToken)
        {
            bFoundToken = InStr(Data.Data[i], token) > -1;
        }
        if (len(Data.Data[i]) > 1024)
        {
            f.Logf(Left(Data.Data[i], 1024));
            f.Logf(Mid(Data.Data[i], 1024));
        }
        else f.Logf(Data.Data[i]);
    }
    f.Destroy();

    check(bFoundToken, "Found LibHTTP token for test #"$idx$chr(3)$"d:\\dev\\ut2004\\ut2-code\\LibHTTP_Tests\\Classes\\TEST_Cache.uc"$"("$string(69)$")");
    if (idx == 2) check(origin == DO_Cache, "3nd request should be cached"$chr(3)$"d:\\dev\\ut2004\\ut2-code\\LibHTTP_Tests\\Classes\\TEST_Cache.uc"$"("$string(70)$")");
    SetTimer(0.001, false);
}



defaultproperties
{
    TestName="LibHTTP Cache Tests"
    TestDescription="Test the HttpCache class"

    URLS[0]="http://%TestLocation%PlainText.txt"
    URLS[1]="http://%TestLocation%XHTML.html"
    URLS[2]="http://%TestLocation%PlainText.txt"
}