#!/bin/python

import os
import random
import re
import requests
import shutil
import tempfile


SAVE_DIR = tempfile.gettempdir()
PAGE_WITH_IMAGES_URLS_REGEX = re.compile(
    r"<div class=\"thumb-container-big \" id=\"thumb_([0-9]+)\">"
)
IMAGE_URL_REGEX = re.compile(
    r"<img class=\"main-content\" width=\"[0-9]+\" height=\"[0-9]+\" src=\"([^\"]+)\""
)
IMAGE_LIST_URL_TEMPLATE = "https://wall.alphacoders.com/by_category.php?id=3&name=Anime+Wallpapers&page={page_num}"
PAGE_WITH_IMAGE_URL_TEMPLATE = "https://wall.alphacoders.com/big.php?i={image_id}"
LAST_PAGE_NUMBER = 500


def save_image(url: str):
    image_format = re.search(r"\.([^\.]+)$", url).group(1)
    response = requests.get(url, stream=True)
    if response.status_code != 200:
        raise ConnectionError(f"Faild to save image, code={response.status_code}")

    file_path = os.path.join(SAVE_DIR, f"animebg.{image_format}")
    with open(file_path, "wb") as file:
        file.raw.decode_content = True
        shutil.copyfileobj(response.raw, file)

    return file_path


def get_random_image_list_url():
    page_num = random.randrange(1, LAST_PAGE_NUMBER)
    return IMAGE_LIST_URL_TEMPLATE.format(page_num=page_num)


def get_page_with_image_url(image_list_url: str):
    response = requests.get(image_list_url)
    html = response.text
    if response.status_code != 200:
        raise ConnectionError(
            f"Faild to get page with image url, code={response.status_code}"
        )
    search_results = PAGE_WITH_IMAGES_URLS_REGEX.findall(html)
    image_id = random.choice(search_results)
    return PAGE_WITH_IMAGE_URL_TEMPLATE.format(image_id=image_id)


def get_image_url(image_in_site_url: str):
    response = requests.get(image_in_site_url)
    html = response.text
    if response.status_code != 200:
        raise ConnectionError(f"Faild to get image url, code={response.status_code}")

    return IMAGE_URL_REGEX.search(html).group(1)


if __name__ == "__main__":
    random_list_url = get_random_image_list_url()
    image_in_site_url = get_page_with_image_url(random_list_url)
    image_url = get_image_url(image_in_site_url)
    file_path = save_image(image_url)
    print(file_path)
