from robot.api import TestSuiteBuilder
from MyVisitor import TestCountVisitor

# Build the test suite from the 'tests' directory
suite = TestSuiteBuilder().build('tests')

# Create an instance of the TestCountVisitor
visitor = TestCountVisitor()

# Visit the suite with the visitor
suite.visit(visitor)
