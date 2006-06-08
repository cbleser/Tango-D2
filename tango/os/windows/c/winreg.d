/***********************************************************************\
*                                winreg.d                               *
*                                                                       *
*                       Windows API header module                       *
*                                                                       *
*                 Translated from MinGW Windows headers                 *
*                           by Stewart Gordon                           *
*                                                                       *
*                       Placed into public domain                       *
\***********************************************************************/
module tango.os.windows.c.winreg;

version (build) { pragma(nolink); }


private import tango.os.windows.c.windef, tango.os.windows.c.winbase;
//pragma(lib, "advapi32.lib");

const HKEY
	HKEY_CLASSES_ROOT     = cast(HKEY) 0x80000000,
	HKEY_CURRENT_USER     = cast(HKEY) 0x80000001,
	HKEY_LOCAL_MACHINE    = cast(HKEY) 0x80000002,
	HKEY_USERS            = cast(HKEY) 0x80000003,
	HKEY_PERFORMANCE_DATA = cast(HKEY) 0x80000004,
	HKEY_CURRENT_CONFIG   = cast(HKEY) 0x80000005,
	HKEY_DYN_DATA         = cast(HKEY) 0x80000006;

enum : DWORD {
	REG_OPTION_NON_VOLATILE,
	REG_OPTION_VOLATILE
}

enum : DWORD {
	REG_CREATED_NEW_KEY	    = 1,
	REG_OPENED_EXISTING_KEY
}

enum : DWORD {
	REG_NONE  = 0,
	REG_SZ,
	REG_EXPAND_SZ,
	REG_BINARY,
	REG_DWORD_LITTLE_ENDIAN,
	REG_DWORD = REG_DWORD_LITTLE_ENDIAN,
	REG_DWORD_BIG_ENDIAN,
	REG_LINK,
	REG_MULTI_SZ,
	REG_RESOURCE_LIST,
	REG_FULL_RESOURCE_DESCRIPTOR,
	REG_RESOURCE_REQUIREMENTS_LIST,
	REG_QWORD_LITTLE_ENDIAN,
	REG_QWORD = REG_QWORD_LITTLE_ENDIAN
}

const DWORD
	REG_NOTIFY_CHANGE_NAME       = 1,
	REG_NOTIFY_CHANGE_ATTRIBUTES = 2,
	REG_NOTIFY_CHANGE_LAST_SET   = 4,
	REG_NOTIFY_CHANGE_SECURITY   = 8;

alias ACCESS_MASK REGSAM;

struct VALENTA {
	LPSTR ve_valuename;
	DWORD ve_valuelen;
	DWORD ve_valueptr;
	DWORD ve_type;
}
alias VALENTA* PVALENTA;

struct VALENTW {
	LPWSTR ve_valuename;
	DWORD  ve_valuelen;
	DWORD  ve_valueptr;
	DWORD  ve_type;
}
alias VALENTW* PVALENTW;

