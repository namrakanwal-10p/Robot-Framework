from robot.api import SuiteVisitor


class TestCountVisitor(SuiteVisitor):
    def __init__(self):
        self.test_count = 0

    def start_suite(self, suite):
        self.test_count += len(suite.tests)

    def end_suite(self, suite):
        print(f"Total test cases in '{suite.name}': {self.test_count}")

