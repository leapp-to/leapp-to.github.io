# Actor Guidelines

## Repository Structure

Currently existing actors are stored in a common repository on Github: https://github.com/leapp-to/leapp-actors

Such repository contains actors and schemas used by Leapp project. Actors stored on such repository should be stored following a directory structure based on their functionalities. As an example of such directories we have:
* Common: Contains actors that provide functionalities that are used by a group of other actors.
* Containerization: Contains actors specific for all types of migration to containers.
* Containerization/Common: Contains actors with common functionalities used by other containerization actors.
* Upgrade: Contains actors specific for all types of system-wide OS upgrades or migrations to the new OS version.
* Upgrade/Common: Contains actors with common functionalities used by other upgrade actors.

These is a structure that supports all existing use cases but, if necessary, it can be expanded in the future.


## Actor Structure

Each actor should be stored in a single directory with name based on the actor name (respecting naming conventions described below). An actor is composed of the following files:

**_actor.yaml**: YAML file containing actor description used by Snactor library. This file will define used input/output channels and point to the script that will be executed by such actor. Even if not mandatory, a description should be provided in such file, in a way that developers can use it to understand purpose of an actor and how it is expected to work

**script.ext**: Script file used by actor. A common practice is naming such script based on actor name or use a common name between all actors, like **exec**. Another one is writing such script using Python or Bash script.

It is a responsibility of actor’s writer to make sure that the actor’s directory contains all the necessary dependencies alongside the code. In other words, the actor should not rely on anything on the system on which the actor will be executed, except the following:
Python 2.6+ installed

README files or whatever is necessary to properly document an actor should be placed inside actor’s directory.


## Naming Convention

While creating a new actor or defining a new schema, is up to developer to name them in a way that will be easy for others to understand the functionality that such instance provides. From the name of each actor or schema it should be obvious not only which topic it handles, but also which specific part of the process. Examples are:

**Actors**: i.e. “dns_server_config_check”, “web_server_config_fix” and “ldap_users_backup”.

**Schemas**: Currently divided into two groups: single value of a basic type, named after that type (i.e  “number”, “string”, “string_list” or “bool”) and composed ones, named after the representative data (i.e “redis”, “osversion” or “process_list”).

Convention in general for naming actors, schemas and directories:
* Use descriptive names;
* Use snake_case;
* Do not start a schema name with “type_” since that is implicit;
* Do not use “actor” in an actor name since that is implicit.


## Coding Guidelines

Currently all existing actors are written using either Python or Bash script. When using Python you should also follow general Python guidelines for Leapp projects:
https://github.com/leapp-to/guidelines/blob/master/python.md

Also make sure that new code does not have any lint errors when possible, i.e run pep8, pylint, flake8 on your Python code and shellcheck for Bash. Automate testing of your code is always a good policy but how to properly implement that for actors is an open question.


## Actors Categorization by Tags

Actors can be categorized according to their purpose. For example the phase of the upgrade process an actor belongs to or if it is used for containerization or migration purposes.
This may be a subject to change depending on Channel Data Model implementation details.

For the moment, based on upgrade phases, the following tags are defined:
* **Pre**
* **Upgrade**
* **Post**

Additional tags: ( tentative)
* **Info** ( or **Related**) - Denotes the actors, that do not affect upgrade process directly, but provide additional useful information. There may be a CLI/GUI option to filter this info out from the report.
* **Containerization**
* **Migration**

This categorization will allow running the scan phase separately by choosing CLI/GUI option.
Each actor will report a message to log. Part of the message will be the actor’s tag.


## Actors Categorization by Result

The actors will have the following  result statuses, that will be printed in the user report.

* **Pass** - Upgrade process can proceed as it is. No action needed.
* **Pre_upgrade_inspection** - User must review the report and inspect the elements / read additional info as indicated before the main upgrade process.
* **Pre_upgrade_action** - User must take an action as indicated before the main upgrade process.
* **Post_upgrade_inspection** - User must review the report and inspect the elements / read additional info as indicated after the main upgrade process.
* **Post_upgrade_action** - User must take an action as indicated after the main upgrade process.
* **Fixed** - we found some issue but we are able to handle it automatically (something what can be done during (pre/post)-upgrade phase.
* **Fail** - Upgrade is currently not possible.
* **Error**

Additional statuses may be added if necessary.
