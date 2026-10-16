Change log of `Keypirinha`_


v2.26 - 2020-11-08
==================

Application
-----------
* Fixed: trouble opening Google Chrome when configured as system default web
  browser (:issue:`474`)
* Fixed: drag and drop when ``single_click`` is enabled (:issue:`458`)
* Fixed a mouse move event that occurred when ``single_click`` is enabled even
  though the mouse was not being moved (:issue:`394` and :issue:`444`)

Calc package
------------
* Fixed the display of scientific values (:issue:`473`)

Docs
----
* Modified inline documentation of the default ``Keypirinha.ini`` file by adding
  missing info about the ``normal`` font style in section ``[theme/Default]``
  (:issue:`433`)


v2.25 - 2020-05-25
==================

Application
-----------
* Longer delay before writing catalog file (might help in fixing :issue:`377`;
  delay changed from 5 to 15 seconds)
* Limit applied to pasted text increased from 512 to 8192 characters
* Slightly improved stability

GUI
---
* Fixed: satellite icon was not updated during the "args" step of the search
  (:issue:`399`)

Calc package
------------
* Fixed: ``'module' object is not callable`` error of ``rand()`` (thanks
  :ghu:`caltaojihun`)
* Fixed: Calc plugin was getting triggered with some URLs containing an ``=``
  sign for instance (:issue:`407`; thanks :ghu:`DrorHarari`)
* Fixed a bug that would make the plugin to produce a lot of log messages

FilesCatalog package
--------------------
* Added directory browsing functionality (:issue:`270`; thanks :ghu:`maykot`)
* Allow to open items with a custom command (thanks :ghu:`fran-f`)

String package
--------------
* Added *Unescape* conversion (thanks :ghu:`alexandr-san4ez`)
* Added *Slug Case* conversion (:issue:`445`; thanks :ghu:`marcus-at-localhost`)

WinSCP package
--------------
* Allow custom path to ``WinSCP.ini`` file (:issue:`263`; thanks :ghu:`sam97`)
* Support workspaces (:issue:`420`; thanks :ghu:`sam97`)

API
---
* Fixed: ``CatalogItem.data_bag`` property was not updated upon a call to
  ``Plugin.set_catalog`` when a similar item was existing already (:issue:`438`)
* Fixed: ``PathShellFilter has no attribute name`` (:issue:`275`)
* Internal CPython interpreter upgraded from v3.6.7 to v3.7.4
* Memory allocation bug fixing for Python objects


v2.24 - 2019-08-18
==================

Application
-----------
* The following warning message will be printed in the console when a
  ``.keypirinha-package`` file could not be read as a Zip archive:
  ``Failed to load/read what appears to be a package file`` (:issue:`368`)

GUI
---
* Fixed hard-coded minimum font size has been lowered from 8 to 6 points
  (:issue:`355`)
* Allow more space for the search text when an item is selected (:issue:`364`)

Bookmarks package
-----------------
* Added support for *Falkon* web browser (formerly *QupZilla*;
  thanks :ghu:`nuno-andre`)
* Fixed erroneous detection of the encoding of some files (a.k.a. the
  "unicode / charmap" bug; :issue:`336`, :issue:`375`, :issue:`396`)

Calc package
------------
* Added support for (persistent) variables (:issue:`354`; thanks
  :ghu:`DrorHarari`)
* Fixed value type conversion bug when using ``gcd`` function for instance
  (:issue:`367`; thanks :ghu:`dreadnaut`)

Everything package
-------------------
* Added inline documentation and extra search example in default configuration
  file (thanks :ghu:`DrorHarari`)

FilesCatalog package
--------------------
* Fixed handling of the ``attr: directory`` filter (:issue:`388`)

String package
--------------
* Added multiple case conversion features (thanks :ghu:`DrorHarari`)

URL package
-----------
* Added support for extra TLDs ``.test``, ``.example``, ``.invalid`` and
  ``.localhost`` (:issue:`359`; thanks :ghu:`dreadnaut`)

Docs
----
* ``Keypirinha.ini``: added theme's colors descriptions as inline documentation
  (:issue:`382`; thanks :ghu:`imswebra`)
* ``Keypirinha.ini``: default value of the ``show_on_taskbar`` setting was
  incorrectly documented as ``no`` whereas it is hard-coded as ``yes`` in the
  application (:issue:`383`)
* Referenced third-party packages in :doc:`contributions` and :doc:`theming`
  (including :issue:`345`; thanks community!)

API
---
* ``PyJWT`` package is now part of Keypirinha's Python Library


v2.23 - 2018-11-14
==================

Application
-----------
* Fixed a bug that prevented search terms with special characters like ``=``,
  ``-`` or ``+`` to be matched (:issue:`343`)

GUI
---
* Fixed: pressing ``Alt+Left`` to step back (or ``Backspace`` from Actions list)
  was sometimes jumping to initial search step even though there were arguments
  specified
* Fixed: the number of available actions for the selected item was not always
  displayed

Docs
----
* Added documented examples to :doc:`packages/filescatalog`
* Referenced third-party packages in :doc:`contributions` (thanks community!)
* Documented :kbd:`Ctrl+1` and :kbd:`Ctrl+Numpad1` in the :doc:`keyboard`
  chapter (:issue:`326`)

API
---
* Embedded Python interpreter upgraded from v3.6.3 to v3.6.7


v2.22.1 - 2018-11-03
====================

* Reverted the change made in v2.22 regarding :issue:`332` since it impacted the
  ``Open as Administrator`` action


v2.22 - 2018-11-01
==================

Application
-----------
* The Catalog of each Package can now be refreshed individually via either the
  context menu or by executing the new items
  ``Keypirinha: Refresh Catalog: AnyPackageName`` populated by the ``Internal``
  package (:issue:`156` partly)
* Fixed a bug that would prevent the last used GUI application to get back the
  focus (:issue:`332`)
* Fixed a bug that would very rarely prevent a message to be transmitted to a
  plugin

GoogleTranslate package
-----------------------
* Fixed: suggested items could not be executed (:issue:`333`)

API
---
* ``chardet`` library upgraded from v2.3.0 to v3.0.4
* ``comtypes`` library upgraded from v1.1.3 to v1.1.7 (:issue:`335`)
* ``natsort`` library upgraded from v5.0.3 to v5.4.1


v2.21 - 2018-10-12
==================

GUI
---
* The ``control_margin``, ``textbox_padding`` and ``listitem_padding`` settings
  now accept a pair of values to differentiate horizontal and vertical spacing
  (:issue:`325`)

API
---
* Fixed: a ``CatalogItem`` with a ``REQUIRED`` ``args_hint`` could still be
  executed with no argument in some cases (:issue:`328`)


v2.20 - 2018-10-09
==================

Application
-----------
* Added the ``font_snormal_size``, ``font_snormal_style`` and
  ``listitem_title_font`` settings for GUI theming (:issue:`327`)
* Added the ``write_log_file`` setting to help improving privacy
* Search algorithm modified to be more strict in matching acronyms
  (:issue:`320`)
* ``.history`` and ``.catalog`` files are now written into a temporary file
  first before overwriting the target file in order to limit the risk of data
  corruption (:issue:`321`)
* The type of the ``retain_last_search`` setting changed so that it can accept
  ``unselected`` as a value (backward compatibility is preserved; :issue:`319`)

TaskSwitcher package
--------------------
* Added the ``proc_name_first`` and ``show_app_icons`` settings (thanks
  :ghu:`AngelEzquerra`)

