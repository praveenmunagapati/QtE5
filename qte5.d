// Written in the D programming language.
// MGW Мохов Геннадий Владимирович 2016
// Версия v0.01 - 20.02.16 12:45

module qte5;

import core.stdc.stdio: core;
import std.conv; // Convert to string

// Отладка
import std.stdio: writeln;


int verQt5Eu = 0;
int verQt5El = 01;
string verQt5Ed = "20.02.16 12:45";

/* alias PTRINT = int;
alias PTRUINT = uint;

struct QApplication__ { PTRINT dummy; } alias QApplicationH = QApplication__*;
 */

private void*[400] pFunQt; /// Масив указателей на функции из DLL

immutable int QMETHOD = 0; // member type codes
immutable int QSLOT = 1;
immutable int QSIGNAL = 2;

// ----- Описание типов, фактически указание компилятору как вызывать -----
// ----- The description of types, actually instructions to the compiler how to call -----

// Give type Qt. There is an implicit transformation. cast (GetObjQt_t) Z == *Z on any type.
// alias GetObjQt_t = void**; // Дай тип Qt. Происходит неявное преобразование. cast(GetObjQt_t)Z == *Z на любой тип.

private extern (C) @nogc alias t_v__i = void function(int);
private extern (C) @nogc alias t_v__vp = void function(void*);
private extern (C) @nogc alias t_v__vp_vp = void function(void*, void*);
private extern (C) @nogc alias t_v__vp_i = void function(void*, int);
private extern (C) @nogc alias t_v__vp_c = void function(void*, char);

private extern (C) @nogc alias t_v__vp_vp_vp = void function(void*, void*, void*);
private extern (C) @nogc alias t_v__vp_i_i = void function(void*, int, int);
private extern (C) @nogc alias t_v__vp_vp_i_i = void function(void*, void*, int, int);
private extern (C) @nogc alias t_v__vp_vp_i = void function(void*, void*, int);
private extern (C) @nogc alias t_i__vp_vp_vp = int function(void*, void*, void*);
private extern (C) @nogc alias t_i__vp_i = int function(void*, int);
private extern (C) @nogc alias t_vp__vp_vp = void* function(void*, void*);
private extern (C) @nogc alias t_vp__vp_c_i = void* function(void*, char, int);
private extern (C) @nogc alias t_vp__vp_cp_i = void* function(void*, char*, int);

/* 
private extern (C) @nogc alias t_v__vp_icon = void function(void*, QMessageBox.Icon);
private extern (C) @nogc alias t_v__vp_StandardButton = void function(void*, QMessageBox.StandardButton);
private extern (C) @nogc alias t_v__vp_SegmentStyle = void function(void*, QLCDNumber.SegmentStyle);
private extern (C) @nogc alias t_vp__v = void* function();
private extern (C) @nogc alias t_v__v = void function();

 */
 
private extern (C) @nogc alias t_vpp__vp = void** function(void*);
private extern (C) @nogc alias t_vp__vp = void* function(void*);
private extern (C) @nogc alias t_c_vp__vp = const void* function(void*);

private extern (C) @nogc alias t_vp__vp_i = void* function(void*, int);
private extern (C) @nogc alias t_vp__vp_i_i = void* function(void*, int, int);
private extern (C) @nogc alias t_vp__vp_i_vp = void* function(void*, int, void*);
private extern (C) @nogc alias t_vp__vp_vp_i = void* function(void*, void*, int);

private extern (C) @nogc alias t_vp__i_i = void* function(int, int);
private extern (C) @nogc alias t_vp__i_i_i_i = void* function(int, int, int, int);

private extern (C) @nogc alias t_v__vp_i_bool = void function(void*, int, bool);
private extern (C) @nogc alias t_v__vp_i_i_i_i = void function(void*, int, int, int, int);
private extern (C) @nogc alias t_v__vp_i_i_vp = void function(void*, int, int, void*);
private extern (C) @nogc alias t_v__i_vp_vp = void function(int, void*, void*);
private extern (C) @nogc alias t_vp__vp_vp_bool = void* function(void*, void*, bool);
private extern (C) @nogc alias t_vp__i_vp_bool = void* function(int, void*, bool);
private extern (C) @nogc alias t_i__vp = int function(void*);
private extern (C) @nogc alias t_i__v = int function();
private extern (C) @nogc alias t_i__vp_vbool_i = int function(void*, bool*, int);

