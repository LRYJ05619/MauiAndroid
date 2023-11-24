; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [156 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [312 x i32] [
	i32 10266594, ; 0: LiveChartsCore.SkiaSharpView.dll => 0x9ca7e2 => 40
	i32 38948123, ; 1: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 0
	i32 39109920, ; 2: Newtonsoft.Json.dll => 0x254c520 => 58
	i32 42244203, ; 3: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 9
	i32 42639949, ; 4: System.Threading.Thread => 0x28aa24d => 143
	i32 67008169, ; 5: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 6: Microsoft.Maui.Graphics.dll => 0x44bb714 => 57
	i32 83839681, ; 7: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 17
	i32 117431740, ; 8: System.Runtime.InteropServices => 0x6ffddbc => 133
	i32 136584136, ; 9: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 32
	i32 140062828, ; 10: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 25
	i32 165246403, ; 11: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 70
	i32 182336117, ; 12: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 88
	i32 205061960, ; 13: System.ComponentModel => 0xc38ff48 => 108
	i32 230752869, ; 14: Microsoft.CSharp.dll => 0xdc10265 => 100
	i32 246610117, ; 15: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 131
	i32 303253550, ; 16: Console => 0x1213482e => 99
	i32 317674968, ; 17: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 18: Xamarin.AndroidX.Activity.dll => 0x13031348 => 66
	i32 321963286, ; 19: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 8
	i32 342366114, ; 20: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 77
	i32 379916513, ; 21: System.Threading.Thread.dll => 0x16a510e1 => 143
	i32 385762202, ; 22: System.Memory.dll => 0x16fe439a => 119
	i32 395744057, ; 23: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 409257351, ; 24: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 28
	i32 442565967, ; 25: System.Collections => 0x1a61054f => 105
	i32 450948140, ; 26: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 76
	i32 456227837, ; 27: System.Web.HttpUtility.dll => 0x1b317bfd => 145
	i32 459347974, ; 28: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 136
	i32 465846621, ; 29: mscorlib => 0x1bc4415d => 150
	i32 469710990, ; 30: System.dll => 0x1bff388e => 149
	i32 489220957, ; 31: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 6
	i32 498788369, ; 32: System.ObjectModel => 0x1dbae811 => 126
	i32 504143952, ; 33: Plugin.LocalNotification.dll => 0x1e0ca050 => 59
	i32 513247710, ; 34: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 51
	i32 525008092, ; 35: SkiaSharp.dll => 0x1f4afcdc => 60
	i32 538707440, ; 36: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 27
	i32 539058512, ; 37: Microsoft.Extensions.Logging => 0x20216150 => 48
	i32 597488923, ; 38: CommunityToolkit.Maui => 0x239cf51b => 35
	i32 627609679, ; 39: Xamarin.AndroidX.CustomView => 0x2568904f => 74
	i32 627931235, ; 40: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 41: System.Text.Encodings.Web.dll => 0x27787397 => 140
	i32 663517072, ; 42: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 89
	i32 672442732, ; 43: System.Collections.Concurrent => 0x2814a96c => 101
	i32 690569205, ; 44: System.Xml.Linq.dll => 0x29293ff5 => 146
	i32 759454413, ; 45: System.Net.Requests => 0x2d445acd => 124
	i32 775507847, ; 46: System.IO.Compression => 0x2e394f87 => 116
	i32 777317022, ; 47: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 778756650, ; 48: SkiaSharp.HarfBuzz.dll => 0x2e6ae22a => 61
	i32 789151979, ; 49: Microsoft.Extensions.Options => 0x2f0980eb => 50
	i32 804715423, ; 50: System.Data.Common => 0x2ff6fb9f => 110
	i32 823281589, ; 51: System.Private.Uri.dll => 0x311247b5 => 127
	i32 830298997, ; 52: System.IO.Compression.Brotli => 0x317d5b75 => 115
	i32 869139383, ; 53: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 10
	i32 878954865, ; 54: System.Net.Http.Json => 0x3463c971 => 120
	i32 880668424, ; 55: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 24
	i32 886248193, ; 56: Microcharts.Droid => 0x34d31301 => 42
	i32 904024072, ; 57: System.ComponentModel.Primitives.dll => 0x35e25008 => 106
	i32 918734561, ; 58: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 21
	i32 955402788, ; 59: Newtonsoft.Json => 0x38f24a24 => 58
	i32 961460050, ; 60: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 14
	i32 967690846, ; 61: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 77
	i32 975874589, ; 62: System.Xml.XDocument => 0x3a2aaa1d => 148
	i32 990727110, ; 63: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 23
	i32 992768348, ; 64: System.Collections.dll => 0x3b2c715c => 105
	i32 1012816738, ; 65: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 87
	i32 1019214401, ; 66: System.Drawing => 0x3cbffa41 => 114
	i32 1028951442, ; 67: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 47
	i32 1034083993, ; 68: LiveChartsCore.SkiaSharpView.Maui.dll => 0x3da2de99 => 41
	i32 1035644815, ; 69: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 67
	i32 1036536393, ; 70: System.Drawing.Primitives.dll => 0x3dc84a49 => 113
	i32 1043950537, ; 71: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 4
	i32 1044663988, ; 72: System.Linq.Expressions.dll => 0x3e444eb4 => 117
	i32 1052210849, ; 73: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 79
	i32 1082857460, ; 74: System.ComponentModel.TypeConverter => 0x408b17f4 => 107
	i32 1084122840, ; 75: Xamarin.Kotlin.StdLib => 0x409e66d8 => 97
	i32 1098259244, ; 76: System => 0x41761b2c => 149
	i32 1108272742, ; 77: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 26
	i32 1117529484, ; 78: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 20
	i32 1118262833, ; 79: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 80: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 81: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 84
	i32 1214827643, ; 82: CommunityToolkit.Mvvm => 0x4868cc7b => 37
	i32 1260983243, ; 83: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1283425954, ; 84: LiveChartsCore.SkiaSharpView => 0x4c7f86a2 => 40
	i32 1293217323, ; 85: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 75
	i32 1308624726, ; 86: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 11
	i32 1324164729, ; 87: System.Linq => 0x4eed2679 => 118
	i32 1336711579, ; 88: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 31
	i32 1373134921, ; 89: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 90: Xamarin.AndroidX.SavedState => 0x52114ed3 => 87
	i32 1406073936, ; 91: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 71
	i32 1408764838, ; 92: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 135
	i32 1430672901, ; 93: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 94: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 95: System.Collections.Immutable.dll => 0x5718a9ef => 102
	i32 1462112819, ; 96: System.IO.Compression.dll => 0x57261233 => 116
	i32 1469204771, ; 97: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 68
	i32 1470490898, ; 98: Microsoft.Extensions.Primitives => 0x57a5e912 => 51
	i32 1479771757, ; 99: System.Collections.Immutable => 0x5833866d => 102
	i32 1480492111, ; 100: System.IO.Compression.Brotli.dll => 0x583e844f => 115
	i32 1524747670, ; 101: Plugin.LocalNotification => 0x5ae1cd96 => 59
	i32 1526286932, ; 102: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 30
	i32 1543031311, ; 103: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 142
	i32 1622152042, ; 104: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 81
	i32 1623212457, ; 105: SkiaSharp.Views.Maui.Controls => 0x60c041a9 => 63
	i32 1624863272, ; 106: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 91
	i32 1634654947, ; 107: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 36
	i32 1636350590, ; 108: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 73
	i32 1639515021, ; 109: System.Net.Http.dll => 0x61b9038d => 121
	i32 1639986890, ; 110: System.Text.RegularExpressions => 0x61c036ca => 142
	i32 1657153582, ; 111: System.Runtime => 0x62c6282e => 137
	i32 1658251792, ; 112: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 92
	i32 1677501392, ; 113: System.Net.Primitives.dll => 0x63fca3d0 => 123
	i32 1679769178, ; 114: System.Security.Cryptography => 0x641f3e5a => 138
	i32 1729485958, ; 115: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 69
	i32 1743415430, ; 116: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1763938596, ; 117: System.Diagnostics.TraceSource.dll => 0x69239124 => 112
	i32 1766324549, ; 118: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 88
	i32 1770582343, ; 119: Microsoft.Extensions.Logging.dll => 0x6988f147 => 48
	i32 1780572499, ; 120: Mono.Android.Runtime.dll => 0x6a216153 => 154
	i32 1782862114, ; 121: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 122: Xamarin.AndroidX.Fragment => 0x6a96652d => 76
	i32 1793755602, ; 123: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 124: Xamarin.AndroidX.Loader => 0x6bcd3296 => 81
	i32 1813058853, ; 125: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 97
	i32 1813201214, ; 126: Xamarin.Google.Android.Material => 0x6c13413e => 92
	i32 1818569960, ; 127: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 85
	i32 1824175904, ; 128: System.Text.Encoding.Extensions => 0x6cbab720 => 139
	i32 1824722060, ; 129: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 135
	i32 1828688058, ; 130: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 49
	i32 1853025655, ; 131: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 132: System.Linq.Expressions => 0x6ec71a65 => 117
	i32 1870277092, ; 133: System.Reflection.Primitives => 0x6f7a29e4 => 132
	i32 1875935024, ; 134: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1893218855, ; 135: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 2
	i32 1908813208, ; 136: Xamarin.GooglePlayServices.Basement => 0x71c62d98 => 94
	i32 1910275211, ; 137: System.Collections.NonGeneric.dll => 0x71dc7c8b => 103
	i32 1939592360, ; 138: System.Private.Xml.Linq => 0x739bd4a8 => 128
	i32 1953182387, ; 139: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 13
	i32 1968388702, ; 140: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 44
	i32 2003115576, ; 141: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 142: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 79
	i32 2045470958, ; 143: System.Private.Xml => 0x79eb68ee => 129
	i32 2055257422, ; 144: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 78
	i32 2066184531, ; 145: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 146: System.Diagnostics.TraceSource => 0x7b6f419e => 112
	i32 2079903147, ; 147: System.Runtime.dll => 0x7bf8cdab => 137
	i32 2090596640, ; 148: System.Numerics.Vectors => 0x7c9bf920 => 125
	i32 2127167465, ; 149: System.Console => 0x7ec9ffe9 => 109
	i32 2129483829, ; 150: Xamarin.GooglePlayServices.Base.dll => 0x7eed5835 => 93
	i32 2142473426, ; 151: System.Collections.Specialized => 0x7fb38cd2 => 104
	i32 2159891885, ; 152: Microsoft.Maui => 0x80bd55ad => 55
	i32 2169148018, ; 153: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 154: Microsoft.Extensions.Options.dll => 0x820d22b3 => 50
	i32 2192057212, ; 155: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 49
	i32 2193016926, ; 156: System.ObjectModel.dll => 0x82b6c85e => 126
	i32 2201107256, ; 157: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 98
	i32 2201231467, ; 158: System.Net.Http => 0x8334206b => 121
	i32 2207618523, ; 159: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 160: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 45
	i32 2279755925, ; 161: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 86
	i32 2298471582, ; 162: System.Net.Mail => 0x88ffe49e => 122
	i32 2303942373, ; 163: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 164: System.Private.CoreLib.dll => 0x896b7878 => 152
	i32 2353062107, ; 165: System.Net.Primitives => 0x8c40e0db => 123
	i32 2364201794, ; 166: SkiaSharp.Views.Maui.Core => 0x8ceadb42 => 65
	i32 2366048013, ; 167: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 12
	i32 2368005991, ; 168: System.Xml.ReaderWriter.dll => 0x8d24e767 => 147
	i32 2371007202, ; 169: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 44
	i32 2395872292, ; 170: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2401565422, ; 171: System.Web.HttpUtility => 0x8f24faee => 145
	i32 2427813419, ; 172: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 173: System.Console.dll => 0x912896e5 => 109
	i32 2471841756, ; 174: netstandard.dll => 0x93554fdc => 151
	i32 2475788418, ; 175: Java.Interop.dll => 0x93918882 => 153
	i32 2480646305, ; 176: Microsoft.Maui.Controls => 0x93dba8a1 => 53
	i32 2503351294, ; 177: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 16
	i32 2521915375, ; 178: SkiaSharp.Views.Maui.Controls.Compatibility => 0x96515fef => 64
	i32 2538310050, ; 179: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 131
	i32 2550873716, ; 180: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2556439392, ; 181: LiveChartsCore.SkiaSharpView.Maui => 0x98602b60 => 41
	i32 2562349572, ; 182: Microsoft.CSharp => 0x98ba5a04 => 100
	i32 2570120770, ; 183: System.Text.Encodings.Web => 0x9930ee42 => 140
	i32 2575933364, ; 184: Console.dll => 0x99899fb4 => 99
	i32 2576534780, ; 185: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 15
	i32 2585220780, ; 186: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 139
	i32 2593496499, ; 187: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 188: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 98
	i32 2617129537, ; 189: System.Private.Xml.dll => 0x9bfe3a41 => 129
	i32 2620871830, ; 190: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 73
	i32 2625339995, ; 191: SkiaSharp.Views.Maui.Core.dll => 0x9c7b825b => 65
	i32 2626831493, ; 192: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2664396074, ; 193: System.Xml.XDocument.dll => 0x9ecf752a => 148
	i32 2665622720, ; 194: System.Drawing.Primitives => 0x9ee22cc0 => 113
	i32 2676780864, ; 195: System.Data.Common.dll => 0x9f8c6f40 => 110
	i32 2724373263, ; 196: System.Runtime.Numerics.dll => 0xa262a30f => 134
	i32 2732626843, ; 197: Xamarin.AndroidX.Activity => 0xa2e0939b => 66
	i32 2737747696, ; 198: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 68
	i32 2740698338, ; 199: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 1
	i32 2752995522, ; 200: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 201: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 54
	i32 2764765095, ; 202: Microsoft.Maui.dll => 0xa4caf7a7 => 55
	i32 2778768386, ; 203: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 90
	i32 2785988530, ; 204: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2795602088, ; 205: SkiaSharp.Views.Android.dll => 0xa6a180a8 => 62
	i32 2801831435, ; 206: Microsoft.Maui.Graphics => 0xa7008e0b => 57
	i32 2810250172, ; 207: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 71
	i32 2847418871, ; 208: Xamarin.GooglePlayServices.Base => 0xa9b829f7 => 93
	i32 2853208004, ; 209: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 90
	i32 2861189240, ; 210: Microsoft.Maui.Essentials => 0xaa8a4878 => 56
	i32 2868488919, ; 211: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 36
	i32 2905242038, ; 212: mscorlib.dll => 0xad2a79b6 => 150
	i32 2909740682, ; 213: System.Private.CoreLib => 0xad6f1e8a => 152
	i32 2912489636, ; 214: SkiaSharp.Views.Android => 0xad9910a4 => 62
	i32 2916838712, ; 215: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 91
	i32 2919462931, ; 216: System.Numerics.Vectors.dll => 0xae037813 => 125
	i32 2959614098, ; 217: System.ComponentModel.dll => 0xb0682092 => 108
	i32 2978675010, ; 218: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 75
	i32 3036068679, ; 219: Microcharts.Droid.dll => 0xb4f6bb47 => 42
	i32 3038032645, ; 220: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3053864966, ; 221: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 7
	i32 3057625584, ; 222: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 82
	i32 3058099980, ; 223: Xamarin.GooglePlayServices.Tasks => 0xb646e70c => 96
	i32 3059408633, ; 224: Mono.Android.Runtime => 0xb65adef9 => 154
	i32 3059793426, ; 225: System.ComponentModel.Primitives => 0xb660be12 => 106
	i32 3081706019, ; 226: LiveChartsCore => 0xb7af1a23 => 39
	i32 3159123045, ; 227: System.Reflection.Primitives.dll => 0xbc4c6465 => 132
	i32 3178803400, ; 228: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 83
	i32 3220365878, ; 229: System.Threading => 0xbff2e236 => 144
	i32 3230466174, ; 230: Xamarin.GooglePlayServices.Basement.dll => 0xc08d007e => 94
	i32 3258312781, ; 231: Xamarin.AndroidX.CardView => 0xc235e84d => 69
	i32 3305363605, ; 232: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 233: System.Net.Requests.dll => 0xc5b097e4 => 124
	i32 3317135071, ; 234: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 74
	i32 3340387945, ; 235: SkiaSharp => 0xc71a4669 => 60
	i32 3346324047, ; 236: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 84
	i32 3357674450, ; 237: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 238: System.Text.Json => 0xc82afec1 => 141
	i32 3362522851, ; 239: Xamarin.AndroidX.Core => 0xc86c06e3 => 72
	i32 3366347497, ; 240: Java.Interop => 0xc8a662e9 => 153
	i32 3374999561, ; 241: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 86
	i32 3381016424, ; 242: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3384551493, ; 243: LiveChartsCore.dll => 0xc9bc2845 => 39
	i32 3428513518, ; 244: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 46
	i32 3430777524, ; 245: netstandard => 0xcc7d82b4 => 151
	i32 3452344032, ; 246: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 52
	i32 3455791806, ; 247: Microcharts => 0xcdfb32be => 43
	i32 3458724246, ; 248: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 22
	i32 3466574376, ; 249: SkiaSharp.Views.Maui.Controls.Compatibility.dll => 0xce9fba28 => 64
	i32 3471940407, ; 250: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 107
	i32 3473156932, ; 251: SkiaSharp.Views.Maui.Controls.dll => 0xcf042b44 => 63
	i32 3476120550, ; 252: Mono.Android => 0xcf3163e6 => 155
	i32 3484440000, ; 253: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 254: System.Text.Json.dll => 0xcfbaacae => 141
	i32 3494395880, ; 255: Xamarin.GooglePlayServices.Location.dll => 0xd0483fe8 => 95
	i32 3509114376, ; 256: System.Xml.Linq => 0xd128d608 => 146
	i32 3580758918, ; 257: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3592228221, ; 258: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 33
	i32 3608519521, ; 259: System.Linq.dll => 0xd715a361 => 118
	i32 3641597786, ; 260: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 78
	i32 3643446276, ; 261: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 262: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 83
	i32 3657292374, ; 263: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 45
	i32 3668042751, ; 264: Microcharts.dll => 0xdaa1e3ff => 43
	i32 3672681054, ; 265: Mono.Android.dll => 0xdae8aa5e => 155
	i32 3724971120, ; 266: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 82
	i32 3737834244, ; 267: System.Net.Http.Json.dll => 0xdecad304 => 120
	i32 3748608112, ; 268: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 111
	i32 3751619990, ; 269: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 3
	i32 3786282454, ; 270: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 70
	i32 3792276235, ; 271: System.Collections.NonGeneric => 0xe2098b0b => 103
	i32 3792835768, ; 272: HarfBuzzSharp => 0xe21214b8 => 38
	i32 3800979733, ; 273: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 52
	i32 3802395368, ; 274: System.Collections.Specialized.dll => 0xe2a3f2e8 => 104
	i32 3817368567, ; 275: CommunityToolkit.Maui.dll => 0xe3886bf7 => 35
	i32 3823082795, ; 276: System.Security.Cryptography.dll => 0xe3df9d2b => 138
	i32 3841636137, ; 277: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 47
	i32 3844307129, ; 278: System.Net.Mail.dll => 0xe52378b9 => 122
	i32 3849253459, ; 279: System.Runtime.InteropServices.dll => 0xe56ef253 => 133
	i32 3896106733, ; 280: System.Collections.Concurrent.dll => 0xe839deed => 101
	i32 3896760992, ; 281: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 72
	i32 3920221145, ; 282: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 19
	i32 3921031405, ; 283: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 89
	i32 3928044579, ; 284: System.Xml.ReaderWriter => 0xea213423 => 147
	i32 3931092270, ; 285: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 85
	i32 3955647286, ; 286: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 67
	i32 3967165417, ; 287: Xamarin.GooglePlayServices.Location => 0xec7623e9 => 95
	i32 3970018735, ; 288: Xamarin.GooglePlayServices.Tasks.dll => 0xeca1adaf => 96
	i32 4003906742, ; 289: HarfBuzzSharp.dll => 0xeea6c4b6 => 38
	i32 4025784931, ; 290: System.Memory => 0xeff49a63 => 119
	i32 4046471985, ; 291: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 54
	i32 4054681211, ; 292: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 130
	i32 4066802364, ; 293: SkiaSharp.HarfBuzz => 0xf2667abc => 61
	i32 4068434129, ; 294: System.Private.Xml.Linq.dll => 0xf27f60d1 => 128
	i32 4073602200, ; 295: System.Threading.dll => 0xf2ce3c98 => 144
	i32 4091086043, ; 296: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 5
	i32 4094352644, ; 297: Microsoft.Maui.Essentials.dll => 0xf40add04 => 56
	i32 4099507663, ; 298: System.Drawing.dll => 0xf45985cf => 114
	i32 4100113165, ; 299: System.Private.Uri => 0xf462c30d => 127
	i32 4103439459, ; 300: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 29
	i32 4126470640, ; 301: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 46
	i32 4147896353, ; 302: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 130
	i32 4150914736, ; 303: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4181436372, ; 304: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 136
	i32 4182413190, ; 305: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 80
	i32 4213026141, ; 306: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 111
	i32 4249188766, ; 307: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 18
	i32 4271975918, ; 308: Microsoft.Maui.Controls.dll => 0xfea12dee => 53
	i32 4274623895, ; 309: CommunityToolkit.Mvvm.dll => 0xfec99597 => 37
	i32 4274976490, ; 310: System.Runtime.Numerics => 0xfecef6ea => 134
	i32 4292120959 ; 311: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 80
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [312 x i32] [
	i32 40, ; 0
	i32 0, ; 1
	i32 58, ; 2
	i32 9, ; 3
	i32 143, ; 4
	i32 33, ; 5
	i32 57, ; 6
	i32 17, ; 7
	i32 133, ; 8
	i32 32, ; 9
	i32 25, ; 10
	i32 70, ; 11
	i32 88, ; 12
	i32 108, ; 13
	i32 100, ; 14
	i32 131, ; 15
	i32 99, ; 16
	i32 30, ; 17
	i32 66, ; 18
	i32 8, ; 19
	i32 77, ; 20
	i32 143, ; 21
	i32 119, ; 22
	i32 34, ; 23
	i32 28, ; 24
	i32 105, ; 25
	i32 76, ; 26
	i32 145, ; 27
	i32 136, ; 28
	i32 150, ; 29
	i32 149, ; 30
	i32 6, ; 31
	i32 126, ; 32
	i32 59, ; 33
	i32 51, ; 34
	i32 60, ; 35
	i32 27, ; 36
	i32 48, ; 37
	i32 35, ; 38
	i32 74, ; 39
	i32 19, ; 40
	i32 140, ; 41
	i32 89, ; 42
	i32 101, ; 43
	i32 146, ; 44
	i32 124, ; 45
	i32 116, ; 46
	i32 25, ; 47
	i32 61, ; 48
	i32 50, ; 49
	i32 110, ; 50
	i32 127, ; 51
	i32 115, ; 52
	i32 10, ; 53
	i32 120, ; 54
	i32 24, ; 55
	i32 42, ; 56
	i32 106, ; 57
	i32 21, ; 58
	i32 58, ; 59
	i32 14, ; 60
	i32 77, ; 61
	i32 148, ; 62
	i32 23, ; 63
	i32 105, ; 64
	i32 87, ; 65
	i32 114, ; 66
	i32 47, ; 67
	i32 41, ; 68
	i32 67, ; 69
	i32 113, ; 70
	i32 4, ; 71
	i32 117, ; 72
	i32 79, ; 73
	i32 107, ; 74
	i32 97, ; 75
	i32 149, ; 76
	i32 26, ; 77
	i32 20, ; 78
	i32 16, ; 79
	i32 22, ; 80
	i32 84, ; 81
	i32 37, ; 82
	i32 2, ; 83
	i32 40, ; 84
	i32 75, ; 85
	i32 11, ; 86
	i32 118, ; 87
	i32 31, ; 88
	i32 32, ; 89
	i32 87, ; 90
	i32 71, ; 91
	i32 135, ; 92
	i32 0, ; 93
	i32 6, ; 94
	i32 102, ; 95
	i32 116, ; 96
	i32 68, ; 97
	i32 51, ; 98
	i32 102, ; 99
	i32 115, ; 100
	i32 59, ; 101
	i32 30, ; 102
	i32 142, ; 103
	i32 81, ; 104
	i32 63, ; 105
	i32 91, ; 106
	i32 36, ; 107
	i32 73, ; 108
	i32 121, ; 109
	i32 142, ; 110
	i32 137, ; 111
	i32 92, ; 112
	i32 123, ; 113
	i32 138, ; 114
	i32 69, ; 115
	i32 1, ; 116
	i32 112, ; 117
	i32 88, ; 118
	i32 48, ; 119
	i32 154, ; 120
	i32 17, ; 121
	i32 76, ; 122
	i32 9, ; 123
	i32 81, ; 124
	i32 97, ; 125
	i32 92, ; 126
	i32 85, ; 127
	i32 139, ; 128
	i32 135, ; 129
	i32 49, ; 130
	i32 26, ; 131
	i32 117, ; 132
	i32 132, ; 133
	i32 8, ; 134
	i32 2, ; 135
	i32 94, ; 136
	i32 103, ; 137
	i32 128, ; 138
	i32 13, ; 139
	i32 44, ; 140
	i32 5, ; 141
	i32 79, ; 142
	i32 129, ; 143
	i32 78, ; 144
	i32 4, ; 145
	i32 112, ; 146
	i32 137, ; 147
	i32 125, ; 148
	i32 109, ; 149
	i32 93, ; 150
	i32 104, ; 151
	i32 55, ; 152
	i32 12, ; 153
	i32 50, ; 154
	i32 49, ; 155
	i32 126, ; 156
	i32 98, ; 157
	i32 121, ; 158
	i32 14, ; 159
	i32 45, ; 160
	i32 86, ; 161
	i32 122, ; 162
	i32 18, ; 163
	i32 152, ; 164
	i32 123, ; 165
	i32 65, ; 166
	i32 12, ; 167
	i32 147, ; 168
	i32 44, ; 169
	i32 13, ; 170
	i32 145, ; 171
	i32 10, ; 172
	i32 109, ; 173
	i32 151, ; 174
	i32 153, ; 175
	i32 53, ; 176
	i32 16, ; 177
	i32 64, ; 178
	i32 131, ; 179
	i32 11, ; 180
	i32 41, ; 181
	i32 100, ; 182
	i32 140, ; 183
	i32 99, ; 184
	i32 15, ; 185
	i32 139, ; 186
	i32 20, ; 187
	i32 98, ; 188
	i32 129, ; 189
	i32 73, ; 190
	i32 65, ; 191
	i32 15, ; 192
	i32 148, ; 193
	i32 113, ; 194
	i32 110, ; 195
	i32 134, ; 196
	i32 66, ; 197
	i32 68, ; 198
	i32 1, ; 199
	i32 21, ; 200
	i32 54, ; 201
	i32 55, ; 202
	i32 90, ; 203
	i32 27, ; 204
	i32 62, ; 205
	i32 57, ; 206
	i32 71, ; 207
	i32 93, ; 208
	i32 90, ; 209
	i32 56, ; 210
	i32 36, ; 211
	i32 150, ; 212
	i32 152, ; 213
	i32 62, ; 214
	i32 91, ; 215
	i32 125, ; 216
	i32 108, ; 217
	i32 75, ; 218
	i32 42, ; 219
	i32 34, ; 220
	i32 7, ; 221
	i32 82, ; 222
	i32 96, ; 223
	i32 154, ; 224
	i32 106, ; 225
	i32 39, ; 226
	i32 132, ; 227
	i32 83, ; 228
	i32 144, ; 229
	i32 94, ; 230
	i32 69, ; 231
	i32 7, ; 232
	i32 124, ; 233
	i32 74, ; 234
	i32 60, ; 235
	i32 84, ; 236
	i32 24, ; 237
	i32 141, ; 238
	i32 72, ; 239
	i32 153, ; 240
	i32 86, ; 241
	i32 3, ; 242
	i32 39, ; 243
	i32 46, ; 244
	i32 151, ; 245
	i32 52, ; 246
	i32 43, ; 247
	i32 22, ; 248
	i32 64, ; 249
	i32 107, ; 250
	i32 63, ; 251
	i32 155, ; 252
	i32 23, ; 253
	i32 141, ; 254
	i32 95, ; 255
	i32 146, ; 256
	i32 31, ; 257
	i32 33, ; 258
	i32 118, ; 259
	i32 78, ; 260
	i32 28, ; 261
	i32 83, ; 262
	i32 45, ; 263
	i32 43, ; 264
	i32 155, ; 265
	i32 82, ; 266
	i32 120, ; 267
	i32 111, ; 268
	i32 3, ; 269
	i32 70, ; 270
	i32 103, ; 271
	i32 38, ; 272
	i32 52, ; 273
	i32 104, ; 274
	i32 35, ; 275
	i32 138, ; 276
	i32 47, ; 277
	i32 122, ; 278
	i32 133, ; 279
	i32 101, ; 280
	i32 72, ; 281
	i32 19, ; 282
	i32 89, ; 283
	i32 147, ; 284
	i32 85, ; 285
	i32 67, ; 286
	i32 95, ; 287
	i32 96, ; 288
	i32 38, ; 289
	i32 119, ; 290
	i32 54, ; 291
	i32 130, ; 292
	i32 61, ; 293
	i32 128, ; 294
	i32 144, ; 295
	i32 5, ; 296
	i32 56, ; 297
	i32 114, ; 298
	i32 127, ; 299
	i32 29, ; 300
	i32 46, ; 301
	i32 130, ; 302
	i32 29, ; 303
	i32 136, ; 304
	i32 80, ; 305
	i32 111, ; 306
	i32 18, ; 307
	i32 53, ; 308
	i32 37, ; 309
	i32 134, ; 310
	i32 80 ; 311
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
