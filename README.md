# Things 3 --> Makerlog
A tool to log [Things 3](https://culturedcode.com/things/) completed items to [Makerlog](https://getmakerlog.com).

## Intended "versions"
_The amount of these that get completed will depend on its initial use by me and the community; I likely won't do all of them unless it's used or heavily requested._
+ [x] proof-of-concept simple version
+ [x] ~add hard-coded conditions (area/project/tags)~ _not really done, as I leap-frogged this step; I could go back (and may need to)_
+ [ ] version with persistent storage (other than properties in a `.scpt` file, which compiles as binary)
  + would like to distribute as `.applescript`, but they [compile at runtime](https://en.wikipedia.org/wiki/AppleScript#Script_launchers), which should mean that its [properties don't persist](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/conceptual/ASLR_variables.html#//apple_ref/doc/uid/TP40000983-CH223-SW2).
  + perhaps a version that is the script as a text file, but with options and instructions to compile from source ()
    + e.g., `osacompile -o MyScript.app MyScript.scpt` directly into the Things Scripts directory
+ [ ] tool with some user-friendly setup (script to get API keys, set params)
+ [ ] get tasks completed since last run (instead of just in the current day)
+ [ ] map to Makerlog product/hashtag (using Things 3 area, project, tag or global setting)
+ [ ] UI to review tasks (with checkboxes) before submitting
+ [ ] ...tbd


## Installation

- [ ] _[internal]_ decide which of these installation methods to create (first)
  - **simple AppleScript or shell script:** installation and trigger method left up to user
    - potentially also include help in installation, whether instructions or an installation script, of sorts
    - this could/should be installed [in the Things 3 menubar](https://support.culturedcode.com/customer/en/portal/articles/2803572-using-applescript-with-things#add-scripts-to-your-menu-bar)
      - provide shell script to make this easy
        - `osascript -e 'quit app "Things3"'`
        - `$ curl -o ~/Library/Containers/com.culturedcode.ThingsMac/Data/Library/Application\ Support/Cultured\ Code/Things\ Scripts --create-dirs raw.githubusercontent....`
        - `open -a Things3.app`

  - **executable:** perhaps simply deployed via Automator. (AppleScript steps, bundled as app)
  - **proper mac app:** would give good intro to developing for macOS, but overkill (at least with current intended feature set)


### Dependencies
**none!** 🎉  

...well, that's not entirely true. _Technically_, this requires:
+ [Things 3](https://culturedcode.com/things/) (_on macOS, specifically_)
+ [AppleScript](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/introduction/ASLR_intro.html)

## Known limitations
+ does not distinguish between areas/projects/etc. of the same name
+ the Makerlog API could change at any time

## Contributing/feature requests/etc.
+ Please use native [GitHub issues](/issues) for sending feature requests, bug reports, etc.  
+ If you prefer not to use GitHub, you can [tweet](https://twitter.com/intent/tweet?url=https%3A%2F%2Fgithub.com%2Fandyconlin%2Fthings3ToMakerlog&text=@andyconlin%2C%20here%20is%20a%20feature%20request%20for%20Things%203%20--%3E%20Makerlog%3A%20) me [@andyconlin](https://twitter.com/andyconlin)
+ If you don't use GitHub or Twitter..._tbd_


## License
License details can be found [here](LICENSE.md).
