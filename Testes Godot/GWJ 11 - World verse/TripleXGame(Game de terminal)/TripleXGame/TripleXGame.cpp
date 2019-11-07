#include <iostream>
#include <ctime>

void PrintIntroduction(int Difficulty)
{
	std::cout << "\n\nYou are a secret agent breaking into a level " << Difficulty;
	std::cout << " secure server room...\nEnter with the correct code to continue...\n\n";
}

bool PLayGame(int Difficulty)
{
	// Game start
	PrintIntroduction(Difficulty);

	// Declaration
	const int CodeA = rand() % Difficulty + Difficulty + 1;
	const int CodeB = rand() % Difficulty + Difficulty + 1;
	const int CodeC = rand() % Difficulty + Difficulty + 1;

	const int CodeSum = CodeA + CodeB + CodeC;
	const int CodeProduct = CodeA * CodeB * CodeC;

	// Print sum and product to the terminal
	std::cout << "\n+ There are 3 numbers in the code.";
	std::cout << "\n+ The codes add-up to: " << CodeSum;
	std::cout << "\n+ The codes multiply to give: " << CodeProduct << std::endl;;

	// Store player guess
	int GuessA, GuessB, GuessC;
	std::cin >> GuessA >> GuessC >> GuessB;

	int GuessSum = GuessA + GuessB + GuessC;
	int GuessProduct = GuessA * GuessB * GuessC;

	// Check if the player guess is correct
	if (CodeSum == GuessSum && CodeProduct == GuessProduct)
	{
		std::cout << "\nYou win! Go ahead to the next problem...\n";
		return true;
	}
	else
	{
		std::cout << "\nYou lose! Just try again.";
		return false;
	}
}

int main() 
{
	srand(time(NULL));

	int LevelDifficulty = 1;
	const int MaxDifficulty = 6;

	while (LevelDifficulty <= MaxDifficulty)
	{
		bool bLevelComplete = PLayGame(LevelDifficulty);
		std::cin.clear();
		std::cin.ignore();

		if (bLevelComplete)
		{
			++LevelDifficulty;
		}
	}

	std::cout << "Congratulations, you beat the system!" << std::endl;
	return 0;
}