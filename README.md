# Light Beam Text Animation in SwiftUI

This SwiftUI demo showcases an animated light beam effect that rotates over the text `"Light"`. The animation simulates a dynamic cone of light that pivots from the dot of the letter **"i"**, revealing the text beneath it as the beam sweeps across.

🎨 **Inspired by the beautiful Dribbble design:**  
[Light II by Alexey Konkov](https://dribbble.com/shots/5414044-Light-II)

---

## ⚠️ Font Requirement: Poppins Black

To achieve the correct appearance—especially the alignment with the `"i"` dot—you must include the **Poppins Black** font in your project.

### 📦 How to Add the Font

1. **Download the font:**
   - Visit [Google Fonts](https://fonts.google.com/specimen/Poppins).
   - Select the **Black 900** style and download the ZIP file.

2. **Add the `.ttf` file to your project:**
   - Drag and drop `Poppins-Black.ttf` into your Xcode project (e.g., into a `Resources/Fonts` folder).
   - Ensure the font is added to your app target.

3. **Register the font in `Info.plist`:**

   Add the following entry:

   ```xml
   <key>UIAppFonts</key>
   <array>
       <string>Poppins-Black.ttf</string>
   </array>
