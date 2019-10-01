# Distributed-SPM
Facilitating the sharing of SPM jobs across multiple machines

## What are we trying to do here?
The goal is to create a system to allow the user to use Salford Predictive
Modeler (SPM) to build batteries of predictive models on multiple machines in
an automated fashion (in parallel) and then collect model settings,
performance statistics, and other like data into a PostgreSQL database.

## How far have we gotten?
I have an example that will run six models on two machines residing in AWS and
then send the aforesaid performance statistics and model settings to a
Postgres database residing on a third AWS machine.  At the present time,
this all happens under Linux, but in theory, it could happen on Windows as
well, as will as any other computing platforms Minitab may choose to support in the future.

## What is required?

* SPM 8.3 (non-GUI), available from [Salford Systems](https://www.salford-systems.com/products/spm).
* [JobScheduler 1.12.9](https://sourceforge.net/projects/jobscheduler/files/JobScheduler.1.12/JobScheduler.1.12.9/)
  You want the main program (jobscheduler_\*), and the JOC Cockpit (joc_\*).
* [SPM Model Database](https://github.com/jlries61/SPM_Model_Database)
* [JobScheduler Universal Agent](https://www.sos-berlin.com/jobscheduler-downloads)
* The [Java Development Kit](https://www.java.com/en/), version 8 or higher [OpenJDK](https://openjdk.java.net/install/) works fine and probably comes with your Linux distro.
* [Perl](https://www.perl.org/)
* An FTP server.  I've been using [vsftpd](https://security.appspot.com/vsftpd.html).
* A supported relational database system to work with JobScheduler.  I have been using MariaDB, but PostgreSQL should work
  as well.
* A modern, standard web browser (I have been using Firefox).

## How to prepare the master machine

These instructions are Linux specific, but the principles will be similar under Windows.  An X display is required to install
JobScheduler and JOC Cockpit.

1. If it is not already installed, install the JDK.

2. Install and configure the MariaDB server.  Run `sudo mysql` and enter the following commands:
```
> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY ' <password> ';
> FLUSH PRIVILEGES;
> set @wait_timeout = 31536000;
> CREATE DATABASE scheduler;
> USE scheduler;
> exit
```
`<password>` is the password for the root role, as previous entered when configuring the server.

3. Install JobScheduler by extracting the archive and running `setup.sh` in `jobscheduler.1.12.9`.  Do not run it as root.
  If the script fails because it fails to connect to the X server (a problem I have had repeatedly), run Java directly.  The 
  command will be displayed by the script and will look something like this:
  ```
  sudo  "java" -jar "./jobscheduler_linux-x64.1.12.9.jar"
  ```
  After entering your password, the GUI will appear and you will be able to install.  On step 8, change the value for
  *Allowed Host* to 0.0.0.0.  On step 13, set the host to 127.0.0.1 (localhost), the user to "root" and the password to the
  previously set password for the root role.

4. Enable JobScheduler to run as a service.  The startup script is
  `/opt/sos-berlin.com/jobscheduler/ <hostname> _40444/bin/jobscheduler.sh`.  Copy it into `/etc/init.d`, removing the
  `.sh` extension.  If one is running SysVInit (traditional Linux `init`) then one can simply add the usual links to the usual
  `rc?.d` directories.  If instead one is running `systemd` (as most modern Linux distributions now do), then you will
  need to add it as a service there.  Under Debian and such derivatives as Ubuntu, one can run the following command from `/etc/init.d`:
  ```
  sudo update-rc.d jobscheduler defaults
  ```
  Otherwise, one can run the following command:
  ```
  sudo systemctl start jobscheduler
  ```
  And `systemd` will automatically incorporate the new service before launching it.
  
