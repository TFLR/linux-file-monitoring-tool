CC = gcc
CFLAGS = `pkg-config --cflags --libs gtk+-3.0` -Wall -g

# Liste des fichiers sources
SRCS = file_monitor.c gestiondroit/main.c gestiondroit/extended_permissions.c gestiondroit/file_properties.c gestiondroit/menu.c gestiondroit/standard_permissions.c

# Liste des fichiers objets correspondants
OBJS = $(SRCS:.c=.o)

# Nom de l'exécutable
TARGET = file_monitor

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET) $(CFLAGS)

%.o: %.c
	$(CC) -c $< -o $@ $(CFLAGS)

clean:
	rm -f $(OBJS) $(TARGET)
