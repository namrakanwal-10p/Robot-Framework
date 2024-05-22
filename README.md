# Robot Framework Project

This is a sample Robot Framework project demonstrating how to create and execute test cases using Robot Framework.

## Getting Started

To get started with this project, follow these steps:

1. Clone the repository: `git clone https://github.com/your_username/robot-framework-project.git`
2. Install Robot Framework: `pip install robotframework`
3. Run the tests: `robot tests/`

## Project Structure

robot-framework-project/
│
├── tests/
│ ├── test_case_1.robot
│ ├── test_case_2.robot
│ └── ...
│
├── keywords/
│ ├── custom_keywords.robot
│ ├── ...
│
├── resources/
│ ├── test_data.csv
│ ├── ...
│
└── README.md

Install Python: If python is installed and environment variable are set.

Then open command prompt. Run the following commands. ==> python –-version ==> pip --version

Install Selenium: Install selenium using command prompt. pip install robotframework Then after installation run this command. robot -–version rebot –version pip show robotframework

Install Pycharm Download pycharm community version and install it. https://www.jetbrains.com/pycharm/download/#section=windows

Then launch and create project: Then navigate to setting and add these libraries: Then in settings click on Python Interpreter. Then click on + button to add libraries. Install and add “Selenium”. Install and add RobotFramework Install and add RobotFramework-seleniumlibrary Install and add PyMySQL Install and add RobotFramework-Databaselibrary

Check your chrome webdriver version and download it.

Note: The pycharm intellibot plugin of Robot Framework is not upto date. That’s why download intellibot plugin for Robot Framework using the above repository.

Requirement file:
pip install -r requirement.txt

Check your chrome webdriver version and download it using chrome

Pararell automation:
pabot --processes 2 .\TestCases\*.robot
## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
