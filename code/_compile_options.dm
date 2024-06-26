//#define TESTING //By using the testing("message") proc you can create debug-feedback for people with this
								//uncommented, but not visible in the release version)

//#define DATUMVAR_DEBUGGING_MODE //Enables the ability to cache datum vars and retrieve later for debugging which vars changed.

// Comment this out if you are debugging problems that might be obscured by custom error handling in world/Error
#ifdef DEBUG
#define USE_CUSTOM_ERROR_HANDLER
#endif

#ifdef TESTING
#define DATUMVAR_DEBUGGING_MODE

//#define VISUALIZE_ACTIVE_TURFS //Highlights atmos active turfs in green
#endif

// If this is uncommented, we do a single run though of the game setup and tear down process with unit tests in between
// #define UNIT_TESTS

// If this is uncommented, will attempt to load and initialize prof.dll/libprof.so.
// We do not ship byond-tracy. Build it yourself here: https://github.com/mafemergency/byond-tracy/
// #define USE_BYOND_TRACY

///Used to find the sources of harddels, quite laggy, don't be surpised if it freezes your client for a good while
//#define REFERENCE_TRACKING
#ifdef REFERENCE_TRACKING

///Should we be logging our findings or not
#define REFERENCE_TRACKING_LOG

///Used for doing dry runs of the reference finder, to test for feature completeness
//#define REFERENCE_TRACKING_DEBUG

///Run a lookup on things hard deleting by default.
//#define GC_FAILURE_HARD_LOOKUP
#ifdef GC_FAILURE_HARD_LOOKUP
#define FIND_REF_NO_CHECK_TICK
#endif //ifdef GC_FAILURE_HARD_LOOKUP

#endif //ifdef REFERENCE_TRACKING

//Additional code for the above flags.
#ifdef TESTING
#warn compiling in TESTING mode. testing() debug messages will be visible.
#endif

#ifdef CIBUILDING
#define UNIT_TESTS
#endif

#ifdef CITESTING
#define TESTING
#endif

//#define SHADOW_DEBUG

#ifdef TGS
// TGS performs its own build of dm.exe, but includes a prepended TGS define.
#define CBT
#endif

// Когда будет тгчат
//#if !defined(CBT) && !defined(SPACEMAN_DMM)
//#warn Building with Dream Maker is no longer supported and will result in errors.
//#warn In order to build, run BUILD.cmd in the root directory.
//#warn Consider switching to VSCode editor instead, where you can press Ctrl+Shift+B to build.
//#endif
