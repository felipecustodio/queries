import os
from pathlib import Path

for i in range(40):
    directory = f"puzzle{i+1}"
    try:
        os.mkdir(directory)
    except OSError as error:
        print(error)

    query = f"{directory}/{directory}.sql"
    if not Path(query).is_file():
        Path(query).touch()

