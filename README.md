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

* SPM 8.3 (non-GUI), available from Salford Systems.
