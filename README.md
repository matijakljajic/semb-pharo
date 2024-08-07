<p align="center">
  <img style="width: 160px;" src="https://raw.githubusercontent.com/matijakljajic/semb-pharo/main/res/showcase.gif" alt="showcase">
  <h1 align="center" style="margin: 0 auto 0 auto;">Noughts & Crosses</h1>
</p>

### What is it?

[Noughts & Crosses](https://en.wikipedia.org/wiki/Tic-tac-toe) game simulation showcased in the [Pharo](https://pharo.org/) environment using [Bloc](https://github.com/pharo-graphics/Bloc), Pharo's low-level UI framework.

Pharo MOOC served as a sort of prerequisite before I started working on the seminar paper. Some info about that can be found [here](https://github.com/matijakljajic/semb-pharo/tree/extra).

### How to load the project?

Load it into your image with:
```Smalltalk
Metacello new
        baseline: 'OXO';
        repository: 'github://matijakljajic/semb-pharo:main/src';
        load
```

Executing `OXO playVsPlayer` will start your game.
