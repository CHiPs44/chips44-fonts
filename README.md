# CHiPs44's bitmap font(s)

[HAGL](https://github.com/tuupola/hagl) is a great library for graphics on embedded hardware but it comes with only a few fonts, even if <https://github.com/tuupola/embedded-fonts> gives some X11 or Viznut ones.

The other downside is that it uses the FONTX2 format (<http://elm-chan.org/docs/dosv/fontx_e.html>). This format is simple and able to describe 256 or up to 65,536 glyphs, but it is not very well known now.

That's why I looked for tools than can help to edit and export monospace fonts for this format.

## Included fonts

| Family | Size | Encoding | Notes                                                                   | File name in `source` dir      |
| ------ | ---- | -------- | ----------------------------------------------------------------------- | ------------------------------ |
| Mono   | 6x6  | ASCII    | 96 glyphs, goal is to be as minimal as possible, not for HAGL / FONTX2  | chips44-mono-6x6-ascii.kbitx   |
| Mono   | 6x6  | CP437    | 256 glyphs, [DOS Latin US](https://en.wikipedia.org/wiki/Code_page_437) | chips44-mono-6x6-cp437.kbitx   |
| Mono   | 6x6  | CP850    | 256 glyphs, [DOS Latin 1](https://en.wikipedia.org/wiki/Code_page_850)  | chips44-mono-6x6-cp850.kbitx   |
| Mono   | 6x6  | Unicode  | More than 256 glyphs                                                    | chips44-mono-6x6-unicode.kbitx |

## Editing fonts

I tried first Font Forge and gbdfed (GTK BDF Font Editor), available as a Debian or Ubuntu packages, but FF is hard to learn and gbdfed is buggy and lacks FONTX2 support.

I used [Bits'N'Picas](https://github.com/kreativekorp/bitsnpicas) to edit these fonts, which works flawlessly fot this task.

```bash
java -jar ~/bin/BitsNPicas.jar edit source/<filename>.kbitx
```

## Converting fonts to FONTX2 format

Code Page 437, 850, no encoding means 256 characters font:

```bash
java -jar ~/bin/BitsNPicas.jar convertbitmap -f fontx2 -o fontx2/chips44-mono-6x6-cp850-test.fnt source/chips44-mono-6x6-cp850.kbitx
```

Unicode variant, encoding is UTF-16 for example:

```bash
java -jar ~/bin/BitsNPicas.jar convertbitmap -f fontx2 -ee UTF-16 -o fontx2/chips44-mono-6x6-unicode-test.fnt source/chips44-mono-6x6-unicode.kbitx
```

## TODO / Roadmap

- Make a 6x8 variant for these encodings
- Add a Makefile to build fonts (`.h` included files are edited manually after `xxd -i` for now)
- Add a CMakeLists.txt to use them
- Make at least one proportional / variable width font, to experiment with my [Raspberry Pi Pico VGA board HAL for HAGL](https://github.com/CHiPs44/hagl_pico_vgaboard)

## License

`kbitx` files in the `source` directory are licensed under the [SIL Open Font License](https://openfontlicense.org/), version 1.1 or later; see file <LICENSE-OFL-1.1>.

Other work like converting these `kbitx` files to FONTX2 and headers files are licensed under the MIT license, see file <LICENSE-MIT>.

## Sample texts

### English

```text
```

### French

```text
Portez ce vieux whisky au juge blond qui fume sur son île intérieure, 
à côté de l'alcôve ovoïde, où les bûches se consument dans l'âtre, 
ce qui lui permet de penser à la caenogénèse de l'être dont il est question 
dans la cause ambiguë entendue à Moÿ, dans un capharnaüm qui, 
pense-t-il, diminue çà et là la qualité de son œuvre.
```

### Box drawing / graphics

```text
1234567890123456789012345678901234567890
┏━━┳━━━━━━━━┳━━━━━━━━┳━━━━━━━━┳━━━━━━━━┓01
┃LV┃Arndhor ┃Whurdrar┃Elanthir┃Andedas ┃02
┃05┃♥078/096┃♥025/032┃♥042/042┃♥054/068┃03
┣━━┻━━━━━━━━┻━━━━━━━━┻━━━━━━┳━┻━━━━━━━━┫04
┃▒▒▒▒┃▒▒▒▒▒┃▒▒▒▒▒░▒▒▒▒▒▒▒▒▒▒┃Barbarian ┃05
┃▒*▒▒░▒▒▒▒▒░▒▒▒▒▒┃▒▒▒▒▒▒▒▒▒▒┃Level   03┃06
┃▒▒▒▒┣━━━━━┫▒▒▒▒▒┗━━━━━━░━━━┫STR:  18+3┃07
┣━░━━┫▒▒▒▒▒┃▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒┃INT:  11+0┃08
┃▒▒▒▒░▒▒▒▒▒┣━░━━━━━━━━━━░━━━┫WIS:  13+1┃09
┣━━░━┻━┳━░━┛▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒┃DEX:  16+2┃10
┃▒▒▒▒▒▒░▒▒▒▒▒▒▒┏━━░━━━━━┳━░━┃CON:  13+1┃11
┃▒▒▒▒▒▒┣━━┳━░━━┫▒▒▒▒▒▒▒▒┃▒▒▒┃CHA:  08-1┃12
┃▒▒▒▒▒▒░▒▒░▒▒▒▒┃▒▒▒▒▒▒▒▒░▒▒▒┃ATT:    16┃13
┃▒▒▒▒▒▒┃▒▒┃▒▒▒▒░▒▒▒▒▒▒▒▒┃▒▒▒┃DM: 1d12+3┃14
┣━━░━━━╋━━┻━━░━╋━━━━░━━━╋━━░┃AC:     15┃15
┃▒▒▒▒▒▒┃▒▒▒▒▒▒▒┃▒▒▒▒▒▒▒▒┃▒▒▒┃XP: 004164┃16
┃▒▒▒▒▒▒░▒▒▒▒▒▒▒░▒▒▒▒▒▒▒▒┃▒▒▒┣━━━━━━━━━━┫17
┣━━░━━━╋━━░━━━━┫▒▒▒▒▒▒▒▒░▒▒▒┃Sword 2H..┃18
┃▒▒▒▒▒▒░▒▒▒▒▒▒▒░▒▒▒▒▒▒▒▒┃▒▒▒┃Plate.....┃19
┣━━━━━━━━━━━━━━━━━━━━━━━┻━━━┃Helmet....┃20
┃You enter the caves of     ┃..........┃21
┃Zinagan.                   ┃..........┃22
┃                           ┃..........┃23
┃                           ┃..........┃24
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━┛25
```
