<p align="center">
  <img style="width: 160px;" src="https://raw.githubusercontent.com/matijakljajic/semb-pharo/main/res/showcase.gif" alt="showcase">
  <h1 align="center" style="margin: 0 auto 0 auto;">Noughts & Crosses</h1>
</p>

### What is it?

[Noughts & Crosses](https://en.wikipedia.org/wiki/Tic-tac-toe) game simulation showcased in the [Pharo](https://pharo.org/) environment using [Bloc](https://github.com/pharo-graphics/Bloc), Pharo's low-level UI framework.

- ___Note #1___: This project was done for a seminar paper. You can download and read the paper over this [link](https://github.com/matijakljajic/semb-pharo/blob/main/res/Implementacija%20igre%20sa%20nultom%20sumom%20i%20minimaks%20algoritma%20u%20Pharo%20okru%C5%BEenju.pdf). (in Serbian)
- ___Note #2___: Pharo MOOC served as a sort of prerequisite before I started working on the seminar paper. Some info about my progress regarding the MOOC can be found [here](https://github.com/matijakljajic/semb-pharo/tree/extra).

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

### License

Code found in this repository is licensed under [MIT](https://raw.githubusercontent.com/matijakljajic/semb-pharo/main/LICENSE).
