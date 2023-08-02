from playwright.sync_api import sync_playwright
from bs4 import BeautifulSoup
import time
import requests

with sync_playwright() as p:
    uname = str(input("Enter username:\t"))
    pwd = str(input("Enter password:\t"))
    browser = p.chromium.launch(headless=False, slow_mo=50)
    page = browser.new_page()
    page.goto('https://cas.uth.gr/login?service=https%3A%2F%2Fsis-web.uth.gr%2Flogin%2Fcas')
    page.fill('input#username',uname)
    page.fill('input#password',pwd)
    page.click('input#submitForm')
    time.sleep(0.1)
    page.goto('https://sis-web.uth.gr/feign/student/grades/diploma')
    # page.click('.side-menu > div:nth-child(1) > li:nth-child(5) > a:nth-child(1)')
    # page.click('li.active > ul:nth-child(2) > li:nth-child(1) > a:nth-child(1)')
    # page.is_visible('tr.odd')
    # html = page.inner_html('#student_grades_diploma tbody')
    # html = page.inner_html('body')
    # print(html)
     # Get the JSON data directly using requests
    cookies = page.context.cookies()
    cookies_dict = {cookie['name']: cookie['value'] for cookie in cookies}
    response = requests.get('https://sis-web.uth.gr/feign/student/grades/diploma', cookies=cookies_dict)

    if response.status_code == 200:
        json_data = response.json()
        # print(json_data[1]['title'])
        for course in json_data:
            print(course['title'],"|",course['studentSemester'],float(course['grade'])*10) if course['grade'] else print(course['title'],"|",course['studentSemester']) 
    else:
        print(f"Failed to fetch JSON data. Status code: {response.status_code}")

    # Continue with other actions as needed
    # soup = BeautifulSoup(html, 'html.parser')
    # name = soup.select('tr')[1]
    # courses = soup.find_all('tr')
    # courses = [course.text.strip() for course in courses]

    # for course in courses:
        # print(course)
    # print(courses)