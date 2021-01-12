import sqlite3
import pandas as pd
from pathlib import Path
import os
import glob

puzzles = [f.path for f in os.scandir(".") if f.is_dir()]

for puzzle in puzzles:
    os.chdir(puzzle)

    csv_files = glob.glob(f"*.csv")

    db = f"{puzzle}.db"
    print(f"Building db for Puzzle {puzzle}...")

    Path(db).touch()
    conn = sqlite3.connect(db)
    c = conn.cursor()

    for file in csv_files:
        filename = file.split(".csv")[0]
        table = pd.read_csv(file)
        table.to_sql(filename, conn, if_exists="replace", index=False)

    os.chdir("..")
