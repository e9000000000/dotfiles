#!/bin/python

import json


try:
    with open("/usr/lib/code/product.json", "r") as file:
        product_text = file.read()
        product_json = json.loads(product_text)

    product_json["extensionsGallery"] = {
        "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
        "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",
        "itemUrl": "https://marketplace.visualstudio.com/items",
    }

    with open("/usr/lib/code/product.json", "w") as file:
        product_new_text = json.dumps(product_json, indent=4)
        file.write(product_new_text)
except PermissionError:
    print("ERROR: not enought permissions, please run as root.")
