#!/usr/bin/env python3
from dateutil.relativedelta import relativedelta, MO
from functools import lru_cache
from decimal import Decimal
from dataclasses import dataclass
from typing import List, Tuple

from datetime import datetime

import requests
import os

from dotenv import load_dotenv

load_dotenv()
SALARY_GOAL = Decimal(os.getenv("SALARY_GOAL"))
WORKSPACE_ID = os.getenv("WORKSPACE_ID")
CLOCKIFY_API_KEY = os.getenv("CLOCKIFY_API_KEY")

assert SALARY_GOAL
assert WORKSPACE_ID
assert CLOCKIFY_API_KEY

BASE_URL = "https://api.clockify.me/api/v1"
REPORTS_BASE_URL = "https://reports.api.clockify.me/v1"

WORKSPACE_URL = BASE_URL + "/workspaces"
DETAILED_REPORT_URL = f"{REPORTS_BASE_URL}/workspaces/{WORKSPACE_ID}/reports/detailed"



def is_respose_success(response) -> bool:
    return 200 <= response.status_code < 300


def get_json(url):

    response = requests.get(url, headers={"X-Api-Key": CLOCKIFY_API_KEY})

    assert is_respose_success(response)

    return response.json()


def post_json(url, body):
    response = requests.post(
        url,
        headers={
            "X-Api-Key": CLOCKIFY_API_KEY,
        },
        json=body,
    )

    assert is_respose_success(
        response
    ), f"Response failed with {response.status_code=} and {response.text=}"

    return response.json()


def get_workspace_ids() -> List[Tuple[str, str]]:
    assert CLOCKIFY_API_KEY is not None

    workspaces = get_json(WORKSPACE_URL)
    return [(workspace["name"], workspace["id"]) for workspace in workspaces]


@dataclass()
class DateRange:
    start: datetime
    end: datetime


def get_detailed_report(date_range: DateRange):
    return post_json(
        DETAILED_REPORT_URL,
        {
            "dateRangeStart": date_range.start.isoformat(),
            "dateRangeEnd": date_range.end.isoformat(),
            "detailedFilter": {
                "page": 1,
                "pageSize": 50,
            },
        },
    )

def at_midnight(dt: datetime) -> datetime:
  return datetime.now().replace(hour=0, minute=0, second=0, microsecond=0)

def this_month() -> DateRange:
    return DateRange(
        start=at_midnight(datetime.now()).replace(day=1),
        end=datetime.now(),
    )

def this_week() -> DateRange:
    return DateRange(
        start=at_midnight(datetime.now()) - relativedelta(weekday=MO(-1)),
        end=datetime.now(),
    )

@lru_cache(maxsize=32)
def get_detailed_report_month():
    return get_detailed_report(this_month())


def total_hours(date_range: DateRange):
    return get_detailed_report(date_range)["totals"][0]["totalBillableTime"]


def total_wage(date_range: DateRange):
    return Decimal(get_detailed_report(date_range)["totals"][0]["totalAmount"]) / 100


def in_dkk(amount: Decimal) -> str:
    return f"{amount:,.2f} DKK"

def total_wage_pct(date_range: DateRange) -> str:
    return f"{total_wage(date_range)/SALARY_GOAL*100:,.2f}%"

if __name__ == "__main__":
    #print(f"{in_dkk(total_wage(this_month()))=}")
    #print(f"{total_wage_pct(this_month())=}")
    print(f"{in_dkk(total_wage(this_month()))} ({total_wage_pct(this_month())})")

