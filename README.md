# FINALYEAR_PROJECT

# 🏥 Enhancing Healthcare Imaging Security Using Pairing-Free Revocable Certificateless Encryption

## 🔐 Project Overview

This project implements a **Pairing-Free Revocable Certificateless Encryption (PF-RCLE)** scheme for securing sensitive healthcare data—especially medical images like X-rays, CT, and MRI scans. The encryption model is lightweight, scalable, and optimized for resource-constrained medical sensor nodes (MSNs) in IoMT environments.

It ensures secure access control through:
- **Dynamic key revocation**
- **Ciphertext evolution**
- **Certificateless encryption**
- **OTP-based access mechanisms**

---

## 🛠️ Technologies Used

- **Frontend**: HTML, CSS, JavaScript  
- **Backend**: ASP.NET (C#)  
- **Database**: SQL Server  
- **Cloud Storage**: DriveHQ  
- **IDE**: Microsoft Visual Studio 2010  

---

## 📂 How to Run the Project

1. Open **Visual Studio 2010**
2. Click `File` → `Open` → `Website`
3. Navigate to the path:  
4. In **Solution Explorer**, right-click on `Home.aspx` → Select **Set as Start Page**
5. Press **F5** or click **Run** to launch the ASP.NET development server
6. The browser will open the default home page of the web application

---

## 👨‍⚕️ Functional Modules

### 1. Medical Server
- Registration & login
- Send secure OTP requests to patients
- Upload encrypted medical reports

### 2. Patient
- Registration & OTP-based login
- Approve/reject access requests from doctors
- Upload & view encrypted medical records

### 3. Cloud Storage (DriveHQ)
- Encrypted files stored securely
- Access restricted to authorized users

---

## 🛡️ Key Features

- ✅ Pairing-Free Certificateless Encryption
- ✅ Lightweight cryptography suitable for MSNs
- ✅ Key revocation with **no need to re-encrypt** old data
- ✅ Forward & backward secrecy through ciphertext evolution
- ✅ OTP-based login for added security
- ✅ Role-based access control

---

## 🖼️ Sample Screens

- Medical Server Registration/Login
- Patient Registration/Login via OTP
- Access Request & Secure Report Upload
- View stored encrypted reports from DriveHQ

---

## ⚙️ System Architecture

- **KGC (Key Generation Centre)** – Issues partial private keys & master time key  
- **MSNs** – Encrypt health data and transmit securely  
- **Medical Server** – Updates ciphertext with Time Update Key  
- **AHP (Authorized Healthcare Professional)** – Decrypts evolved ciphertext to access patient records  

---

## 🚀 Future Enhancements

- Biometric-based authentication
- AI-based analysis on encrypted medical data
- Blockchain integration for audit trails
- Support for interoperability with Electronic Health Records (EHR)
- Compliance with HIPAA, GDPR, and other global standards

---

## 📚 References

1. M. R. Singh et al., “A Novel Pairing-Free Revocable Certificateless Encryption,” IEEE Access, 2025.
2. DriveHQ Cloud Storage – [https://www.drivehq.com](https://www.drivehq.com)
3. ASP.NET Official Docs – [https://learn.microsoft.com/en-us/aspnet](https://learn.microsoft.com/en-us/aspnet)

---

## 👩‍💻 Developed By

**Aashika C**  
Final Year Project  
Department of Computer Science and Engineering 
[Arunachala College of Engineering for Women]

---
