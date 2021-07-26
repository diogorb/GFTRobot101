***Settings
Documentation   teste lib webdrivermanager

***Test Cases
Valida Lib chromedriversync
    ${chromedriver_path}=   chromedriversync.Get Chromedriver Path
    Create Webdriver    chrome   executable_path=${chromedriver_path}
    Go to  www.google.com
    Close browser