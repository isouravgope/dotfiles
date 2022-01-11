CC = gcc
CFLAGS = -O2 -Wall -Wextra -Wpedantic
LINKFLAGS = -lrt

.PHONY: clean

weather_signaler: weather_signaler.c
	$(CC) $(CFLAGS) $< -o weather_signaler $(LINKFLAGS)

clean:
	@rm -v weather_signaler