private extern (C) @nogc alias t_vp__vp_i_vp_i = void* function(void*, int, void*, int);
private extern (C) @nogc alias t_vp__vp_i_i_vp = void* function(void*, int, int, void*);
private extern (C) @nogc alias t_vp__vp_vp_i_i = void* function(void*, void*, int, int);
private extern (C) @nogc alias t_i__vp_vp_i_i = int function(void*, void*, int, int);

private extern (C) @nogc alias t_vp__vp_vp_us_i = void* function(void*, void*, ushort, int);
private extern (C) @nogc alias t_v__vp_vp_us_i = void function(void*, void*, ushort, int);
private extern (C) @nogc alias t_bool__vp = bool function(void*);
private extern (C) @nogc alias t_bool__vp_c = bool function(void*, char);
private extern (C) @nogc alias t_bool__vp_vp = bool function(void*, void*);
private extern (C) @nogc alias t_v__vp_bool = void function(void*, bool);
private extern (C) @nogc alias t_v__vp_i_vp_us_i = void function(void*, int, void*, ushort, int);
private extern (C) @nogc alias t_vp__vp_vp_vp = void* function(void*, void*, void*);

private extern (C) @nogc alias t_l__vp_vp_l = long function(void*, void*, long);
private extern (C) @nogc alias t_l__vp = long function(void*);

private extern (C) @nogc alias t_vp__vp_vp_vp_vp_vp_vp_vp = void* function(void*, void*, void*, void*, void*, void*, void*);
private extern (C) @nogc alias t_vp__vp_vp_vp_vp_vp_vp_vp_vp = void* function(void*, void*, void*, void*, void*, void*, void*, void*);

version (Windows) {
	private import core.sys.windows.windows: GetProcAddress;
}
version (linux) {
	private import core.sys.posix.dlfcn: dlopen, dlsym, RTLD_GLOBAL, RTLD_LAZY;
    // На Linux эти функции не определены в core.runtime, вот и пришлось дописать.
    // странно, почему их там нет... Похоже они в основном Windows крутят. 
	// On Linux these functions aren't defined in core.runtime, here and it was necessary to add.
	// It is strange why they aren't present there... 
	// Probably they in the main Windows twist.
    private extern (C) void* rt_loadLibrary(const char* name) { return dlopen(name, RTLD_GLOBAL || RTLD_LAZY);  }
    private void* GetProcAddress(void* hLib, const char* nameFun) {  return dlsym(hLib, nameFun);    }
}
// Загрузить DLL. Load DLL (.so)
private void* GetHlib(T)(T name) { return core.runtime.Runtime.loadLibrary(name); }

// Найти адреса функций в DLL. To find addresses of executed out functions in DLL
private void* GetPrAddres(T)(bool isLoad, void* hLib, T nameFun) {
	// // Искать или не искать функцию. Find or not find function in library
	if (isLoad) return GetProcAddress(hLib, nameFun.ptr);
	return cast(void*) 1;
}
// Сообщить об ошибке загрузки. Message on error.
private void MessageErrorLoad(bool showError, string s, string nameDll = "" ) {
	if (showError) {
		if (!nameDll.length) writeln("Error load: " ~ s);
		else writeln("Error find function: " ~ nameDll ~ " ---> " ~ s);
	}
} /// Message on error. s - text error, sw=1 - error load dll and sw=2 - error find function

char* MSS(string s, int n) {
	if (n == QMETHOD)	return cast(char*)("0" ~ s ~ "\0").ptr;
	if (n == QSLOT) 	return cast(char*)("1" ~ s ~ "\0").ptr;
	if (n == QSIGNAL)	return cast(char*)("2" ~ s ~ "\0").ptr;
	return null;
} /// Моделирует макросы QT. Model macros Qt. For n=2->SIGNAL(), n=1->SLOT(), n=0->METHOD().

// Qt5Core & Qt5Gui & Qt5Widgets - Are loaded always
enum dll {
	QtE5Widgets = 0x1
} /// Загрузка DLL. Необходимо выбрать какие грузить. Load DLL, we mast change load

