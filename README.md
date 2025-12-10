# Linux File Monitoring Tool

Linux file monitoring tool written in **C**, using **inotify** and **GTK+ 3**.

The goal of this project is to watch sensitive files and directories, detect permission changes, and keep a simple audit log.
The tool can be used both from a **terminal menu** and from a **GTK graphical interface**.

---

## Features

### 🔍 Real-time file monitoring

* Watches selected files or directories using **inotify**.
* Detects changes such as:

  * permission changes,
  * file modifications / events depending on how the watcher is configured.
* Displays events in the terminal and/or through the GUI.

### 🔐 Permission management

* Reads and displays Unix permissions (`rwx` for owner / group / others).
* Allows changing file permissions directly from the tool:

  * via a text menu,
  * or via the GTK interface.
* Designed with the idea of tracking **sensitive files** and keeping their permissions under control.

### 📝 Logging

* Important events (permission changes, path added/removed from watch list, errors) are logged to a file.
* Logs can be used later for security investigations or to understand what happened on the system.

### 🖥️ GTK+ graphical interface

* Main window with buttons to:

  * **Add a path** to watch,
  * **Remove a path**,
  * **Show watched paths**,
  * **Show logs**.
* GUI is built on top of the same monitoring and permission logic as the CLI, so both interfaces share the same core.

### 🧰 Technologies

* Language: **C**
* Monitoring: **inotify**
* GUI: **GTK+ 3**
* Build: `gcc`, `pkg-config`, `Makefile`

---

## Installation

### Prerequisites (Debian / Ubuntu)

```bash
sudo apt-get update
sudo apt-get install -y build-essential libgtk-3-dev pkg-config
```

### Clone the repository

```bash
git clone https://github.com/TFLR/Linux-File-Monitoring-Tool.git
cd Outil-de-Monitoring
```

### Build

```bash
make
```

If everything is fine, an executable named `projet` is created at the root of the repository.

---

## Usage

> ⚠️ Some actions (watching system files, changing permissions) may require root privileges.

### Run from the terminal

```bash
sudo ./projet
```

You will see a **text menu** similar to:

* 1 – Add a path to watch
* 2 – Remove a watched path
* 3 – Show watched paths
* 4 – Start monitoring
* 5 – Launch permission management
* 6 – Open GTK interface
* 7 – Quit

![alt text](image.png)

You can:

* add files or directories to the watch list,
* start monitoring,
* manage permissions,
* open the GTK GUI.

### Run the GTK interface

From the menu, choose the option that launches the **graphical interface**.

In the GUI you can:

* add or remove watched paths,
* list currently watched files,
* open the log viewer.

---

## Example workflow

1. Start the program:

   ```bash
   sudo ./projet
   ```

2. Add one or more **sensitive paths** (for example configuration files, scripts, keys…).

3. Start monitoring.

4. When a permission change or other monitored event occurs:

   * the event is detected,
   * it is displayed in the interface / terminal,
   * and written to the log file.

5. Later, you can:

   * review the logs,
   * adjust permissions again if needed.

---

## Possible improvements

Some ideas if the project needs to evolve:

* Load watched paths from a configuration file (YAML/JSON) instead of only interactive input.
* Tag some files as “high sensitivity” and raise a higher level alert in the logs.
* Export logs in JSON format for ingestion into a SIEM or log management stack.
* Add notifications (email, webhook) when certain critical files are modified.
* Refactor the internal structures to allow dynamic lists of watched paths (instead of fixed-size arrays).

---
