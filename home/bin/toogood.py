#!/usr/bin/env python3
from decimal import Deciaml
from tgtg import TgtgClient
import os
from dotenv import load_dotenv

from dataclasses import dataclass


@dataclass
class Store:
    name: str
    pk: int


@dataclass
class Item:
    pk: int
    name: str
    description: str
    price: Decimal
    store: Store


LAT = 57.0462626
LONG = 9.9215263


def get_items(client: TgtgClient):
    return {
        Item(
            pk=item["item"]["item_id"]
            name=item["item"]["name"]
            description=item["item"]["description"]
            price=Decimal(item["item"]["price"]["minor_units"]/100)
            store=Store(
                pk=item["store"]["store_id"]
                name=item["store"]["store_name"]
            )
        )
        for item in client.get_items(
            favorites_only=False,
            latitude=LAT,
            longitude=LONG,
            radius=10,
        )
    }


if __name__ == "__main__":
    load_dotenv()
    EMAIL = os.getenv("TGTG_EMAIL")
    PASSWORD = os.getenv("TGTG_EMAIL")
    assert EMAIL and PASSWORD
    client = TgtgClient(email=EMAIL, password=PASSWORD)

    print(get_items(client))
