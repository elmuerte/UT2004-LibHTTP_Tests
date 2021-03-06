// NOTICE: This file was automatically generated by UCPP; do not edit this file manualy.
// UCPP Version 1.6; http://wiki.beyondunreal.com/wiki/UCPP
// #pragma ucpp include ../../UsUnit/macros.inc
class TEST_Posts extends TEST_BaseRequest;

function run()
{
    idx++;
    if (idx < URLS.length)
    {
        sock.setFormData("testid", idx);
        sock.setFormData("token", token);
        sock.post(getUrl(idx));
    }
    else Done();
}

defaultproperties
{
    TestName="LibHTTP Post Request Tests"
    TestDescription="Posting data through LibHTTP"

    URLS[0]="http://%TestLocation%post.php"
    URLdesc[0]="Plain post request"
    URLS[1]="http://%TestLocation%post.php?with=getargs"
    URLdesc[1]="Post with get arguments"
}