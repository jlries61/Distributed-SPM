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
well, as well as any other computing platform Minitab chooses to support.

## What is required?

* SPM 8.3 (non-GUI), available from [Salford Systems](https://www.salford-systems.com/products/spm).
* [JobScheduler 1.12.9](https://sourceforge.net/projects/jobscheduler/files/JobScheduler.1.12/JobScheduler.1.12.9/)
  You want the main program (jobscheduler_\*), and the JOC Cockpit (joc_\*).
* [SPM Model Database](https://github.com/jlries61/SPM_Model_Database)
* [JobScheduler Universal Agent](https://www.sos-berlin.com/jobscheduler-downloads)
* The [Java Development Kit](https://www.java.com/en/), version 8 or higher [OpenJDK](https://openjdk.java.net/install/) works fine and probably comes with your Linux distro.
* [Perl](https://www.perl.org/)
* An FTP server.  I've been using [vsftpd](https://security.appspot.com/vsftpd.html).

