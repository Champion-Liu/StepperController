# Stepper Controller
- Author: Liu Yinyi(Software + Embedded), Andy Lee(Hardware)
- Date: 2019-03-01
- Version: 1.1.0
- Abstract: Stepper control system including embedded-slave and PC-master codes.

---

## 1. Protocol
USART Serial Parameters:

|BaudRate|Parity|DataBits|StopBits|TerminatorChar|SplitChar|
|---|---|---|---|---|---|
|9600|None|8|1|\<CR> (chr:13)|\<space>|

- Commands Index:

```cpp
enum
{
  IdxGetVelActual = 0,
  IdxGetPosActual,
  IdxGetPosTarget,
  IdxSetPosTarget,
  IdxSetHome,
  IdxReset,
  IdxStop
};
```

|State Index|Meanings|
|---|---|
|-1|ERROR|
|0|RESET|
|1|RUN|

## 2. PC-Master Usage
The software of the controller is based on Matlab.  
I use Matlab R2018b GUI to build up. Mac OSX and Windows 10 are tested OK.  
For the Latest Version of Matlab, it can be downloaded at the [SYSU Universal Software Cloud](https://software.sysu.edu.cn).

