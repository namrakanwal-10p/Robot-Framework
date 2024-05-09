from robot.api import SuiteVisitor


class MyVisitor(SuiteVisitor):

    def __init__(self):
        pass

    def start_suite(self, suite):
        for i in range(3):
            # Create a new test case
            tc = suite.tests.create(name='Dynamic Test #%s' % i)
            # Create a new keyword within the test case
            keyword = tc.body.create_keyword('Log', args=['Hello from test case #%s' % i])
            tc.body.append(keyword)
