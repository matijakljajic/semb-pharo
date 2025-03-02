<p align="center">
  <img style="width: 160px;" src="https://raw.githubusercontent.com/matijakljajic/semb-pharo/main/res/showcase.gif" alt="showcase">
  <h1 align="center" style="margin: 0 auto 0 auto;">Xs&Os / Tic-Tac-Toe / Noughts & Crosses</h1>
</p>

This is a simulation of the [Xs & Os / Tic-Tac-Toe / Noughts & Crosses](https://en.wikipedia.org/wiki/Tic-tac-toe) game with the respective [Minimax](https://en.wikipedia.org/wiki/Minimax) algorithm implementation, showcased in the [Pharo](https://pharo.org/) environment using [Bloc](https://github.com/pharo-graphics/Bloc), Pharo's low-level UI framework. The goal of this work is to representatively show the power of [TDD](https://en.wikipedia.org/wiki/Test-driven_development) and pure object-oriented programming, with the ability to interact with objects live for an easier debugging experience.

- ___Note #1___: This project was done for a seminar paper. You can download and read the paper over this [link](https://github.com/matijakljajic/semb-pharo/blob/main/res/Implementacija%20igre%20sa%20nultom%20sumom%20i%20minimaks%20algoritma%20u%20Pharo%20okru%C5%BEenju.pdf) (in Serbian). The seminar paper follows the project up until [this commit](https://github.com/matijakljajic/semb-pharo/tree/3a94edbb4724f3358b6d70b33b6acdf38db40970), and from that point onwards documentation found in the codebase supersedes the seminar paper.
- ___Note #2___: Pharo MOOC served as a sort of prerequisite before I started working on the seminar paper. Some info about my progress regarding the MOOC can be found [here](https://github.com/matijakljajic/semb-pharo/tree/extra).

## First steps

### How to load the project?

Load it into your image with:
```Smalltalk
Metacello new
        baseline: 'OXO';
        repository: 'github://matijakljajic/semb-pharo:main/src';
        load
```

### How to start the game?

Executing: 
- `OXO playVsPlayer` will start a 2-player game.
- `OXO playVsComputer` will start a 1-player game.

## References

___Sidenote___: Always check out the [Pharo books webpage](https://books.pharo.org/) for possible newer versions of some of the references mentioned below.

### Get started with Pharo

- Learning Object-Oriented Programming, Design and TDD with Pharo | [[PDF^]](https://files.pharo.org/books-pdfs/learning-oop/2018-04-01-LearningOOP.pdf)
- Pharo By Example 9 | [[PDF^]](https://books.pharo.org/pharo-by-example9/pdf/2022-03-26-index.pdf)
- Pharo with Style | [[PDF^]](https://books.pharo.org/booklet-WithStyle/pdf/WithStyle.pdf)

### Get started with Bloc

- A memory game: A simple tutorial with Bloc | [[PDF^]](https://books.pharo.org/booklet-ASimpleMemoryGameInBloc/2024-06-05-ASimpleBlocTutorial.pdf)

### An interesting read

- How many Tic-Tac-Toe (noughts and crosses) games? — se16.info | [[Webpage^]](http://www.se16.info/hgb/tictactoe.htm)
- Object-Oriented Design with Smalltalk (Dr. Stéphane Ducasse — Bern Lectures) | [[PDF^]](https://scg.unibe.ch/archive/lectures/DucasseLectures/Duca00y1SmalltalkLectures.pdf)

## License

Code found in this repository is licensed under [MIT](https://raw.githubusercontent.com/matijakljajic/semb-pharo/main/LICENSE).
