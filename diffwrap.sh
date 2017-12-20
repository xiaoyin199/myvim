#!/bin/sh  
  
#过滤掉svn diff的前五个命令行参数  
shift 5  
  
#使用vimdiff比较文件  
vimdiff "$@"