WebSearch package
-----------------
* Added ``MDN`` to predefined search sites (thanks :ghu:`dreadnaut`)
* Added ``npm`` to predefined search sites (thanks :ghu:`m0xx`)

Docs
----
* :doc:`configuration` chapter improved
* :doc:`first` chapter corrected and slightly improved
* Corrected misleading sentence in :doc:`faq` (:issue:`318`)
* Minor corrections

API
---
* :doc:`api` chapter reviewed. Applied minor corrections to the documentation of
  the :py:mod:`keypirinha` and :py:mod:`keypirinha_util` modules
* Keypirinha's *Python Lib* now has got its own source code repository to ease
  contributions at: https://github.com/Keypirinha/PythonLib
  (:issue:`75`)


v2.19 - 2018-09-13
==================

Application
-----------
* Added the ``config_editor`` setting so that Keypirinha's configuration files
  can be edited with a specific text editor (:issue:`264`)
* Added: ``satellite_size`` setting now accepts the ``superjumbo`` value to
  render 256x256 icon (:issue:`298`)
* Added support for environment variables notation like ``%USERNAME%`` in the
  ``portable.ini`` file (:issue:`315`)
* Added the ``loop_list`` setting (:issue:`301`)
* Fixed: the satellite icon was not always positioned and scaled properly in
  HiDPI (:issue:`210`)
* Fixed: the ``space_as_tab`` setting is now ignored unless the caret is at the
  end of the search terms while the :kbd:`Space` key is pressed
* Fixed: :kbd:`Ctrl+BackSpace` did not erase anything when the text box
  selection was not empty (:issue:`302`)
* Fixed: ``color_title`` value was overwritten by ``color_foreground``
  internally (:issue:`316`)
* Fixed: ``color_status`` value was overwritten by ``color_faded`` internally
  (:issue:`316`)
* Fixed: Keypirinha should now be able to run from a shared folder or a mounted
  network drive (Python failed to initialize from a UNC path; :issue:`267`)
* Minor improvements

FilesCatalog package
--------------------
* Fixed: the ``PathShellFilter has no attribute name`` error that was occuring
  in some configuration cases (:issue:`275`)
* Fixed: the ``string index out of range`` error that could occur when a
  ``paths`` value contains a recursive search inside a drive letter only
  (:issue:`314`)

String package
--------------
* Added ``String: Base64`` item (base64 encoder/decoder; thanks to
  :ghu:`alexandr-san4ez`)

API
---
* :py:func:`keypirinha_wintypes.get_known_folder_path` accepts known folder's
  name

Docs
----
* Referenced several third-party packages in :doc:`contributions` (thanks
  community!)
* Referenced the theme builder made by :ghu:`Fuhrmann` in :doc:`theming`
  (thanks!)
* Corrections and improvements


v2.18.2 - 2017-11-13
====================

* Removed a visual glitch that would make the old content of the edit control of
  the LaunchBox still visible when the LaunchBox is invoked
* Fixed: the edit control of the LaunchBox was not always entirely drawn
  (:issue:`262`)


v2.18.1 - 2017-11-12
====================

Application
-----------
* Edit controls: removed some occasional visual glitches
* Edit controls: added support for the conventional :kbd:`Ctrl+Shift+...`
  shortcuts to extend selection (:issue:`260`)
* Edit controls: improved the handling of the :kbd:`PageDown` and :kbd:`PageUp`
  events (:term:`Console` and :term:`Diagnostic Window`)

Calc package
------------
* Show the width of binary results in item's description


v2.18 - 2017-11-08
==================

Application
-----------
* Added the ``word_separators`` setting
* Fixed the handling of the ``file_explorer`` setting: ``{{dir_or_parent}}`` and
  ``{{dir_or_parent_q}}`` placeholders were not expanded
* Fixed: ``show_on_taskbar = no`` was not honored anymore since v2.17
  (:issue:`259`)
* Minor improvements


v2.17 - 2017-11-03
==================

Application
-----------
* If the *Paste* hotkey (``hotkey_paste`` setting) is pressed twice in a row,
  the selected item will be executed without having to press :kbd:`Enter`
* Added a *Diagnostic Window*, accessible by pressing :kbd:`F3` from the
  LaunchBox, via the main menu, or by executing the
  ``Keypirinha: Diagnostic Window`` item
* Desktop and Start Menu items are not automatically refreshed anymore if
  Keypirinha is installed in the Desktop or Start Menu folder (:issue:`229`)
* Invoking the LaunchBox does not bring back the Console to front anymore
* ``Edit`` generic action added for FILE items. It makes use of the ``editor``
  setting if possible.

FileBrowser package
-------------------
* Fixed: the plugin will not try to make suggestions from input ``::``

FilesCatalog package
--------------------
* **IMPORTANT:** the default filtering behavior has changed in order to be more
  intuitive (:issue:`253`, :issue:`254`)
* **IMPORTANT:** the ``regex`` property of the ``filters`` setting now matches
  the **full path** by default
* The ``filters`` setting accepts new properties: ``case`` and ``nodrive``

URL package
-----------
* Minor improvements

WebSearch package
-----------------
* Added the ``multi_url_delay`` setting to help ensuring multiple URLs are
  opened in order

API
---
* :py:attr:`keypirinha.Events.DESKTOP` and
  :py:attr:`keypirinha.Events.STARTMENU` events are not sent anymore in case
  Keypirinha is installed in one of the Desktop or Start Menu folders
  (documentation updated)
* The generic ``globex.py`` and ``filefilter.py`` modules embedded in the
  ``FilesCatalog`` package are now distributed with Keypirinha and are usable
  by any plugin


v2.16.3 - 2017-10-26
====================

Application
-----------
* Added the generic action ``Edit`` for FILE items. It uses Keypirinha's
  ``editor`` setting to open the selected item, or by default, tries to execute
  the item with Shell's ``edit`` verb.
* File path of items is not fully normalized internally anymore (:issue:`252`)

FilesCatalog package
--------------------
* An ``on_imported`` function can be implemented in the
  :file:`filescatalog_user_callbacks.py` module so it is possible to implement
  init routine
* Fixed: *python_callback* setting


v2.16.2 - 2017-10-23
====================

Application
-----------
* The ``--show`` command line argument will also launch the application if it is
  not already running

FilesCatalog package
--------------------
* Fixed: it was not possible to specify arguments to the items of this package
* Fixed: catalog was not always refreshed when settings were modified at runtime


v2.16.1 - 2017-10-22
====================

Application
-----------
* Fixed the ``Explore...`` actions and the default action to open DIR items
  (:issue:`248`)

FilesCatalog package
--------------------
* Improved inline/online documentation


v2.16 - 2017-10-20
==================

**NEW PACKAGE:** :doc:`packages/filescatalog`

Application
-----------
* Added support of a ``portable.ini`` file to manually specify the location of
  the ``portable`` directory (see :doc:`install` for more info; :issue:`233`)
* Added support of the ``--show`` and ``--hide`` command line arguments
  (:issue:`237`)
* Added predefined configuration variables ``APP_DRIVE`` and ``APP_ARCH`` (see
  :doc:`configuration`; :issue:`240`)
* Minor optimizations
* Fixed: the ``Browse Profile Dir`` menu/item now uses the ``file_explorer``
  setting
* Fixed: the :kbd:`Ctrl+Del` shortcut did not work in History Mode
* Fixed: the results list was not refreshed when an item was removed from the
  history in History Mode
* Fixed: configuration files were not loaded when the character ``$`` was used
  in any value of the ``[var]`` section (:issue:`235`)
