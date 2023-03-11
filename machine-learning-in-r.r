{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "21ecc461",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2023-03-11T09:01:22.122659Z",
     "iopub.status.busy": "2023-03-11T09:01:22.120434Z",
     "iopub.status.idle": "2023-03-11T09:01:23.616375Z",
     "shell.execute_reply": "2023-03-11T09:01:23.614346Z"
    },
    "papermill": {
     "duration": 1.503877,
     "end_time": "2023-03-11T09:01:23.619301",
     "exception": false,
     "start_time": "2023-03-11T09:01:22.115424",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.2 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.4.0      \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 1.0.1 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.8      \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.10\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.1      \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.5.0 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.3      \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.2 \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "'health-insurance'"
      ],
      "text/latex": [
       "'health-insurance'"
      ],
      "text/markdown": [
       "'health-insurance'"
      ],
      "text/plain": [
       "[1] \"health-insurance\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# This R environment comes with many helpful analytics packages installed\n",
    "# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats\n",
    "# For example, here's a helpful package to load\n",
    "\n",
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory\n",
    "\n",
    "list.files(path = \"../input\")\n",
    "\n",
    "# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using \"Save & Run All\" \n",
    "# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "35e60b6a",
   "metadata": {
    "papermill": {
     "duration": 0.001767,
     "end_time": "2023-03-11T09:01:23.623229",
     "exception": false,
     "start_time": "2023-03-11T09:01:23.621462",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "***My excercises in machine learning in R***"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "c0a341cc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-11T09:01:23.659776Z",
     "iopub.status.busy": "2023-03-11T09:01:23.628181Z",
     "iopub.status.idle": "2023-03-11T09:01:23.859794Z",
     "shell.execute_reply": "2023-03-11T09:01:23.857887Z"
    },
    "papermill": {
     "duration": 0.2375,
     "end_time": "2023-03-11T09:01:23.862430",
     "exception": false,
     "start_time": "2023-03-11T09:01:23.624930",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "    State           Uninsured Rate (2010) Uninsured Rate (2015)\n",
       " Length:52          Length:52             Length:52            \n",
       " Class :character   Class :character      Class :character     \n",
       " Mode  :character   Mode  :character      Mode  :character     \n",
       "                                                               \n",
       "                                                               \n",
       "                                                               \n",
       "                                                               \n",
       " Uninsured Rate Change (2010-2015) Health Insurance Coverage Change (2010-2015)\n",
       " Length:52                         Min.   :   15000                            \n",
       " Class :character                  1st Qu.:   97250                            \n",
       " Mode  :character                  Median :  224500                            \n",
       "                                   Mean   :  747942                            \n",
       "                                   3rd Qu.:  412250                            \n",
       "                                   Max.   :19304000                            \n",
       "                                                                               \n",
       " Employer Health Insurance Coverage (2015)\n",
       " Min.   :   335000                        \n",
       " 1st Qu.:   879750                        \n",
       " Median :  2305500                        \n",
       " Mean   :  6626615                        \n",
       " 3rd Qu.:  4386500                        \n",
       " Max.   :172292000                        \n",
       "                                          \n",
       " Marketplace Health Insurance Coverage (2016) Marketplace Tax Credits (2016)\n",
       " Min.   :   13313                             Min.   :   1224               \n",
       " 1st Qu.:   51097                             1st Qu.:  43717               \n",
       " Median :  130672                             Median :  98176               \n",
       " Mean   :  426205                             Mean   : 361139               \n",
       " 3rd Qu.:  226082                             3rd Qu.: 193684               \n",
       " Max.   :11081330                             Max.   :9389609               \n",
       "                                                                            \n",
       " Average Monthly Tax Credit (2016) State Medicaid Expansion (2016)\n",
       " Length:52                         Mode :logical                  \n",
       " Class :character                  FALSE:19                       \n",
       " Mode  :character                  TRUE :32                       \n",
       "                                   NA's :1                        \n",
       "                                                                  \n",
       "                                                                  \n",
       "                                                                  \n",
       " Medicaid Enrollment (2013) Medicaid Enrollment (2016)\n",
       " Min.   :   67518           Min.   :   63583          \n",
       " 1st Qu.:  289775           1st Qu.:  309113          \n",
       " Median :  794614           Median :  978052          \n",
       " Mean   : 2255699           Mean   : 2828190          \n",
       " 3rd Qu.: 1274017           3rd Qu.: 1732724          \n",
       " Max.   :56392477           Max.   :73532931          \n",
       " NA's   :2                                            \n",
       " Medicaid Enrollment Change (2013-2016) Medicare Enrollment (2016)\n",
       " Min.   :   -3935                       Min.   :   88966          \n",
       " 1st Qu.:   53979                       1st Qu.:  320887          \n",
       " Median :  234156                       Median :  818753          \n",
       " Mean   :  644246                       Mean   : 2173923          \n",
       " 3rd Qu.:  456249                       3rd Qu.: 1298255          \n",
       " Max.   :16106157                       Max.   :57149984          \n",
       " NA's   :2                                                        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Begin with k-nearest neighbors\n",
    "# download the required library\n",
    "library (tidyverse)\n",
    "\n",
    "# download the dataset\n",
    "insurance <- read_csv ('/kaggle/input/health-insurance/states.csv', show_col_types = 'FALSE')\n",
    "summary (insurance)"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 5.217975,
   "end_time": "2023-03-11T09:01:23.985720",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-03-11T09:01:18.767745",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