int LoadQt(dll ldll, bool showError) { ///  Загрузить DLL-ки Qt и QtE
	bool	bCore5, bGui5, bWidget5, bQtE5Widgets;
	string	sCore5, sGui5, sWidget5, sQtE5Widgets;
	void*	hCore5, hGui5, hWidget5, hQtE5Widgets;
	
	version (Windows) {
		sCore5			= "Qt5Core.dll";
		sGui5			= "Qt5Gui.dll";
		sWidget5		= "Qt5Widgets.dll";
		sQtE5Widgets	= "QtE5Widgets.dll";
	}
	version (linux) {
		sCore5			= "libQt5Core.so";
		sGui5			= "libQt5Gui.so";
		sWidget5		= "libQt5Widgets.so";
		sQtE5Widgets	= "libQtE5Widgets.so";
	}
	version (OSX) {
		sCore5			= "libQt5Core.so";
		sGui5			= "libQt5Gui.so";
		sWidget5		= "libQt5Widgets.so";
		sQtE5Widgets	= "libQtE5Widgets.so";
	}
	
	// Если на входе указана dll.QtE5Widgets то автоматом надо грузить и bCore5, bGui5, bWidget5
	// If on an input it is specified dll.QtE5Widgets then automatic loaded bCore5, bGui5, bWidget5
	bQtE5Widgets= ldll && dll.QtE5Widgets;
	if(bQtE5Widgets) { bCore5 = true; bGui5 = true; bWidget5 = true; }

	// Load library in memory
	if (bCore5) {
		hCore5 = GetHlib(sCore5); if (!hCore5) { MessageErrorLoad(showError, sCore5); return 1; }
	}
	if (bGui5) {
		hGui5 = GetHlib(sGui5);	if (!hGui5) { MessageErrorLoad(showError, sGui5); return 1; }
	}
	if (bWidget5) {
		hWidget5 = GetHlib(sWidget5); if (!hWidget5) { MessageErrorLoad(showError, sWidget5); return 1; }
	}
	if (bQtE5Widgets) {
		hQtE5Widgets = GetHlib(sQtE5Widgets); if (!hQtE5Widgets) { MessageErrorLoad(showError, sQtE5Widgets); return 1; }
	}
	// Find name function in DLL
	pFunQt[0] = GetPrAddres(bQtE5Widgets, hQtE5Widgets, "qteQApplication_create1");
		if (!pFunQt[0]) MessageErrorLoad(showError, "qteQApplication_create1", sQtE5Widgets);
	
	pFunQt[1] = GetPrAddres(bWidget5, hWidget5, "_ZN12QApplication4execEv");
		if (!pFunQt[1]) MessageErrorLoad(showError, "exec()", sWidget5);

	pFunQt[2] = GetPrAddres(bWidget5, hWidget5, "_ZN12QApplication7aboutQtEv");
		if (!pFunQt[2]) MessageErrorLoad(showError, "aboutQt()", sWidget5);

	pFunQt[3] = GetPrAddres(bQtE5Widgets, hQtE5Widgets, "qteQApplication_delete1");
		if (!pFunQt[3]) MessageErrorLoad(showError, "~Application1", sQtE5Widgets);

	pFunQt[4] = GetPrAddres(bQtE5Widgets, hQtE5Widgets, "qteQApplication_sizeof");
		if (!pFunQt[4]) MessageErrorLoad(showError, "sizeof", sQtE5Widgets);

	// Последний = 4
	return 0;
} ///  Загрузить DLL-ки Qt и QtE. Найти в них адреса функций и заполнить ими таблицу

/++
Класс констант. В нем кое что из Qt::
+/
class QtE {
	enum WindowType {
        Widget = 0x00000000,
        Window = 0x00000001,
        Dialog = 0x00000002 | Window,
        Sheet = 0x00000004 | Window,
        Drawer = Sheet | Dialog,
        Popup = 0x00000008 | Window,
        Tool = Popup | Dialog,
        ToolTip = Popup | Sheet,
        SplashScreen = ToolTip | Dialog,
        Desktop = 0x00000010 | Window,
        SubWindow = 0x00000012,
        ForeignWindow = 0x00000020 | Window,
        CoverWindow = 0x00000040 | Window
		// .... Qt5/QtCore/qnamespace.h
	}