* Fixed: Keypirinha failed to parse system's proxy settings if no proxy scheme
  was specified. Proxy scheme now defaults to HTTP and a warning message is
  emitted to the console (:issue:`243`)

Apps package
------------
* The ``extra_paths`` setting has been obsoleted by the new
  :doc:`packages/filescatalog`. It is still supported but is not documented
  anymore in the default configuration file and will not receive any further
  improvement.
* More informational messages

FileBrowser package
-------------------
* Fixed support for UNCs (:issue:`212`)

GoogleTranslate package
-----------------------
* Fixed: only the translation of the first sentence was shown when multiple
  sentences were to translate. Thanks to :ghu:`alexandr-san4ez` (:issue:`234`,
  :packpr:`5`)

API
---
* Fixed: :py:func:`keypirinha_util.execute_default_action` now opens directories
  using the ``file_explorer`` setting (:issue:`241`)
* Embedded Python interpreter upgraded from 3.6.0 to 3.6.3
* Updated documentation chapter: :doc:`api/python`


v2.15.4 - 2017-08-27
====================

Application
-----------
* Added the `hotkey_history` setting to the LaunchBox can be shown directly in
  History mode (:issue:`220`)
* :kbd:`Ctrl+Home` and :kbd:`Ctrl+End` respectively allow to jump to the top and
  the bottom of the results list (:issue:`223`)
* Multi-lines text pasted in the LaunchBox will be converted to a single line
  like it is the case already for the ``hotkey_paste`` feature (:issue:`228`)

Calc package
------------
* Added the ``base_conversion`` setting (:issue:`219`)

FileBrowser package
-------------------
* Added support for UNCs (:issue:`212`)
* Recently typed paths in Windows Explorer's address bar are now shown as you
  type. See the new ``show_recents`` setting for more info.

GoogleTranslate package
-----------------------
* Added ``idle_time`` setting. Thanks to :ghu:`alexandr-san4ez` (:packpr:`5`)

String package
--------------
* Added the ``Case Conversion`` feature to change the case of a string. Thanks
  to :ghu:`alexandr-san4ez` (:packpr:`3`)

URL package
-----------
* Suggest ``https`` URL in addition to ``http`` when no scheme is specified

WebSuggest package
------------------
* Offer to search on website even if no suggestion has been returned by the
  provider. Thanks to :ghu:`alexandr-san4ez` (:packpr:`4`)
* Added ``idle_time`` setting. Thanks to :ghu:`alexandr-san4ez` (:packpr:`4`)


v2.15.3 - 2017-07-19
====================

* Fixed: the score of a suggested item was not boosted anymore (:issue:`217`)


v2.15.2 - 2017-07-19
====================

Application
-----------
* Search algorithm is more accurate in some cases
* Added the ``exclude_nonexistent_local_files`` setting (:issue:`216`)
* Fixed: acronym matches were not pushed up in the results list anymore
  (:issue:`215`)
* Fixed: system error messages could popup due to missing files, typically when
  Keypirinha was used across several machines (:issue:`206`)
* Fixed: the satellite icon was not always positioned and scaled properly in
  HiDPI (:issue:`210`)

Everything package
------------------
* Fixed: Everything application could not be requested on 32-bit machine
  (:issue:`205`)

WebSearch package
-----------------
* Added Ecosia search site (:issue:`211`)


v2.15.1 - 2017-05-10
====================

Application
-----------
* Added the ``file_explorer`` setting (:issue:`62`, :issue:`173`)
* All orphan items are filtered-out of the search (only history items were)
* Search algorithm is slightly more accurate
* Fixed: Keypirinha can be launched from a network drive (:issue:`190`)
* Fixed: the satellite icon was positioned nearby the top-left corner of the
  screen in some cases

Docs
----
* :doc:`packages/websuggest`: referenced :ghu:`bege10`'s config for German
  suggestions. Thanks! (:issue:`189`)
* Minor corrections in :doc:`api`
* Minor corrections in :doc:`keyboard`
* Minor corrections in the default ``Keypirinha.ini`` file (``[theme/Default]``
  section)


v2.15 - 2017-04-26
==================

Application
-----------
* Search algorithm is slightly faster
* Search algorithm is more accurate in some cases
* Added the ``Explore Final Path`` action for ``FILE`` items (:issue:`179`)
* Special shell links (``.lnk`` files) that link directly to Shell Objects like
  the Recycle Bin for example, are now launchable (:issue:`177`)
* Fixed: no keyword association would occur in some cases, when arguments were
  added to an item
* GUI: item's hits and actions are both visible when both ``list_hits`` and
  ``list_actions`` flags are specified for the ``layout`` setting
* Fixed a GUI glitch: the height of the LaunchBox was not readjusted when the
  font size of the title changed (:issue:`175`)
* Fixed a GUI glitch: the LaunchBox was not erased properly when moved/resized
  (:issue:`178`)

FileBrowser package
-------------------
* Automatically expands environment variables, like in
  ``%USERPROFILE%\Documents`` (documentation updated:
  :doc:`packages/filebrowser`)

Docs
----
* :doc:`theming` chapter simplified and new ``PurpleNightColors`` theme
  referenced
* Added reference to ``ClearLight`` theme in :doc:`theming`. Thanks
  :ghu:`bege10`! (:issue:`180`)
* ``DictLeo`` package unreferenced from :doc:`contributions` (:issue:`181`)

CAUTION
-------
* The ``list_score`` flag of the ``layout`` setting is deprecated, result's
  score is not shown on the GUI anymore (:issue:`182`)


v2.14.1 - 2017-04-14
====================

Application
-----------
* On some keyboards, the use of the ``Right Alt`` key while typing in the
  LaunchBox could simulate a ``Ctrl+1``, ``Ctrl+2``... shortcut
* Fixed: satellite icon was not always updated during a search (:issue:`174`)

Calc package
------------
* Allow expressions with mixed types like ``0x2a + .5``
* Always try to do base conversion on integer results. In the previous versions,
  the decimal part in result ``1.0`` for example, prevented conversion even
  though the value itself could be considered as an integer


v2.14 - 2017-04-12
==================

GUI
---
* Added :doc:`theming` support:

  * Theme can be changed via the new ``theme`` setting (``[gui]`` section)
  * Themes are cascadable
  * Opacity of the LaunchBox can be changed
  * Font faces, sizes and styles can be changed
  * Colors are specified with CSS syntax
  * GUI elements can be hidden (satellite icon, status bar, scroll bar,
    selection mark, results icons, score and history hits)
  * The satellite icon can be hidden, resized or embedded into the LaunchBox
  * Check out the :doc:`theming` chapter

* Added the ``auto_width`` setting
* :kbd:`F2` key opens the Console
* Single-click mode support (:issue:`80`)
* Items can be launched directly using the :kbd:`Ctrl+Numpad0` to
  :kbd:`Ctrl+Numpad9` shortcuts, or :kbd:`Ctrl+0` to :kbd:`Ctrl+1`
* ``max_height`` default value changed to ``10`` (was ``0``)
* ``max_height`` setting is not honored anymore in maximized state. The
  LaunchBox will use the full height of the screen minus system's taskbar if any
* The :kbd:`Alt` modifier, when used in the ``hotkey_run`` setting
  (e.g. :kbd:`Alt+Space`) should not be an issue anymore (:issue:`162`)

