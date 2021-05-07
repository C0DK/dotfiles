#!/usr/bin/env python3
from typing import List
from decimal import Decimal
from tgtg import TgtgClient
import os
from dotenv import load_dotenv

from dataclasses import dataclass


@dataclass(frozen=True)
class Store:
    name: str
    pk: int


@dataclass(frozen=True)
class Item:
    pk: int
    name: str
    count: int
    display_name: str
    description: str
    price: Decimal
    store: Store


LAT = 57.0462626
LONG = 9.9215263
RADIUS = 50


def get_items(client: TgtgClient):
    return [
        Item(
            pk=item["item"]["item_id"],
            name=item["item"]["name"],
            count=item["items_available"],
            display_name=item["display_name"],
            description=item["item"]["description"],
            price=Decimal(item["item"]["price"]["minor_units"] / 100),
            store=Store(pk=item["store"]["store_id"], name=item["store"]["store_name"]),
        )
        for item in client.get_items(
            favorites_only=False,
            latitude=LAT,
            longitude=LONG,
            radius=RADIUS,
        )
        # if item["items_available"] > 0
    ]


def filter_items(items: List[Item]):
    return [
        item
        for item in items
        if item.count > 0
        and (
            item.store.name in ["Penny Lane - Aalborg"]
            or any(val in item.name.lower() for val in ["frugt", "grønt"])
        )
    ]


def print_items(items: List[Item]):
    for item in items:
        print(f"{item.display_name} ({item.count})")


if __name__ == "__main__":
    load_dotenv()
    EMAIL = os.getenv("TGTG_EMAIL")
    PASSWORD = os.getenv("TGTG_PASSWORD")
    assert EMAIL and PASSWORD
    client = TgtgClient(email=EMAIL, password=PASSWORD)

    items = get_items(client)
    items = filter_items(items)

    print_items(items)