	enum KeyboardModifier {
        NoModifier           = 0x00000000,
        ShiftModifier        = 0x02000000,
        ControlModifier      = 0x04000000,
        AltModifier          = 0x08000000,
        MetaModifier         = 0x10000000,
        KeypadModifier       = 0x20000000,
        GroupSwitchModifier  = 0x40000000,
        // Do not extend the mask to include 0x01000000
        KeyboardModifierMask = 0xfe000000 	
	}
	// Политика контексного меню
	enum ContextMenuPolicy {
		NoContextMenu = 0, // нет контексного меню
		DefaultContextMenu = 1, //
		ActionsContextMenu = 2, //
		CustomContextMenu = 3, //
		PreventContextMenu = 4 //
	}

	enum Key {
		Key_ControlModifier = 0x04000000,
		Key_Escape = 0x01000000, // misc keys
		Key_Tab = 0x01000001,
		Key_Backtab = 0x01000002,
		Key_Backspace = 0x01000003,
		Key_Return = 0x01000004,
		Key_Enter = 0x01000005,
		Key_Insert = 0x01000006,
		Key_Delete = 0x01000007,
		Key_Pause = 0x01000008,
		Key_Print = 0x01000009,
		Key_SysReq = 0x0100000a,
		Key_Clear = 0x0100000b,
		Key_Home = 0x01000010, // cursor movement
		Key_End = 0x01000011,
		Key_Left = 0x01000012,
		Key_Up = 0x01000013,
		Key_Right = 0x01000014,
		Key_Down = 0x01000015,
		Key_PageUp = 0x01000016,
		Key_Shift = 0x01000020, // modifiers
		Key_Control = 0x01000021,
		Key_Meta = 0x01000022,
		Key_Alt = 0x01000023,
		Key_CapsLock = 0x01000024,
		Key_NumLock = 0x01000025,
		Key_ScrollLock = 0x01000026,
		Key_F1 = 0x01000030, // function keys
		Key_F2 = 0x01000031,
		Key_F3 = 0x01000032,
		Key_F4 = 0x01000033,
		Key_F5 = 0x01000034,
		Key_F6 = 0x01000035,
		Key_F7 = 0x01000036,
		Key_F8 = 0x01000037,
		Key_F9 = 0x01000038,
		Key_F10 = 0x01000039,
		Key_F11 = 0x0100003a,
		Key_F12 = 0x0100003b,
		Key_F13 = 0x0100003c,
		Key_F14 = 0x0100003d,
		Key_F15 = 0x0100003e,
		Key_F16 = 0x0100003f,
		Key_F17 = 0x01000040,
		Key_F18 = 0x01000041,
		Key_F19 = 0x01000042,
		Key_F20 = 0x01000043,
		Key_F21 = 0x01000044,
		Key_F22 = 0x01000045,
		Key_F23 = 0x01000046,
		Key_F24 = 0x01000047,
		Key_F25 = 0x01000048, // F25 .. F35 only on X11
		Key_F26 = 0x01000049,
		Key_F27 = 0x0100004a,
		Key_F28 = 0x0100004b,
		Key_F29 = 0x0100004c,
		Key_F30 = 0x0100004d,
		Key_F31 = 0x0100004e,
		Key_F32 = 0x0100004f,
		Key_F33 = 0x01000050,
		Key_F34 = 0x01000051,
		Key_F35 = 0x01000052,
		Key_Super_L = 0x01000053, // extra keys
		Key_Super_R = 0x01000054,
		Key_Menu = 0x01000055,
		Key_Hyper_L = 0x01000056,
		Key_Hyper_R = 0x01000057,
		Key_Help = 0x01000058,
		Key_Direction_L = 0x01000059,
		Key_Direction_R = 0x01000060,
		Key_Space = 0x20, // 7 bit printable ASCII
		Key_Any = Key_Space,
		Key_Exclam = 0x21,
		Key_QuoteDbl = 0x22,
		Key_NumberSign = 0x23,
		Key_Dollar = 0x24,
		Key_Percent = 0x25,
		Key_Ampersand = 0x26,
		Key_Apostrophe = 0x27,
		Key_ParenLeft = 0x28,
		Key_ParenRight = 0x29,
		Key_Asterisk = 0x2a,
		Key_Plus = 0x2b,
		Key_Comma = 0x2c,
		Key_Minus = 0x2d,
		Key_Period = 0x2e,
		Key_Slash = 0x2f,
		Key_0 = 0x30,
		Key_1 = 0x31,
		Key_2 = 0x32,
		Key_3 = 0x33,
		Key_4 = 0x34,
		Key_5 = 0x35,
		Key_6 = 0x36,
		Key_7 = 0x37,
		Key_8 = 0x38,
		Key_9 = 0x39,
		Key_Colon = 0x3a,
		Key_Semicolon = 0x3b,
		Key_Less = 0x3c,
		Key_Equal = 0x3d,
		Key_Greater = 0x3e,
		Key_Question = 0x3f,
		Key_At = 0x40,
		Key_A = 0x41,
		Key_B = 0x42,
		Key_C = 0x43,
		Key_D = 0x44,
		Key_E = 0x45,
		Key_F = 0x46,
		Key_G = 0x47,
		Key_H = 0x48,
		Key_I = 0x49,
		Key_J = 0x4a,
		Key_K = 0x4b,
		Key_L = 0x4c,
		Key_M = 0x4d,
		Key_N = 0x4e,
		Key_O = 0x4f,
		Key_P = 0x50,
		Key_Q = 0x51,
		Key_R = 0x52,
		Key_S = 0x53,
		Key_T = 0x54,
		Key_U = 0x55,
		Key_V = 0x56,
		Key_W = 0x57,
		Key_X = 0x58,
		Key_Y = 0x59,
		Key_Z = 0x5a,
		Key_BracketLeft = 0x5b,
		Key_Backslash = 0x5c,
		Key_BracketRight = 0x5d,
		Key_AsciiCircum = 0x5e,
		Key_Underscore = 0x5f,
		Key_QuoteLeft = 0x60,
		Key_BraceLeft = 0x7b,
		Key_Bar = 0x7c,
		Key_BraceRight = 0x7d,
		Key_AsciiTilde = 0x7e,
		Key_nobreakspace = 0x0a0,
		Key_exclamdown = 0x0a1,
		Key_cent = 0x0a2,
		Key_sterling = 0x0a3,
		Key_currency = 0x0a4,
		Key_yen = 0x0a5,
		Key_brokenbar = 0x0a6,
		Key_section = 0x0a7,
		Key_diaeresis = 0x0a8,
		Key_copyright = 0x0a9,
		Key_ordfeminine = 0x0aa,
		Key_guillemotleft = 0x0ab, // left angle quotation mark
		Key_notsign = 0x0ac,
		Key_hyphen = 0x0ad,
		Key_registered = 0x0ae,
		Key_macron = 0x0af,
		Key_degree = 0x0b0,
		Key_plusminus = 0x0b1,
		Key_twosuperior = 0x0b2,
		Key_threesuperior = 0x0b3,
		Key_acute = 0x0b4,
		Key_mu = 0x0b5,
		Key_paragraph = 0x0b6,
		Key_periodcentered = 0x0b7,
		Key_cedilla = 0x0b8,
		Key_onesuperior = 0x0b9,
		Key_masculine = 0x0ba,
		Key_guillemotright = 0x0bb, // right angle quotation mark
		Key_onequarter = 0x0bc,
		Key_onehalf = 0x0bd,
		Key_threequarters = 0x0be,
		Key_questiondown = 0x0bf,
		Key_Agrave = 0x0c0,
		Key_Aacute = 0x0c1,
		Key_Acircumflex = 0x0c2,
		Key_Atilde = 0x0c3,
		Key_Adiaeresis = 0x0c4,
		Key_Aring = 0x0c5,
		Key_AE = 0x0c6,
		Key_Ccedilla = 0x0c7,
		Key_Egrave = 0x0c8,
		Key_Eacute = 0x0c9,
		Key_Ecircumflex = 0x0ca,
		Key_Ediaeresis = 0x0cb,
		Key_Igrave = 0x0cc,
		Key_Iacute = 0x0cd,
		Key_Icircumflex = 0x0ce,
		Key_Idiaeresis = 0x0cf,
		Key_ETH = 0x0d0,
		Key_Ntilde = 0x0d1,
		Key_Ograve = 0x0d2,
		Key_Oacute = 0x0d3,
		Key_Ocircumflex = 0x0d4,
		Key_Otilde = 0x0d5,
		Key_Odiaeresis = 0x0d6,
		Key_multiply = 0x0d7,
		Key_Ooblique = 0x0d8,
		Key_Ugrave = 0x0d9,
		Key_Uacute = 0x0da,
		Key_Ucircumflex = 0x0db,
		Key_Udiaeresis = 0x0dc,
		Key_Yacute = 0x0dd,
		Key_THORN = 0x0de,
		Key_ssharp = 0x0df,
		Key_division = 0x0f7,
		Key_ydiaeresis = 0x0ff,
		Key_AltGr = 0x01001103,
		Key_Multi_key = 0x01001120, // Multi-key character compose
		Key_Codeinput = 0x01001137,
		Key_SingleCandidate = 0x0100113c,
		Key_MultipleCandidate = 0x0100113d,
		Key_PreviousCandidate = 0x0100113e,
		Key_unknown = 0x01ffffff
	}