extern (Windows) {
	BOOL AbortSystemShutdownA(LPCSTR);
	BOOL AbortSystemShutdownW(LPCWSTR);
	BOOL InitiateSystemShutdownA(LPSTR, LPSTR, DWORD, BOOL, BOOL);
	BOOL InitiateSystemShutdownW(LPWSTR, LPWSTR, DWORD, BOOL, BOOL);
	LONG RegCloseKey(HKEY);
	LONG RegConnectRegistryA(LPCSTR, HKEY, PHKEY);
	LONG RegConnectRegistryW(LPCWSTR, HKEY, PHKEY);
	LONG RegCreateKeyExA(HKEY, LPCSTR, DWORD, LPSTR, DWORD, REGSAM,
	  LPSECURITY_ATTRIBUTES, PHKEY, PDWORD);
	LONG RegCreateKeyExW(HKEY, LPCWSTR, DWORD, LPWSTR, DWORD, REGSAM,
	  LPSECURITY_ATTRIBUTES, PHKEY, PDWORD);
	LONG RegDeleteKeyA(HKEY, LPCSTR);
	LONG RegDeleteKeyW(HKEY, LPCWSTR);
	LONG RegDeleteValueA(HKEY, LPCSTR);
	LONG RegDeleteValueW(HKEY, LPCWSTR);
	LONG RegEnumKeyExA(HKEY, DWORD, LPSTR, PDWORD, PDWORD, LPSTR, PDWORD,
	  PFILETIME);
	LONG RegEnumKeyExW(HKEY, DWORD, LPWSTR, PDWORD, PDWORD, LPWSTR, PDWORD,
	  PFILETIME);
	LONG RegEnumValueA(HKEY, DWORD, LPSTR, PDWORD, PDWORD, PDWORD, LPBYTE,
	  PDWORD);
	LONG RegEnumValueW(HKEY, DWORD, LPWSTR, PDWORD, PDWORD, PDWORD, LPBYTE,
	  PDWORD);
	LONG RegFlushKey(HKEY);
	LONG RegGetKeySecurity(HKEY, SECURITY_INFORMATION, PSECURITY_DESCRIPTOR,
	  PDWORD);
	LONG RegLoadKeyA(HKEY, LPCSTR, LPCSTR);
	LONG RegLoadKeyW(HKEY, LPCWSTR, LPCWSTR);
	LONG RegNotifyChangeKeyValue(HKEY, BOOL, DWORD, HANDLE, BOOL);
	LONG RegOpenKeyExA(HKEY, LPCSTR, DWORD, REGSAM, PHKEY);
	LONG RegOpenKeyExW(HKEY, LPCWSTR, DWORD, REGSAM, PHKEY);
	LONG RegQueryInfoKeyA(HKEY, LPSTR, PDWORD, PDWORD, PDWORD, PDWORD,
	  PDWORD, PDWORD, PDWORD, PDWORD, PDWORD, PFILETIME);
	LONG RegQueryInfoKeyW(HKEY, LPWSTR, PDWORD, PDWORD, PDWORD, PDWORD,
	  PDWORD, PDWORD, PDWORD, PDWORD, PDWORD, PFILETIME);
	LONG RegQueryMultipleValuesA(HKEY, PVALENTA, DWORD, LPSTR, LPDWORD);
	LONG RegQueryMultipleValuesW(HKEY, PVALENTW, DWORD, LPWSTR, LPDWORD);
	LONG RegQueryValueExA(HKEY, LPCSTR, LPDWORD, LPDWORD, LPBYTE, LPDWORD);
	LONG RegQueryValueExW(HKEY, LPCWSTR, LPDWORD, LPDWORD, LPBYTE, LPDWORD);
	LONG RegReplaceKeyA(HKEY, LPCSTR, LPCSTR, LPCSTR);
	LONG RegReplaceKeyW(HKEY, LPCWSTR, LPCWSTR, LPCWSTR);
	LONG RegRestoreKeyA(HKEY, LPCSTR, DWORD);
	LONG RegRestoreKeyW(HKEY, LPCWSTR, DWORD);
	LONG RegSaveKeyA(HKEY, LPCSTR, LPSECURITY_ATTRIBUTES);
	LONG RegSaveKeyW(HKEY, LPCWSTR, LPSECURITY_ATTRIBUTES);
	LONG RegSetKeySecurity(HKEY, SECURITY_INFORMATION, PSECURITY_DESCRIPTOR);
	LONG RegSetValueExA(HKEY, LPCSTR, DWORD, DWORD, BYTE*, DWORD);
	LONG RegSetValueExW(HKEY, LPCWSTR, DWORD, DWORD, BYTE*, DWORD);
	LONG RegUnLoadKeyA(HKEY, LPCSTR);
	LONG RegUnLoadKeyW(HKEY, LPCWSTR);
	deprecated {
		LONG RegCreateKeyA(HKEY, LPCSTR, PHKEY);
		LONG RegCreateKeyW(HKEY, LPCWSTR, PHKEY);
		LONG RegEnumKeyA(HKEY, DWORD, LPSTR, DWORD);
		LONG RegEnumKeyW(HKEY, DWORD, LPWSTR, DWORD);
		LONG RegOpenKeyA(HKEY, LPCSTR, PHKEY);
		LONG RegOpenKeyW(HKEY, LPCWSTR, PHKEY);
		LONG RegQueryValueA(HKEY, LPCSTR, LPSTR, PLONG);
		LONG RegQueryValueW(HKEY, LPCWSTR, LPWSTR, PLONG);
		LONG RegSetValueA(HKEY, LPCSTR, DWORD, LPCSTR, DWORD);
		LONG RegSetValueW(HKEY, LPCWSTR, DWORD, LPCWSTR, DWORD);
	}
}

version (Unicode) {
	alias VALENTW VALENT;
	alias AbortSystemShutdownW AbortSystemShutdown;
	alias InitiateSystemShutdownW InitiateSystemShutdown;
	alias RegConnectRegistryW RegConnectRegistry;
	alias RegCreateKeyExW RegCreateKeyEx;
	alias RegDeleteKeyW RegDeleteKey;
	alias RegDeleteValueW RegDeleteValue;
	alias RegEnumKeyExW RegEnumKeyEx;
	alias RegEnumValueW RegEnumValue;
	alias RegLoadKeyW RegLoadKey;
	alias RegOpenKeyExW RegOpenKeyEx;
	alias RegQueryInfoKeyW RegQueryInfoKey;
	alias RegQueryMultipleValuesW RegQueryMultipleValues;
	alias RegQueryValueExW RegQueryValueEx;
	alias RegReplaceKeyW RegReplaceKey;
	alias RegRestoreKeyW RegRestoreKey;
	alias RegSaveKeyW RegSaveKey;
	alias RegSetValueExW RegSetValueEx;
	alias RegUnLoadKeyW RegUnLoadKey;
	deprecated {
		alias RegCreateKeyW RegCreateKey;
		alias RegEnumKeyW RegEnumKey;
		alias RegOpenKeyW RegOpenKey;
		alias RegQueryValueW RegQueryValue;
		alias RegSetValueW RegSetValue;
	}
} else {
	alias VALENTA VALENT;
	alias AbortSystemShutdownA AbortSystemShutdown;
	alias InitiateSystemShutdownA InitiateSystemShutdown;
	alias RegConnectRegistryA RegConnectRegistry;
	alias RegCreateKeyExA RegCreateKeyEx;
	alias RegDeleteKeyA RegDeleteKey;
	alias RegDeleteValueA RegDeleteValue;
	alias RegEnumKeyExA RegEnumKeyEx;
	alias RegEnumValueA RegEnumValue;
	alias RegLoadKeyA RegLoadKey;
	alias RegOpenKeyExA RegOpenKeyEx;
	alias RegQueryInfoKeyA RegQueryInfoKey;
	alias RegQueryMultipleValuesA RegQueryMultipleValues;
	alias RegQueryValueExA RegQueryValueEx;
	alias RegReplaceKeyA RegReplaceKey;
	alias RegRestoreKeyA RegRestoreKey;
	alias RegSaveKeyA RegSaveKey;
	alias RegSetValueExA RegSetValueEx;
	alias RegUnLoadKeyA RegUnLoadKey;
	deprecated {
		alias RegCreateKeyA RegCreateKey;
		alias RegEnumKeyA RegEnumKey;
		alias RegOpenKeyA RegOpenKey;
		alias RegQueryValueA RegQueryValue;
		alias RegSetValueA RegSetValue;
	}
}

alias VALENT* PVALENT;
