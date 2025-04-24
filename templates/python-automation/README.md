# Python Automation Template

This is a reusable project template for Python-based automation tasks.

## Features
- Poetry dependency & env management
- `automation/` folder for logic
- `scripts/run.py` as entry point
- Compatible with cron, systemd, or CLI
- Linting with Ruff, formatting with Black

## Run it
```bash
poetry install
poetry run python scripts/run.py
```
## ✅ Done! Final Structure
```sh
~/dotfiles/templates/python-automation/ 
  ├── pyproject.toml 
  ├── poetry.lock # generated after install 
  ├── automation/ 
  │ ├── init.py 
  │ └── main.py 
  ├── scripts/ 
  │ └── run.py 
  ├── tests/ 
  │ └── test_basic.py 
  ├── .gitignore 
  └── README.md
```
## 🧪 Test It Out
To try it:
```bash
cd ~/dotfiles/templates/python-automation
poetry install
poetry run python scripts/run.py
poetry run pytest
```

