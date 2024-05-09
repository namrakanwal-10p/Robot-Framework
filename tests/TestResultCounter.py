from robot.api import SuiteVisitor
from robot import run

class TestResultCounter(SuiteVisitor):
    ROBOT_LISTENER_API_VERSION = 3

    def __init__(self):
        super(TestResultCounter, self).__init__()
        self.pass_count = 0
        self.fail_count = 0

    def start_suite(self, suite, result):
        pass

    def end_suite(self, suite, result):
        pass

    def start_test(self, test, result):
        pass

    def end_test(self, test, result):
        if result.passed:
            self.pass_count += 1
        else:
            self.fail_count += 1

    def start_keyword(self, name, attributes):
        pass

    def end_keyword(self, name, attributes):
        pass

    def close(self):
        print("Number of Passed Test Cases:", self.pass_count)
        print("Number of Failed Test Cases:", self.fail_count)

if __name__ == '__main__':
    run('login.robot', listeners=[TestResultCounter()])
