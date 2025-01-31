# Driver Checker Script

## Overview
The `driver-checker.sh` script is a simple Bash script designed to check if a user is eligible for a driver's license based on their age and vision rating. It logs the results and allows retrieval of past results.

## Installation
To install and set up the script, follow these steps:

```bash
touch driver-checker.sh
chmod +x driver-checker.sh
mv driver-checker.sh /bin
```

## Usage
The script supports three main commands:
- `new` - Check eligibility for a new user
- `get` - Retrieve the last recorded result for a specific user
- `list` - Display a list of all recorded results

### Commands
#### 1. Check Eligibility (`new`)
This option prompts the user to enter their details and evaluates whether they are eligible for a driver's license.

```bash
./driver-checker.sh new
```
**Prompts:**
- Enter your name
- Enter your age
- Enter your vision rate (1-6)

**Eligibility Criteria:**
- Age must be **18 or older**
- Vision rate must be **4 or higher**

The result is stored in `/var/log/driver-checker.log`.

#### 2. Get User Result (`get`)
This option retrieves the last recorded eligibility result for a given user.

```bash
./driver-checker.sh get
```
**Prompts:**
- Enter the name of the user

If a result exists, it is displayed in the format:
```bash
Name:eligible/not eligible
```
Otherwise, it informs that no result was found.

#### 3. List All Results (`list`)
This option lists all recorded results with names and their eligibility status.

```bash
./driver-checker.sh list
```

## Script Breakdown
### Function Definitions
- `check()`: Takes `name`, `age`, and `vision_rate` as arguments, evaluates eligibility, logs the result, and prints the eligibility status.
- `get_result()`: Searches the log file for the latest result of a given user and displays it.
- `list_results()`: Extracts and lists all recorded results from the log file.

### Case Statement
The script uses a `case` statement to handle different user inputs (`new`, `get`, and `list`). If an invalid argument is provided, it prompts the user with correct usage instructions.

## Log File
All records are stored in:
```
/var/log/driver-checker.log
```
Format:
```
name:age:vision_rate:eligible/not eligible
```

## Example Usage
```bash
./driver-checker.sh new
```
**User Input:**
```
Enter your name: John
Enter your age: 20
Enter your vision rate (1-6): 5
```
**Output:**
```
You are eligible for a driver's license.
```

```bash
./driver-checker.sh get
```
**User Input:**
```
Enter the name of the user: John
```
**Output:**
```
John:eligible
```

```bash
./driver-checker.sh list
```
**Output:**
```
John:eligible
Alice:not eligible
```

## Notes
- The script must be run with the appropriate permissions to read/write `/var/log/driver-checker.log`.
- Vision rate should be between **1 and 6**.
- Only the most recent entry for a user is retrieved with `get`.

## Conclusion
This script provides a simple and effective way to check driver's license eligibility, log results, and retrieve past checks.
