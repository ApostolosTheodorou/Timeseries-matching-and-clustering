OBJS = $(patsubst %.cpp, %.o, $(wildcard *.cpp))
HEADER = $(wildcard *.h)
TARGET = all
TARGET_1 = search
TARGET_2 = cluster
CC = g++
CFLAGS = -O3 -g -Wall


%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(TARGET_1) $(TARGET_2)

$(TARGET_1): $(OBJS)
		$(CC) -g $(OBJS) -o $@

$(TARGET_2): $(OBJS)
		$(CC) -g $(OBJS) -o $@

clean:
	-rm -f *.o 
	-rm -f $(TARGET_1)
	-rm -f $(TARGET_2)