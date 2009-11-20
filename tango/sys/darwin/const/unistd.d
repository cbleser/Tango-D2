module tango.sys.darwin.const.unistd;
/+ http://opengroup.org/onlinepubs/007908799/xsh/unistd.h.html +/
enum {
    STDIN_FILENO = 0,
    STDOUT_FILENO = 1,
    STDERR_FILENO = 2,
    F_OK = 0,
    R_OK = (1<<2),
    W_OK = (1<<1),
    X_OK = (1<<0),
    F_ULOCK = 0,
    F_LOCK = 1 ,
    F_TLOCK = 2,
    F_TEST = 3 ,
}
enum :long {
    _POSIX_VERSION = 200112L ,
    _POSIX2_VERSION = 200112L ,
    _XOPEN_VERSION = 600 ,
    _XOPEN_XCU_VERSION = 4,
}
enum {
    // posix.1
    _PC_LINK_MAX = 1,
    _PC_MAX_CANON = 2,
    _PC_MAX_INPUT = 3,
    _PC_NAME_MAX = 4,
    _PC_PATH_MAX = 5,
    _PC_PIPE_BUF = 6,
    _PC_CHOWN_RESTRICTED = 7,
    _PC_NO_TRUNC = 8,
    _PC_VDISABLE = 9,
    _PC_SYNC_IO = 25,
    _PC_ASYNC_IO = 17,
    _PC_PRIO_IO = 19,
    _PC_FILESIZEBITS = 18,
    _PC_REC_INCR_XFER_SIZE = 20,
    _PC_REC_MAX_XFER_SIZE = 21,
    _PC_REC_MIN_XFER_SIZE = 22,
    _PC_REC_XFER_ALIGN = 23,
    _PC_ALLOC_SIZE_MIN = 16,
    _PC_SYMLINK_MAX = 24,
    _PC_2_SYMLINKS = 15,
    // posix.2
    _CS_PATH = 1,
    _CS_XBS5_ILP32_OFF32_CFLAGS = 20,
    _CS_XBS5_ILP32_OFF32_LDFLAGS = 21,
    _CS_XBS5_ILP32_OFF32_LIBS = 22,
    _CS_XBS5_ILP32_OFF32_LINTFLAGS = 23,
    _CS_XBS5_ILP32_OFFBIG_CFLAGS = 24,
    _CS_XBS5_ILP32_OFFBIG_LDFLAGS = 25,
    _CS_XBS5_ILP32_OFFBIG_LIBS = 26,
    _CS_XBS5_ILP32_OFFBIG_LINTFLAGS = 27,
    _CS_XBS5_LP64_OFF64_CFLAGS = 28,
    _CS_XBS5_LP64_OFF64_LDFLAGS = 29,
    _CS_XBS5_LP64_OFF64_LIBS = 30,
    _CS_XBS5_LP64_OFF64_LINTFLAGS = 31,
    _CS_XBS5_LPBIG_OFFBIG_CFLAGS = 32,
    _CS_XBS5_LPBIG_OFFBIG_LDFLAGS = 33,
    _CS_XBS5_LPBIG_OFFBIG_LIBS = 34,
    _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS = 35,
    _CS_POSIX_V6_ILP32_OFF32_CFLAGS = 2,
    _CS_POSIX_V6_ILP32_OFF32_LDFLAGS = 3,
    _CS_POSIX_V6_ILP32_OFF32_LIBS = 4,
    _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS = 5,
    _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS = 6,
    _CS_POSIX_V6_ILP32_OFFBIG_LIBS = 7,
    _CS_POSIX_V6_LP64_OFF64_CFLAGS = 8,
    _CS_POSIX_V6_LP64_OFF64_LDFLAGS = 9,
    _CS_POSIX_V6_LP64_OFF64_LIBS = 10,
    _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS = 11,
    _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS = 12,
    _CS_POSIX_V6_LPBIG_OFFBIG_LIBS = 13,
    _SC_IOV_MAX = 56,
    _SC_ARG_MAX = 1,
    _SC_CHILD_MAX = 2,
    _SC_CLK_TCK = 3,
    _SC_NGROUPS_MAX = 4,
    _SC_OPEN_MAX = 5,
    _SC_STREAM_MAX = 26,
    _SC_TZNAME_MAX = 27,
    _SC_JOB_CONTROL = 6,
    _SC_SAVED_IDS = 7,
    _SC_REALTIME_SIGNALS = 36,
    _SC_PRIORITY_SCHEDULING = 35,
    _SC_TIMERS = 41,
    _SC_ASYNCHRONOUS_IO = 28,
    _SC_PRIORITIZED_IO = 34,
    _SC_SYNCHRONIZED_IO = 40,
    _SC_FSYNC = 38,
    _SC_MAPPED_FILES = 47,
    _SC_MEMLOCK = 30,
    _SC_MEMLOCK_RANGE = 31,
    _SC_MEMORY_PROTECTION = 32,
    _SC_MESSAGE_PASSING = 33,
    _SC_SEMAPHORES = 37,
    _SC_SHARED_MEMORY_OBJECTS = 39,
    _SC_AIO_LISTIO_MAX = 42,
    _SC_AIO_MAX = 43,
    _SC_AIO_PRIO_DELTA_MAX = 44,
    _SC_DELAYTIMER_MAX = 45,
    _SC_MQ_OPEN_MAX = 46,
    _SC_MQ_PRIO_MAX = 75,
    _SC_VERSION = 8,
    _SC_PAGESIZE = 29,
    _SC_PAGE_SIZE = 29,
    _SC_RTSIG_MAX = 48,
    _SC_SEM_NSEMS_MAX = 49,
    _SC_SEM_VALUE_MAX = 50,
    _SC_SIGQUEUE_MAX = 51,
    _SC_TIMER_MAX = 52,
    _SC_BC_BASE_MAX = 9,
    _SC_BC_DIM_MAX = 10,
    _SC_BC_SCALE_MAX = 11,
    _SC_BC_STRING_MAX = 12,
    _SC_COLL_WEIGHTS_MAX = 13,
    _SC_EXPR_NEST_MAX = 14,
    _SC_LINE_MAX = 15,
    _SC_RE_DUP_MAX = 16,
    _SC_2_VERSION = 17,
    _SC_2_C_BIND = 18,
    _SC_2_C_DEV = 19,
    _SC_2_FORT_DEV = 21,
    _SC_2_FORT_RUN = 22,
    _SC_2_SW_DEV = 24,
    _SC_2_LOCALEDEF = 23,
    _SC_THREADS = 96,
    _SC_THREAD_SAFE_FUNCTIONS = 91,
    _SC_GETGR_R_SIZE_MAX = 70,
    _SC_GETPW_R_SIZE_MAX = 71,
    _SC_LOGIN_NAME_MAX = 73,
    _SC_TTY_NAME_MAX = 101,
    _SC_THREAD_DESTRUCTOR_ITERATIONS = 85,
    _SC_THREAD_KEYS_MAX = 86,
    _SC_THREAD_STACK_MIN = 93,
    _SC_THREAD_THREADS_MAX = 94,
    _SC_THREAD_ATTR_STACKADDR = 82,
    _SC_THREAD_ATTR_STACKSIZE = 83,
    _SC_THREAD_PRIORITY_SCHEDULING = 89,
    _SC_THREAD_PRIO_INHERIT = 87,
    _SC_THREAD_PRIO_PROTECT = 88,
    _SC_THREAD_PROCESS_SHARED = 90,
    _SC_NPROCESSORS_CONF = 57,
    _SC_NPROCESSORS_ONLN = 58,
    _SC_ATEXIT_MAX = 107,
    _SC_PASS_MAX = 131,
    _SC_XOPEN_VERSION = 116,
    _SC_XOPEN_XCU_VERSION = 121,
    _SC_XOPEN_UNIX = 115,
    _SC_XOPEN_CRYPT = 108,
    _SC_XOPEN_ENH_I18N = 109,
    _SC_XOPEN_SHM = 113,
    _SC_2_CHAR_TERM = 20,
    _SC_2_UPE = 25,
    _SC_XBS5_ILP32_OFF32 = 122,
    _SC_XBS5_ILP32_OFFBIG = 123,
    _SC_XBS5_LP64_OFF64 = 124,
    _SC_XBS5_LPBIG_OFFBIG = 125,
    _SC_XOPEN_LEGACY = 110,
    _SC_XOPEN_REALTIME = 111,
    _SC_XOPEN_REALTIME_THREADS = 112,
    _SC_ADVISORY_INFO = 65,
    _SC_BARRIERS = 66,
    _SC_CLOCK_SELECTION = 67,
    _SC_CPUTIME = 68,
    _SC_THREAD_CPUTIME = 84,
    _SC_FILE_LOCKING = 69,
    _SC_MONOTONIC_CLOCK = 74,
    _SC_READER_WRITER_LOCKS = 76,
    _SC_SPIN_LOCKS = 80,
    _SC_REGEXP = 77,
    _SC_SHELL = 78,
    _SC_SPAWN = 79,
    _SC_SPORADIC_SERVER = 81,
    _SC_THREAD_SPORADIC_SERVER = 92,
    _SC_TIMEOUTS = 95,
    _SC_TYPED_MEMORY_OBJECTS = 102,
    _SC_2_PBS = 59,
    _SC_2_PBS_ACCOUNTING = 60,
    _SC_2_PBS_LOCATE = 62,
    _SC_2_PBS_MESSAGE = 63,
    _SC_2_PBS_TRACK = 64,
    _SC_SYMLOOP_MAX = 120,
    _SC_2_PBS_CHECKPOINT = 61,
    _SC_V6_ILP32_OFF32 = 103,
    _SC_V6_ILP32_OFFBIG = 104,
    _SC_V6_LP64_OFF64 = 105,
    _SC_V6_LPBIG_OFFBIG = 106,
    _SC_HOST_NAME_MAX = 72,
    _SC_TRACE = 97,
    _SC_TRACE_EVENT_FILTER = 98,
    _SC_TRACE_INHERIT = 99,
    _SC_TRACE_LOG = 100,
    _SC_IPV6 = 118,
    _SC_RAW_SOCKETS = 119,
}