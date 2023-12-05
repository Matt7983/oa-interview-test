# README

Faria OpenApply Interview Test.

## Problem
Please read the description thoroughly then create a program to solve this problem [here](./PROBLEM.md)

### Note:
*  Please use this template to reslove problem.
*  You should include ​unit tests​ in your solution. We recommend using ​TDD​ to solve these problems.
* Keep your methods short.
* Submit ​production-ready code​ that is clean and easy to understand.


## Rules

1. We want our hiring process to be fair, and for everyone to start from the same place. To enable this, we request that you do not share or publish these problems.
2. Please submit your solution to your own Github account for review


As a general rule, we allow three days from the date that you receive these instructions to submit your code, but you may request more time from me if needed. If you have any questions about the code as it relates to your ​interview​ process, please contact our HR.

<br>
<br>
<br>

# Matt homework README

## Get Started

### Switch to the desired branch

**We use main branch as demo.**

    $ git switch main

### Install required softwares

- ruby 2.7.5
- bundler
- docker-compose(Optional, to run mysql container)

### ruby 2.7.5

    $ sudo apt install rbenv(for ubuntu)
    $ brew install rbenv ruby-build(for MacOS)
    $ echo 'eval "$(rbenv init -)"' >> ~/.bashrc #depend on which sh you choose
    $ source ~/.bashrc
    $ rbenv install 2.7.5

### bundler

    $ RBENV_VERSION=2.7.5 gem install bundler

### docker-compose / mysql 5.6

**In this project we provide docker-compose.yml to install mysql.**
    $ sudo apt install docker-compose
    $ docker-compose up -d
    $ docker ps #to check if mysql is running successfully

### install gems
    $ bundle install

### env settings
**If docker-compose runs well, the database.yml settings fit mysql, no need to change.**

### create rails database
    $ bundle exec rake db:create
    $ bundle exec rake db:migrate

### if you want to add sample data
    $ bundle exec rake db:seed

### run rails
    # You need to set binding if you connect from other machine
    $ bundle exec rails s

## RSpec
To run the RSpec locally, follow the steps below:

### create rails database for test env
    $ RAILS_ENV=test bundle exec rake db:create
    $ RAILS_ENV=test bundle exec rake db:migrate

### execute rspec
    $ bundle exec rspec spec

## API document

### Follow student

- URL: `{base_url}/teachers/:teacher_id/follow_student`
- Method: `POST`
- Body:
  - `student_id`: student that you want to follow.
- Response:
    ```json
    {
        "success": true,
        "teacher": {
            "id": 45,
            "name": "Lindsey Reichel V",
            "email": "francesco.nikolaus@turcotte.test",
            "students": [
                {
                    "id": 34,
                    "name": "Prof. Merrill Marquardt",
                    "email": "mercedes.mitchell@abbott-abshire.example"
                },
                {
                    "id": 35,
                    "name": "Eloy Homenick PhD",
                    "email": "lauretta@schulist.test"
                },
                {
                    "id": 36,
                    "name": "Kourtney Moore",
                    "email": "corrine.carter@connelly.test"
                }
            ]
        }
    }
    ```
- Error:

  ```json
  { "error_code": "STUDENT_NOT_FOUND" }
  ```

  | http status | error_code | description |
  | :---------: | :--------: | :---------: |
  | 404 | STUDENT_NOT_FOUND | The student_id is not a valid student id |
  | 409 | STUDENT_ALREADY_FOLLOWED | This teacher is already followed the student |

### Unfollow student

- URL: `{base_url}/teachers/:teacher_id/unfollow_student`
- Method: `DELETE`
- Body:
  - `student_id`: student id that you want to unfollow.
- Response:
    ```json
    {
        "success": true,
        "teacher": {
            "id": 45,
            "name": "Lindsey Reichel V",
            "email": "francesco.nikolaus@turcotte.test",
            "students": [
                {
                    "id": 35,
                    "name": "Eloy Homenick PhD",
                    "email": "lauretta@schulist.test"
                },
                {
                    "id": 36,
                    "name": "Kourtney Moore",
                    "email": "corrine.carter@connelly.test"
                }
            ]
        }
    }
    ```
- Error:

  ```json
  { "error_code": "STUDENT_NOT_FOLLOWED" }
  ```

  | http status | error_code | description |
  | :---------: | :--------: | :---------: |
  | 404 | STUDENT_NOT_FOLLOWED | The follower is not followed yet |

### Teacher followed students

- URL: `{base_url}/teachers/:teacher_id/followed_students`
- Method: `GET`
- Parameters: N/A
- Response:
    ```json
    {
        "teacher": {
            "id": 45,
            "name": "Lindsey Reichel V",
            "email": "francesco.nikolaus@turcotte.test",
            "students": [
                {
                    "id": 34,
                    "name": "Prof. Merrill Marquardt",
                    "email": "mercedes.mitchell@abbott-abshire.example"
                },
                {
                    "id": 35,
                    "name": "Eloy Homenick PhD",
                    "email": "lauretta@schulist.test"
                },
                {
                    "id": 36,
                    "name": "Kourtney Moore",
                    "email": "corrine.carter@connelly.test"
                },
                {
                    "id": 37,
                    "name": "Raleigh Barrows",
                    "email": "vickey@hane.example"
                },
                {
                    "id": 38,
                    "name": "Ryan Hammes VM",
                    "email": "bettina@herman-kuphal.example"
                }
            ]
        }
    }
    ```
- Error: N/A


