# Stepper Controller
- Author: Andy Lee(Hardware), Liu Yinyi(Software)
- Date: 2019-01-17
- Version: 1.0.0
- Abstract: Stepper control system including embedded-slave and PC-master codes.

---

## 1. Protocol
USART Serial Parameters:

|BaudRate|Parity|DataBits|StopBits|TerminatorChar|
|---|---|---|---|---|
|9600|None|8|1|\<CR> (chr:13)|

- `Set` Commands:

```
# Reset to go to the extreme
RESET<CR>

# Stop immediately anyway
STOP<CR>

# Set the target position as X (X is an integer)
POS X<CR>

# (Optional) Set the velocity as V
VEL V<CR>
```

|State Index|Meanings|
|---|---|
|-1|ERROR|
|0|RESET|
|1|RUN|

- `Get` Commands:

```
# The callback 'get' information is sending by the embedded-slave regularly.
# The format of each data package is:

P 100000<CR>		# means Position is 100000
V -100<CR>		# means Velocity is negative 100 (the unit should reunion)
S 1<CR>			# means State is OK (See the table above)
```

## 2. PC-Master Usage
The software of the controller is based on Matlab.  
I use Matlab R2018b GUI to build up. Mac OSX and Windows 10 are tested OK.  
For the Latest Version of Matlab, it can be downloaded at the [SYSU Universal Software Cloud](https://software.sysu.edu.cn).