	enum AlignmentFlag {
		AlignLeft = 0x0001,
		AlignLeading = AlignLeft,
		AlignRight = 0x0002,
		AlignTrailing = AlignRight,
		AlignHCenter = 0x0004,
		AlignJustify = 0x0008,
		AlignAbsolute = 0x0010,
		AlignHorizontal_Mask = AlignLeft | AlignRight | AlignHCenter | AlignJustify | AlignAbsolute,

		AlignTop = 0x0020,
		AlignBottom = 0x0040,
		AlignVCenter = 0x0080,
		AlignVertical_Mask = AlignTop | AlignBottom | AlignVCenter,
		AlignCenter = AlignVCenter | AlignHCenter,
		AlignAuto = AlignLeft
	}

	enum GlobalColor {
		color0,
		color1,
		black,
		white,
		darkGray,
		gray,
		lightGray,
		red,
		green,
		blue,
		cyan,
		magenta,
		yellow,
		darkRed,
		darkGreen,
		darkBlue,
		darkCyan,
		darkMagenta,
		darkYellow,
		transparent
	}
}
// ================ QObject ================
/++
Базовый класс.  Хранит в себе ссылку на реальный объект в Qt C++
Base class. Stores in itself the link to real object in Qt C ++
+/
class QObject {
	// Тип связи сигнал - слот
	enum ConnectionType {
		AutoConnection = 0,				// default. Если thred другой, то в очередь, иначе сразу выполнение
		DirectConnection = 1,			// Выполнить немедленно
		QueuedConnection = 2,			// Сигнал в очередь
		BlockingQueuedConnection = 4,	// Только для разных thred
		UniqueConnection = 0x80,		// Как AutoConnection, но обязательно уникальный
		AutoCompatConnection = 3 		// совместимость с Qt3
	}

