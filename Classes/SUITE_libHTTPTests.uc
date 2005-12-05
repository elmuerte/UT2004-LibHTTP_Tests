class SUITE_libHTTPTests extends TestSuite;

defaultproperties
{
    TestName="LibHTTP Tests"
    TestDescription="All tests for the LibHTTP package"
    bBreakOnFail=false

    TestClasses[0]=class'TEST_Algorithms'
    TestClasses[1]=class'TEST_Requests'
    TestClasses[2]=class'TEST_Posts'
    TestClasses[3]=class'TEST_Cookie'
}