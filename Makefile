OBJDIR = obj

all: $(OBJDIR) snake.exe

snake.exe: $(OBJDIR)/main.o $(OBJDIR)/game.o $(OBJDIR)/snake.o $(OBJDIR)/apple.o
	g++ $(OBJDIR)/main.o $(OBJDIR)/game.o $(OBJDIR)/snake.o $(OBJDIR)/apple.o -Iinclude -Wall -o snake.exe

$(OBJDIR):
	mkdir $(OBJDIR)

$(OBJDIR)/%.o: src/%.cpp
	g++ -Iinclude -Wall -c $< -o $@

run: all
	./snake.exe

clean:
	-del snake.exe 2>nul || rm -f snake.exe
	-del $(OBJDIR)\\*.o 2>nul || rm -f $(OBJDIR)/*.o
	-rmdir $(OBJDIR) 2>nul || rmdir $(OBJDIR)