	private void* p_QObject; /// Адрес самого объекта из C++ Qt

	this() {
		// writeln(" QObject ", this);
	} /// спец Конструктор, что бы не делать реальный объект из Qt при наследовании
	~this() {
		// writeln("~QObject ", this);
	}
	void setQtObj(void* adr) {
		p_QObject = adr;
	} /// Заменить указатель в объекте на новый указатель
	@property void* QtObj() {
		return p_QObject;
	} /// Выдать указатель на реальный объект Qt C++
	@property void* aQtObj() {
		return &p_QObject;
	} /// Выдать указатель на p_QObject
	void setNullQtObj() {
		p_QObject = null;
	}

}

// ================ QApplication ================
/++
Класс приложения. <b>Внимание:</b>
+/
private struct stQApplication {
	void* rref;
	int   alloc;
	int   size;
	char* data;      // Вот собственно за чем нам это нужно, указатель на массив байтов
	char  array[1];
}
class QApplication : QObject {
	this(int* m_argc, char** m_argv, int gui) {
		super(); setQtObj((cast(t_vp__vp_vp_i) pFunQt[0])(m_argc, m_argv, gui));
	} /// QApplication::QApplication(argc, argv, param);
	~this() {
		(cast(t_v__vp) pFunQt[3])(QtObj); setQtObj(null);
	} ///  QApplication::~QApplication();
	int exec() {
		return (cast(t_i__vp) pFunQt[1])(QtObj);
	} /// QApplication::exec()
	void aboutQt() {
		(cast(t_v__vp) pFunQt[2])(QtObj);
	} /// QApplication::aboutQt()
	int sizeOfQtObj() {
		return (cast(t_i__vp) pFunQt[4])(QtObj);
	} /// Размер объекта QApplicatin. Size of QApplicatin
}