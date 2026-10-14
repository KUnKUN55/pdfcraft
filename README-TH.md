# PdfCraft ภาษาไทย (ฉบับไม่เป็นทางการ)

PdfCraft ฉบับปรับปรุงให้ใช้งานภาษาไทยได้เต็มรูปแบบ ต่อยอดจาก [PdfCraft](https://github.com/storytold/pdfcraft) ของ ArtCraft
**ฉบับนี้ไม่ใช่ฉบับทางการ** และไม่ได้อยู่ในความดูแลของผู้พัฒนา PdfCraft หากพบปัญหาในฉบับนี้ โปรดแจ้งที่ Issues ของ repository นี้ ไม่ใช่ที่โปรเจกต์ต้นฉบับ

> English: an unofficial Thai edition of PdfCraft (Thai UI, Thai text editing, TH Sarabun PSK and
> installed-font support). Based on upstream commit `87b448b`. Not affiliated with or endorsed by
> the PdfCraft authors.

## มีอะไรเพิ่มจากต้นฉบับ

- **หน้าจอภาษาไทย** เลือกได้ที่การตั้งค่า › ภาษา › ไทย
- **พิมพ์ข้อความภาษาไทยลงใน PDF ได้** (เพิ่มข้อความ และแก้ไขข้อความเดิม) สระและวรรณยุกต์วางตำแหน่งถูกต้อง
- **ฟอนต์ TH Sarabun PSK ในตัว** ทั้งตัวปกติ ตัวหนา ตัวเอียง และตัวหนาเอียง
- **ใช้ฟอนต์ที่ติดตั้งในเครื่องได้** เหมือน Word หรือ Acrobat
- **เมนูฟอนต์แบบใหม่:**
  - พิมพ์เพื่อค้นหาชื่อฟอนต์ได้
  - ฟอนต์ที่รองรับภาษาไทยมีป้าย **TH** กำกับ
  - เลื่อนเมาส์ผ่านชื่อฟอนต์เพื่อดูตัวอย่างก่อนเลือกได้
- **ขนาดตัวอักษรพิมพ์ตัวเลขเองได้** ตั้งแต่ 1–500 pt
- **กล่องข้อความปรับขนาดตามข้อความอัตโนมัติ**
- **กดลูกศรเพื่อขยับกล่องข้อความ** ทีละ 1 pt หรือกด Shift ค้างไว้เพื่อขยับทีละ 10 pt

## ดาวน์โหลดและติดตั้ง (Windows 64 บิต)

1. ดาวน์โหลดไฟล์ `.zip` จากหน้า [Releases](../../releases)
2. แตกไฟล์ไว้ในโฟลเดอร์ใดก็ได้ แล้วเปิด `pdfcraft.exe`
   ฉบับนี้เป็นแบบ portable ไม่ต้องติดตั้ง การตั้งค่าเก็บไว้ในโฟลเดอร์ `PdfCraftData` ข้างไฟล์โปรแกรม
3. เปลี่ยนภาษาเป็นไทยที่การตั้งค่า (Preferences) › Language › ไทย

**หมายเหตุ:** ไฟล์โปรแกรมในฉบับนี้ไม่มีลายเซ็นดิจิทัล Windows SmartScreen หรือโปรแกรมป้องกันไวรัสจึงอาจเตือนหรือบล็อกตอนเปิดครั้งแรก
ตรวจสอบได้ว่าไฟล์ไม่ถูกแก้ไขระหว่างทางโดยเทียบค่า SHA-256 ที่ระบุในหน้า Release

## Build เอง

ต้องมี [Rust](https://rustup.rs) และ Visual Studio Build Tools (เลือก workload C++) จากนั้นสั่ง:

```powershell
powershell -ExecutionPolicy Bypass -File thai\build-windows.ps1
```

สคริปต์จะดาวน์โหลดชุดฟอนต์ craft-fonts รุ่นเดียวกับที่ PdfCraft ใช้ เพิ่ม TH Sarabun PSK จากโฟลเดอร์ `thai/fonts` แล้ว build ไฟล์ออกมาที่ `target\release`

## สัญญาอนุญาต

- **ตัวโปรแกรม:** PdfCraft ใช้สัญญาอนุญาต MIT หรือ Apache-2.0 (ดู `LICENSE-MIT` และ `LICENSE-APACHE`) ส่วนที่ฉบับนี้แก้ไขและเพิ่มเติม รวมถึงคำแปลภาษาไทย เผยแพร่ภายใต้สัญญาอนุญาตเดียวกัน
- **ฟอนต์ TH Sarabun PSK:** ใช้สัญญาอนุญาต SIL Open Font License 1.1 (ดู `thai/fonts/th-sarabun-psk/OFL.txt`) ที่มา: https://github.com/SarabunConsortium/TH-Sarabun-PSK
- **คำแปลภาษาไทย:** แปลใหม่จากความหมายของข้อความภาษาอังกฤษในโปรแกรม ไม่ได้คัดลอกจากคำแปลของโปรแกรมเชิงพาณิชย์ใด ๆ