CAUTION
-------
* ``space_as_tab`` default value changed to ``no``
* The following settings from the ``[gui]`` section **have been obsoleted** in
  favor of the ``[theme/*]`` sections: ``compact_results``, ``show_scores``,
  ``show_history_hits`` and ``font_size``.
  Please review your config file(s), Keypirinha will issue a warning message in
  the console for each one of them until they are not used.


v2.13 - 2017-03-24
==================

New Packages
------------
* :doc:`packages/env`
* :doc:`packages/string`

Application
-----------
* Renamed the ``Configure Application`` contextual menu item to
  ``Configure Keypirinha`` (:issue:`170`)
* Renamed the ``Keypirinha: Configure Application`` catalog item to
  ``Keypirinha: Configure`` (:issue:`170`)

GoogleTranslate package
-----------------------
* Fixed: lang codes were included in copied result (:issue:`168`)

API
---
* Added the ``comtypes`` library to allow plugins to deal more easily with
  system's ``COM`` interfaces (thanks to :ghu:`ueffel`)
* Updated ``natsort`` from version ``5.0.1`` to ``5.0.2``
* Fixed: import error in :py:func:`keypirinha_wintypes.get_known_folder_path`


v2.12.1 - 2017-03-18
====================

GoogleTranslate package
-----------------------
* Fixed: special grammar was included in translation (:issue:`165`)


v2.12 - 2017-03-17
==================

Application
-----------
* Keypirinha is now available on both 32-bit and 64-bit platforms
* Fixed: some (un)installers were being launched randomly at search time
  (:issue:`108` and :issue:`164`)

Everything package
------------------
* A folder being browsed can be opened using item ``.``

FileBrowser package
-------------------
* Pasting a full path of a folder and directly pressing :kbd:`Enter` now opens
  the folder itself (i.e. the ``.`` item), instead of the first found file

GoogleTranslate package
-----------------------
* Several translations may be returned for a single query
* Translated text is now located in item's label so it can be read even when the
  ``compact_results`` global setting is enabled
* Fixed: items properties were not updated correctly when a non-default item was
  declared (:issue:`157`)

WebSuggest package
------------------
* Use the English domain ``en.wikipedia.org`` by default to avoid argument
  encoding problems (:issue:`158`)

API
---
* Embedded Python interpreter upgraded from 3.5.2 to 3.6.0
* :py:func:`keypirinha.arch` now returns ``x86`` instead of ``x32``.
  ``x64`` value remains unchanged.
* :py:func:`keypirinha_util.read_link` now also returns the ``flags`` and
  ``is_msi`` fields
* :py:func:`keypirinha_util.shell_execute` avoids introspecting shortcut files
  created by an MSI installer


v2.11 - 2017-02-06
==================

New Packages
------------
* :doc:`packages/googletranslate`
* :doc:`packages/websuggest`

Application
-----------
* An item can be launched while its parent plugin is still refreshing its
  Catalog (:issue:`52`)

Documentation
-------------
* Table of contents restructured

API
---
* :py:class:`keypirinha_net.UrllibOpener` implements ``__setattr__`` to fully
  comply to :py:class:`urllib.request.OpenerDirector`'s interface. Allowing the
  setup of its ``addheaders`` member for example.


v2.10 - 2017-01-26
==================

Application
-----------
* Keypirinha now keeps its Catalog persistent and up-to-date using a local
  per-machine file, which makes Keypirinha usable even right after a restart,
  while plugins are still gathering their items (:issue:`22`)
* Orphan items (of which parent package is not loaded) are not displayed in the
  result lists anymore but are still kept in history (:issue:`60`)
* Added the ``Remove Orphans`` action, accessible via either its item or the
  main contextual menu.
* The ``Unloaded package: X`` message is now logged when a package
  file/directory has been deleted
* Fixed: environment variables in shortcut arguments are now expanded
  (:issue:`149`)
* Fixed: the ``Configure Package`` sub-menu is now correctly updated when a
  package is marked as ignored
* Fixed the incorrect detection of the encoding of the configuration files that
  could occur in rare cases (UTF-16 BOM)

Apps package
------------
* Catalog is automatically updated when the content of the Start Menu or the
  Desktop changes. Typically when an application has been (un)installed.
* More fine-grained control on what is updated. The package does not refresh its
  full catalog if only Desktop's content has changed for example.

Calc package
------------
* Fixed a bug appeared in v2.9.10 that pushed an incorrect result for some
  expressions like ``40/2`` due to too aggressive result formatting
  (:issue:`153`)

WebSearch package
-----------------
* Default configuration file does not overwrite user's default ``incognito``
  setting for ``predefined_site/`` sections anymore

API
---
* Plugins are now notified about any change in user's Desktop or Start Menu via
  the :py:meth:`keypirinha.Plugin.on_events` method, using the new
  :py:attr:`keypirinha.Events.DESKTOP` and
  :py:attr:`keypirinha.Events.STARTMENU` flags
* Extended documentation of :py:class:`keypirinha.ItemCategory`
* :py:func:`keypirinha_util.read_link` now also returns the
  ``expanded_params_list`` field
* Improved documentation of :py:mod:`keypirinha` and :py:mod:`keypirinha_util`
  modules (corrections and minor additions)


v2.9.10 - 2017-01-14
====================

Application
-----------
* Added the ``F5`` keyboard shortcut to full refresh the Catalog (:issue:`79`)
* Added the ``N workers active`` message in the status bar to indicate any
  plugin activity, like cataloging, suggesting, ...
* Fixed a CPU-eating bug that occurred right after the launch of an item
  (:issue:`146`)
* Fixed: in some cases, the best available icon resource from an executable file
  was not always chosen to render the "big icon" on the LaunchBox (:issue:`143`)
* Fixed a bug that prevented to move a hotkey sequence from one setting to an
  other in some cases

Apps package
------------
* Added the ``scan_desktop`` setting (:issue:`137`)

Calc package
------------
* Thousand separated results are now added to the list.
  The thousand separator is deduced from the ``decimal_separator`` setting.
* Fixed: do not show results like ``100,`` when ``decimal_separator`` is set to
  ``comma``

Documentation
-------------
* Updated the :doc:`contributions` chapter


v2.9.9 - 2016-11-22
===================

Application
-----------
* Fixed a bug that prevented the use of the "Predefined variables" listed in
  :doc:`configuration`, in the configuration files
* The noisy error messages ``Failed to get path of KnownFolder ...`` are only
  printed when they should (i.e. when the OS should actually support the given
  Known Folder)

RegBrowser package
------------------
* Fixed :issue:`135`: could not open registry values in regedit (i.e. only keys)

WebSearch package
-----------------
* Fixed :issue:`136` implied by an unexpected behavior of the API (see below)

Documentation
-------------
* :doc:`keyboard` chapter more readable

API
---
* Fixed :issue:`136`: :py:func:`keypirinha_util.web_browser_command` produced an
  invalid result in case of an unknown web browser or when the command line
  specified in the ``web_browser`` setting was quoted.
  This prevented the WebSearch package to work properly.
* :py:func:`keypirinha_util.shell_execute` reads a quoted command line properly
  from the ``terminal`` setting


v2.9.8 - 2016-11-20
===================

RegBrowser package
------------------
* Added the ``Copy full path``, ``Copy parent's path`` and ``Copy value``
  actions (thanks :ghu:`ueffel`)

WebSearch package
-----------------
* If a search site is assigned several URLs, they will be launched altogether if
  the configured/detected web browser supports it (Chrome, Firefox, Iridium,
  Opera, Palemoon, Vivaldi). Edge and Internet Explorer do not support this.
  Note that the ``web_browser_new_window`` option must probably be disabled to
  allow this to be taken into account by the browser (with Chrome at least).

API
---
* :py:func:`keypirinha_util.file_attributes` evaluates only ``*.lnk`` files as
  ``LINK`` (:issue:`132`)
* :py:func:`keypirinha_util.shell_execute` tries to resolve executables by their
  name, if needed, using current ``PATH`` (:issue:`134`)
* :py:func:`keypirinha_util.web_browser_command` can handle the launch of
  several URLs altogether if supported by the configured/detected web browser


v2.9.7 - 2016-10-10
===================

General Notes
-------------
* WinReg package renamed to :doc:`packages/regbrowser`.
  This doesn't impact its use.

Application
-----------
* Added the :kbd:`Shift+Enter` shortcut to execute an item without closing the
  LaunchBox, and reset the search (:issue:`122`)
* Added the :kbd:`Ctrl+Shift+Enter` shortcut to execute an item without closing
  the LaunchBox, and go back to the initial step of the current search
  (:issue:`122`)
* Added a *launch-and-paste* hotkey so the content of the clipboard is pasted to
  the LaunchBox when shown (see the new ``hotkey_paste`` setting; :issue:`123`)
* Catalog's insertion speed and memory usage have been improved

RegBrowser package
------------------
* Show the currently selected key so it can be opened instead of having to open
  a subkey
* Show the "(Default)" value

WebSearch package
-----------------
* Added ``Bitbucket`` and ``GitHub`` to the list of predefined search sites

API
---
* Overhaul of the :py:mod:`keypirinha_wintypes` module
* :py:class:`keypirinha.CatalogItem` comparison operators have been improved and
  ``__hash__`` uses the internal unique id of the item.


v2.9.6 - 2016-09-29
===================

General Notes
-------------
* New :doc:`packages/regbrowser`
* Software Development Kit (SDK) is now available at:
  https://github.com/Keypirinha/SDK
* Packages repository is now public and open to contributions at:
  https://github.com/Keypirinha/Packages

Application
-----------
* Added the ``[network]`` section in application's configuration file, that can
  now be used by the plugins through the new network-dedicated API
* Got rid of the ``Test`` package that has been obsoleted by the SDK
* Do not log anymore the message: ``Monitors configuration changed.``
* Fixed :issue:`124` where configuration could not be edited with an other
  editor than the default one and when the paths to the files to edit contain
  space character(s)

Apps package
------------
* Added the ``elevated`` setting to the *Custom Commands* feature

Bookmarks package
-----------------
* Added support for the Iridium browser

FileBrowser package
-------------------
* Fixed: command switch ``/`` was always changed to ``\`` (:issue:`119`)

FileZilla package
-----------------
* Referenced ``FileZilla`` executable can now be passed arguments when executed
  (:issue:`126`)

PuTTY package
-------------
* Referenced ``PuTTY`` executable can now be passed arguments when executed
  (:issue:`126`)

RegBrowser package
------------------
* New package!
  More info: :doc:`packages/regbrowser`

WebSearch package
-----------------
* Added ``Baidu`` and ``Qwant`` to the list of predefined search sites

WinSCP package
--------------
* Referenced ``WinSCP`` executable can now be passed arguments when executed
  (:issue:`126`)

API
---
* Added network support (see: :py:mod:`keypirinha_net`)
* Plugins now get notified about network settings changes with the
  :py:attr:`keypirinha.Events.NETOPTIONS` event passed to the
  :py:meth:`keypirinha.Plugin.on_events` method.
* Rules for package naming are slightly more strict. See the :doc:`packages`
  chapter for more info
* :py:func:`keypirinha_util.read_link` now also return the ``runas`` field
* :py:func:`keypirinha_util.shell_execute` tries to execute the target with
  elevated privileges if it is a shell link that has got the related option
  enabled (:issue:`120`)
* :py:class:`keypirinha.IconHandle`: ``is_init()`` deprecated in favor of the
  standard ``__bool__()`` operator
* Updated ``natsort`` package from version ``4.0.4`` to ``5.0.1``
* Documentation format corrections


v2.9.5 - 2016-09-10
===================

Application
-----------
* Fixed the *Explore* action that did not work for some items :issue:`118`
* Fixed a bug that crashed the application when trying to :kbd:`Backspace` from
  the *Action* step, after doing a :kbd:`Ctrl+Enter`

Apps package
------------
* Corrected the documentation of the *Custom Commands* feature in the
  configuration file (i.e. placeholders format)


v2.9.4 - 2016-09-08
===================

**CAUTION**
-----------
* ``KNOWNFOLDER_...`` configuration values now expand to the final path of the
  known folder. Former values (i.e. the GUIDs) can still be used via the new
  ``KNOWNFOLDERGUID_...`` variables.

Application
-----------
* Added the ``KNOWNFOLDERGUID_...`` predefined variables to configuration files
  (``[var] section``).
  Note that they replace the former ``KNOWNFOLDER_...`` variables which are now
  assigned the final path of their respective known folder.
  See the :doc:`configuration` chapter for more info.
* Fixed a bug that would prevent the LaunchBox to be resized properly when
  search is reset :issue:`113`
* Fixed a bug that would move the LaunchBox out of screen when using the
  ``persistent`` mode of the ``geometry`` setting :issue:`116`
* Fixed a bug that prevented history items to be loaded if they had a
  non-standard category ID
* Fixed a bug that appeared in 2.9.2 and prevented similar items from history to
  be added to the results list when no argument were typed

Apps package
------------
* Added the *Custom Commands* feature, which is similar to Launchy's Runner
  plugin, in a more flexible fashion

API
---
* Added the :py:func:`keypirinha_util.shell_resolve_exe_path` function
* :py:meth:`keypirinha.Settings.get`: ``unquote`` argument is ``False`` by
  default


v2.9.3 - 2016-08-25
===================

Application
-----------
* Fixed a bug that appeared in 2.9.2 and crashed the application when typing
  arguments to a selected item :issue:`112`


v2.9.2 - 2016-08-25
===================

Application
-----------
* Drastically optimized catalog search speed, most notably for big catalogs (up
  to 15 times faster)
* Drastically optimized catalog insertions/updates speed (up to 19 times faster)
  Note that this optimization only includes the **indexing** part of the catalog
  building process. It excludes the time taken by a plugin to actually build its
  list of items before pushing it to Keypirinha (for example, a list of files
  resulting from a hard-drive scan).
* Stability tested on large catalogs, containing up to 360,000 items

API
---
* Fixed a long-standing bug that prevented some resources to be found/loaded
  from a loose package :issue:`111`


v2.9.1 - 2016-08-23
===================

Application
-----------
* Search speed improved in some cases
* Application and packages are more permissive with file paths specified in
  configuration files that have unix-style separators (``/``) instead of
  windows-style ones (``\``)

Calc package
------------
* Added the ``rounding_precision`` setting
* Fixed: representation of floating point numbers :issue:`104`

Everything package
------------------
* Fixed: search items created by versions pre-2.9 were not working :issue:`106`

API
---
* Fixed :py:func:`keypirinha_util.shell_execute` that would fail if ``thing`` to
  execute was not a file (e.g. a URL) :issue:`107`
* :py:func:`keypirinha_util.file_attributes` inserts file path in exception's
  message (in case of error)


v2.9 - 2016-08-20
=================

Application
-----------
* Improved ``geometry`` setting for both LaunchBox and Console that also allows
  auto positioning according to current context: current working monitor, mouse
  current monitor or nearby mouse position. :issue:`50`
* Persistent geometry state for both LaunchBox and Console remembers positioning
  and sizing according to current monitors configuration. :issue:`39`
* LaunchBox's Y position is now automatically pushed up in order to have enough
  room to display at least one result item in case it was too low (only in
  *persistent* geometry mode)
* LaunchBox position is not forcefully restored to default anymore when user has
  moved it, until search is reset or window re-displayed
* LaunchBox now accepts the :kbd:`Alt+Left` shortcut to forcefully go back to
  the previous search step. The :kbd:`Alt+Right` shortcut is equivalent to
  :kbd:`Tab`. :issue:`97`
* LaunchBox displays the list of **history** items when :kbd:`Ctrl+Down` is
  pressed (or :kbd:`Down` if search state is clean) :issue:`45`
* ``.keypirinha-package`` files can now be updated at runtime :issue:`73`
* Fixed: Keypirinha does not rely on Windows' Shell anymore to get a folder
  icon and tries instead to get system's default from registry. :issue:`89`
* Keypirinha now tries to detect automatically the working directory of the
  launched applications :issue:`101`
* The ``editor``, ``terminal`` and ``web_browser`` application settings now
  accept shortcuts (link's arguments will be prepended to the extra ones
  specified in the setting value)
* Fixed a long standing bug that prevented Keypirinha to properly auto-detect
  configured editor's type (Atom, SublimeText, ...) via the ``editor`` setting

Calc package
------------
* Improved results readability: result is in item's label instead of its
  description
* Got rid of most common rounding precision problems that occured with floating
  point numbers :issue:`98`
* The ``=`` keyword can be specified as a prefix to query the plugin to evaluate
  the remaining of the typed string :issue:`93`
* Added the ``decimal_separator`` setting :issue:`70`
* Integer results are now automatically declined in multiple bases (i.e.
  decimal, hexadecimal, binary and octal)
* Currency formatting is now available (see the ``currency`` configuration
  section for more information)
* Added support for the ``bin()`` function :issue:`96`
* Added support for bitwise operators: ``|`` (or ``OR``), ``~`` (or ``XOR``) and
  ``&`` (or ``AND``)
* ``^`` is now an alias to the ``**`` (power of) operator
* Added support for Python's ``FloorDiv`` operator (``//``), also referred as
  *Integer Division*
* Added the ``ans`` constant that evaluates to the last valid result (reset to
  zero at Keypirinha's startup or when package is reloaded)
* Added support for Metric System suffixes (e.g. "K", "da", ...).
  See documentation for more info.
* Added support for suffixes of Orders of Magnitude of Data (e.g. "Ki", "Gi",
  ...). See documentation for more info.
* Upgraded the underlying Python module that is used to evaluate mathematical
  expressions (i.e. ``simpleeval``)

Everything package
------------------
* Added: predefined search patterns in the configuration file to ease the
  searches you do often (contributed by :ghu:`psistorm`) :issue:`94`

FileBrowser package
-------------------
* Added the ``follow_shell_links`` setting

TaskSwitcher package
--------------------
* Fixed a bug that prevented the plugin to show its suggestions when the
  ``always_suggest`` option was enabled :issue:`102`

WebSearch package
------------------
* Made the ``{plugin_name}`` format field less confusing (i.e. ``WebSearch``
  instead of ``WebSearch.WebSearch``)

Documentation
-------------
* Added the ``How to support the project?`` question to the :doc:`faq` list
* Added the ``Is it open source?`` question to the :doc:`faq` list
* Added the ``Current Developments`` section in main page
* Added new :doc:`contributions`: ``KiTTY``, ``Calc`` and ``Integrated Patches``
* Improved :doc:`packages/calc` chapter
* Added social buttons
* Corrections

API
---
* **Package Naming** rules are stricter
* Added the :py:meth:`keypirinha.Plugin.friendly_name` method
* :py:meth:`keypirinha.Plugin.name` has been deprecated in favor of
  :py:meth:`keypirinha.Plugin.full_name`
* :py:meth:`keypirinha.Plugin.package_name` has been deprecated in favor of
  :py:meth:`keypirinha.Plugin.package_full_name`
* :py:func:`keypirinha_util.read_link` also returns the ``show_cmd`` and
  ``icon_location`` properties
* :py:func:`keypirinha_util.shell_execute` has been refactored to handle the
  case where the ``terminal_cmd`` itself is a shell link and to automatically
  guess the ``working_dir`` value in case none has been specified :issue:`101`
* Fixed a rare bug that could occur in
  :py:func:`keypirinha_util.execute_default_action` in case the call to
  :py:func:`keypirinha_util.shell_execute` failed
* Added the ``unquote`` parameter to the :py:meth:`keypirinha.Settings.get`,
  :py:meth:`keypirinha.Settings.get_stripped`,
  :py:meth:`keypirinha.Settings.get_enum` and
  :py:meth:`keypirinha.Settings.get_mapped` methods.
* Fixed: :py:meth:`keypirinha.Settings.get_enum` and
  :py:meth:`keypirinha.Settings.get_mapped` would not always match a valid value
  when the ``case_sensitive`` argument was ``True``
* Improved documentation of :py:class:`keypirinha.Settings`


v2.8 - 2016-07-11
=================

Application
-----------
* Fixed a bug that prevented the results to be displayed when the
  ``retain_last_search`` option was enabled :issue:`88`
* Added the ability to erase all the references of a package from history by
  selecting a result item and clicking the dedicated action in its contextual
  menu (mouse only; documentation updated) :issue:`65`
* The ``show_history_hits`` setting does not depend on ``show_scores`` anymore
  so items hits counts can be shown without having to enable the ``show_scores``
  option as well :issue:`84`
* Added the ``KNOWNFOLDER_...`` predefined variables to configuration
  files (``[var] section``).
  They may come handy for some the ``Apps`` and ``FileBrowser`` packages at
  least.
  See the :doc:`configuration` chapter for more info.

Bookmarks package
-----------------
* Firefox's padding bookmarks are now filtered out :issue:`66`

FileBrowser package
-------------------
* Fixed: typing ``C:\W`` would lead to an empty results list instead of
  returning at least a ``C:\Windows`` item for example :issue:`81`

WebSearch package
-----------------
* Search sites do not require argument anymore. If no argument is provided by
  the user, the guessed home address of the site will be launched instead of the
  provided ``url``, unless a ``home_url`` setting (**new**) has been
  specified :issue:`85`
* Pre-defined search sites can now be all disabled at once using the new
  ``enable_predefined_sites`` setting (:issue:`57`).
  **Note** that the section name of pre-defined sites is now
  ``predefined_site/`` instead of ``site/``.
* A single search site (pre-defined or not) can now be enabled/disabled using
  the new ``enable`` boolean setting
* Added the ``Python3 Mod`` predefined site

Documentation
-------------
* Added the :doc:`contributions` chapter that references available third-party
  packages and patches to the official packages :issue:`82`

API
---
* ``Plugin.create_error_item`` now copies the content of the ``short_desc``
  argument if ``label`` is empty. Items with an empty ``label`` are filtered out
  by the application and the created ``ERROR`` item would not be displayed.
* Corrected a potential bug in ``Settings.get_multiline`` when the returned
  fallback value was modified by the caller, then re-used (due to Python's
  "mutable default arguments")


v2.7 - 2016-07-03
=================

Application
-----------
* LaunchBox: item's ``data_bag`` property is now also printed in the Console
  when ``Alt+Enter`` is pressed
* ``Ctrl+Backspace`` conventional shortcut to erase the previously typed word in
  an edit control is now supported by the LaunchBox and the Console :issue:`77`

Apps package
------------
* Fixed a bug that occurred when a line in ``extra_paths`` was containing only
  a GUID (i.e. format ``::{guid}``)

Everything package
------------------
* Now takes advantage of the 'browse directory as you type' feature introduced
  with the ``FileBrowser`` package. After a search via ``Everything`` **and**
  once a directory item has been selected, it can be browsed using the ``Tab``
  key.

FileBrowser package
-------------------
* A new package that allows file browsing as you type (request :issue:`32`).
  More info available in documentation and configuration file.

API
---
* Embedded Python interpreter upgraded from 3.5.1 to 3.5.2
* Signature of ``Plugin.on_suggest`` has changed, refer to the documentation for
  more information. **This change breaks retro-compatibility.**
* Corrected ``GUID.__init__``, ``get_known_folder_path`` and the declaration
  of ``shell32.SHGetKnownFolderPath`` from the ``keypirinha_wintypes`` site
  module


v2.6.1 - 2016-06-10
===================

API
---
* Fixed: the content of the ``CatalogItem.data_bag`` property was not copied by
  the ``CatalogItem.clone`` method :issue:`69`


v2.6 - 2016-05-30
=================

Application
-----------
* Configuration is now reloaded if and only if at least one value has changed
  (previously, it was always reloaded when a change notification was pushed by
  the file system). This helps preventing the catalog to be updated because of
  modifications to comments or blank lines for example.
  This also applies to packages configuration.
* For the same reasons, the detection of modifications to the environment
  variables has been improved.

API
---
* Replaced ``Plugin.on_config_changed`` and ``Plugin.on_env_changed`` methods by
  ``Plugin.on_events``. **This change breaks retro-compatibility.**
* Added the ``show`` parameter to :py:func:`keypirinha_util.shell_execute`
  :issue:`68`


v2.5.6 - 2016-05-10
===================

Application
-----------
* Fixed: the `Internal` package was still loaded on startup despite being
  specified in the ``ignored_packages`` list :issue:`59`
* The ``ignored_packages`` setting is more flexible by allowing the ``<all>``
  value and the ``-`` and ``+`` operators
* Disabled the auto-repeat flag of every hotkeys to avoid trouble
* Rules for package naming are slightly more strict. See the :doc:`packages`
  chapter for more info
* Minimum **auto**-width of the LaunchBox is 600 pixels in case 1/3 of the
  screen width is less than that
* Log file is now machine specific and is named accordingly.
  Old "Keypirinha.log" file can be deleted manually (not done by Keypirinha)

TaskSwitcher package
--------------------
* Added the ``item_label`` setting :issue:`54`
* Added the ``always_suggest`` setting

Documentation
-------------
* Added the :doc:`custom-catalog` chapter :issue:`57`
* Corrections here and there


v2.5.5 - 2016-04-26
===================

Bookmarks package
-----------------
* Fixed a bug that prevented bookmarks to be extracted in some cases :issue:`55`

API
---
* Corrected the :py:func:`keypirinha_util.chardet_open` function due to
  :issue:`55`


v2.5.4 - 2016-04-23
===================

WinSCP package
--------------
* Fixed a CPU-eating bug that occurred while listing the configured sessions of
  WinSCP from the registry :issue:`48`


v2.5.3 - 2016-04-22
===================

**CAUTION**
-----------
* The type of the ``hide_on_focus_lost`` setting has changed to allow a more
  fine-grained tweaking. While effort has been made to keep retro-compatibility,
  please ensure your existing configuration complies to this modification.
* If at least one of your ``geometry`` settings is set to ``persistent``, you
  may have to manually reposition the window(s) the first time you start this
  new version due to the fix of :issue:`39`.

Application
-----------
* Fixed: icons of remote files are now displayed properly :issue:`20`
* Fixed: dragging the LaunchBox by its icon in maximized mode was resulting in
  an unexpected behavior :issue:`47`
* Fixed: made persistent geometry and more generally, application state,
  user AND machine-specific :issue:`39`
* Added the ``space_as_tab`` setting :issue:`49`
* Added the :kbd:`Shift+Alt+Enter` shortcut to the LaunchBox to directly invoke
  the Shell "Properties" dialog of the selected FILE item.
* The ``hotkey_run`` and ``hotkey_console`` settings accept new special keys and
  combinations. A message dialog also pops up in case of malformed value
  :issue:`46`
* The ``hide_on_focus_lost`` setting is more flexible
* Application is more verbose about malformed configuration values (console)
  instead of just silently falling back to hard-coded default

Bookmarks package
-----------------
* Try to automatically detect the text encoding of some files the plugins need
  to read from Chrome, Firefox and others :issue:`51`

API
---
* Added the :py:func:`keypirinha_util.chardet_open` function
* Added the :py:func:`keypirinha_util.chardet_slurp` function
* :py:func:`keypirinha_util.slurp_text_file` function is deprecated

Documentation
-------------
* Added the "Clear the history" section in the :doc:`first` chapter
* Corrections here and there


v2.5.2 - 2016-04-16
===================

Application
-----------
* Fixed handling of the ``show_on_taskbar`` setting :issue:`43`
* Added the ``escape_always_closes`` setting :issue:`41`
* LaunchBox can now be closed with :kbd:`Shift+Esc`

Documentation
-------------
* Added the :doc:`keyboard` chapter to list the available shortcuts
* Added the "Drag and Drop" section in the :doc:`first` chapter
* Typo corrections


v2.5.1 - 2016-04-14
===================

URL package
-----------
* Corrected handling of IP addresses and any URL not explicitly prefixed with a
  scheme :issue:`40`


v2.5 - 2016-04-13
=================

Application
-----------
* **New package:** :doc:`packages/url`
* Fixed: the LaunchBox and Console windows now give back the focus to the
  previous application/window when closed :issue:`37`
* The LaunchBox can now be maximized by hitting :kbd:`Alt+X` or standard
  :kbd:`Win+Up` combination (**toggle**). Double-click also works.
  See the :ref:`first-maximize` documentation section.
* Added the ``hide_on_focus_lost`` setting :issue:`34`
* Added the ``retain_last_search`` setting :issue:`35`
* ERROR items have been implemented.
  Keypirinha can now display error messages from the plugins directly to the
  results list so the user can have a direct feedback on what's going on in some
  cases. Note that the Console remains the best source of information to track
  down issues.
  Best example for now is the ``=`` item of the ``Calc`` package (try typing an
  invalid expression like ``2+``).
* The LaunchBox now supports drag-and-drop operations:

  - A file can be dropped to the edit box so its full path is inserted
  - FILE items can be dragged out of the results list and be copied/linked to
    the Windows Explorer or any other application that accepts drops of Shell
    items
  - URL, CMDLINE, EXPRESSION and ERROR items can also be dragged out and their
    content (i.e. the *target* property) will be copied to the drop destination.
    For example, you could drop a URL item to your web browser.

* In the LaunchBox, the :kbd:`Alt+Enter` combination allows to show up the
  properties of the currently selected item.
* User can now press :kbd:`Ctrl+Space` or :kbd:`Shift+Space` during the
  **initial** search to force include a space character instead of switching to
  the next step.
* Improved speed when merging a large list of suggestions from plugins

Calc package
------------
* Added support for the left-shift and right-shift operators (``<<`` and
  ``>>``).
* Added the ``always_evaluate`` setting :issue:`38`

Everything package
------------------
* Full support of Everything's search syntax :issue:`27`
* Added the ``Regex Search`` item to allow a search based on regular expression
* Fixed: the list of returned results was not always complete in case Everything
  was not fast enough :issue:`36`
* Fixed: extra arguments could not be added to items that had been executed
  already (Everything items only)

WebSearch package
-----------------
* Added ``Bing Maps``, ``Google Maps`` and ``OpenStreetMaps`` search sites in
  the default configuration file.

API
---
* Added optional argument ``wait_seconds`` to
  :py:meth:`keypirinha.Plugin.should_terminate` and
  :py:meth:`keypirinha.should_terminate`
* Added :py:const:`keypirinha.ItemCategory.ERROR`.
  ``ERROR`` items are highlighted in the results list and cannot be executed.
* Added :py:meth:`keypirinha.Plugin.create_error_item`
* Added the optional parameters ``match_method`` and ``sort_method`` to
  :py:meth:`keypirinha.Plugin.set_suggestions`
* Added the ``data_bag`` property to :py:class:`keypirinha.CatalogItem` to allow
  plugins to associate arbitrary data to a specific item.
  **Modified** :py:meth:`keypirinha.Plugin.create_item` and
  :py:meth:`keypirinha.Plugin.create_error_item` accordingly.
  **Added** the :py:meth:`keypirinha.CatalogItem.data_bag` and
  :py:meth:`keypirinha.CatalogItem.set_data_bag` methods.
* Added the :py:func:`keypirinha_util.shell_url_scheme_to_command` function to
  find the application associated with a given URL scheme by the system; and the
  location of its default icon.


v2.4 - 2016-03-24
=================

**CAUTION**
-----------
* The default value of the ``launch_at_startup`` setting has been changed from
  ``yes`` to ``no`` to be less invasive. You may need to update your
  configuration if you want Keypirinha to keep being launched at startup.
* WebSearch package: the default value of the ``new_window`` setting in the
  ``[defaults]`` section has been changed from ``yes`` to ``no`` to comply to
  default system preferences.

Added
-----
* The *Reload Configuration* command and menu to reload all configuration files
  (application and plugins), and to clear the runtime icons cache
* Non-existent files referenced by items in the history are now filtered out
  from search results, but **kept** in history (as it was the case already).
  Related setting: ``exclude_nonexistent_remote_files``.
* Docs: some questions in the :doc:`faq` chapter

Fixed
-----
* The *new_window* and *inognito/private_mode* settings (global and
  plugin-specific) where not working when Firefox was the system's default web
  browser :issue:`25`
* LaunchBox: web icons (Bookmarks, WebSearch, ... items) are now refreshed
  properly when the ``web_browser`` setting is changed :issue:`26`
* Apps package: made ``extra_paths``, env ``PATH`` and *Start Menu* scans more
  bullet-proof in case an unreadable file/folder gets on its way (:issue:`19`,
  :issue:`29`)
* Bookmarks: Firefox bookmarks provider could not read Firefox's
  ``profiles.ini`` file when its nomenclature format was not exactly the
  expected one :issue:`30`

Changed
-------
* LaunchBox: last executed action is now **pre-selected** in the ACTIONS list.
  If user skips the ACTIONS list, item will be executed with the default action.
* The default value of the ``launch_at_startup`` setting has been changed from
  ``yes`` to ``no`` to be less invasive.
* WebSearch package: the default value of the ``new_window`` setting in the
  ``[defaults]`` section has been changed from ``yes`` to ``no`` to comply to
  default system preferences.
* Minor corrections and improvements

API: Changed
------------
* :py:func:`keypirinha_util.raise_winerror` accepts a new optional ``msg``
  argument to override system's default message
* :py:func:`keypirinha_util.scan_directory` raises :py:exc:`OSError` instead
  of :py:exc:`IOError` to comply to Python 3.3 changes
* :py:func:`keypirinha_util.scan_directory` accepts new flag ``ABORT_ON_ERROR``


v2.3 - 2016-03-22
=================

**WARNING:** This version breaks compatibility of the
:py:meth:`keypirinha.Plugin.on_suggest` API with previous versions. If you are a
plugin developer or if you have modified the shipped packages, please ensure to
update your code before starting the application. Otherwise, just follow the
Install/Update instructions from the documentation.

Added
-----
* **New package:** Everything (query the Everything application to search files
  and folders from Keypirinha).
* Docs: the :doc:`first` chapter has been stuffed with features that were
  undocumented so far.
* ``geometry`` settings in the ``[gui]`` and ``[console]`` sections. Note that
  due to this addition, default behavior **has changed** from previous release
  (i.e. from ``persistent`` to ``auto``)
* ``web_browser``, ``web_browser_new_window`` and
  ``web_browser_private_mode`` global settings :issue:`12`
* Bookmarks package: ``force_new_window``, ``bookmarks_files``, ``places_files``
  and ``favorites_dirs`` settings
* WebSearch package: *Metacritic* and *MSDN* sites in default configuration
* LaunchBox: the status bar shows the name of the owner package of the currently
  selected item

Fixed
-----
* Application was failing to launch if the value of an environment variable had
  a single dollar sign in it :issue:`14`
* The default text editor was launched too quickly, which could make its taskbar
  buttons not to be in order.
* The windows of the default text editor were not positioned properly on the
  screen when there were 3 or more configuration files to edit.

Changed
-------
* Drastically improved the speed of the internal logger in case of flooding
* Minor corrections, optimizations and improvements
* Docs: corrections and added some screen shots
* TaskSwitcher package: item is now kept in history, without its arguments
* Support chat room has moved

API: Changed
------------
* :py:meth:`keypirinha.Plugin.on_suggest` (**compatibility break**)


v2.2 - 2016-03-10
=================

Added
-----
* Bookmarks package: support for the Vivaldi web browser

Fixed
-----
* Restored compatibility with Windows 7 (Vista support dropped) :issue:`13`
* Detection of system's default web browser was incorrect on Windows 10
  (impacted packages: Bookmarks and WebSearch) :issue:`11`
* Bookmarks package: Firefox provider was making the plugin to fail in case user
  profile was not found.


v2.1 - 2016-03-09
=================

Added
-----
* **New package:** Bookmarks (supports Chrome, Firefox and Internet Explorer)
* Position and size of the LaunchBox and the Console window are now persistent
  :issue:`2`
* ``always_on_top`` setting :issue:`1`
* ``max_height`` setting
* *Show Change Log* menu item and its *ChangeLog* catalog item
* *Online Documentation* menu item and the *Online Documentation* and
  *Online Help* (alias) catalog items
* Apps package: ``scan_start_menu`` and ``scan_env_path`` settings :issue:`4`
* Docs: *Update Procedure* section
* Docs: *Change Log* section
* Docs: *Credits* section

Changed
-------
* GUI: Improved readability by brightening default text colors :issue:`6`
* Calc package: the ``=`` item is not kept in History anymore

API: Added
----------
* :py:func:`keypirinha.exe_path`
* :py:func:`keypirinha.user_config_dir`
* :py:func:`keypirinha.package_cache_dir`
* :py:meth:`keypirinha.Plugin.id`
* :py:meth:`keypirinha.CatalogItem.valid`

API: Fixed
----------
* :py:func:`keypirinha.installed_package_dir` :issue:`8`
* :py:meth:`keypirinha.Plugin.create_action` was missing the ``data_bag``
  parameter :issue:`7`
* :py:meth:`keypirinha.Plugin.set_actions` and
  :py:meth:`keypirinha.Plugin.clear_actions` (due to :issue:`7`)
* :py:meth:`keypirinha.Plugin.get_package_cache_path` :issue:`9`

API: Deprecated
---------------
* :py:func:`keypirinha.packages_path` and :py:func:`keypirinha.package_path` are
  deprecated in favor of :py:func:`keypirinha.live_package_dir` to avoid
  confusion


v2.0 - 2016-03-01
=================
* First public release


v0 - 2013-05-21
===============
* Development started



.. _Keypirinha: http://keypirinha.com
