; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [156 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [312 x i64] [
	i64 36418902923615093, ; 0: Plugin.LocalNotification => 0x8162cc9bdf1b75 => 59
	i64 98382396393917666, ; 1: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 51
	i64 120698629574877762, ; 2: Mono.Android => 0x1accec39cafe242 => 155
	i64 131669012237370309, ; 3: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 56
	i64 181099460066822533, ; 4: Microcharts.Droid.dll => 0x28364ffda4c4985 => 42
	i64 196720943101637631, ; 5: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 117
	i64 210515253464952879, ; 6: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 70
	i64 232391251801502327, ; 7: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 87
	i64 435170709725415398, ; 8: Xamarin.GooglePlayServices.Location => 0x60a097471d687e6 => 95
	i64 560278790331054453, ; 9: System.Reflection.Primitives => 0x7c6829760de3975 => 132
	i64 687654259221141486, ; 10: Xamarin.GooglePlayServices.Base => 0x98b09e7c92917ee => 93
	i64 750875890346172408, ; 11: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 143
	i64 799765834175365804, ; 12: System.ComponentModel.dll => 0xb1956c9f18442ac => 108
	i64 805302231655005164, ; 13: hu\Microsoft.Maui.Controls.resources.dll => 0xb2d021ceea03bec => 12
	i64 872800313462103108, ; 14: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 75
	i64 1010599046655515943, ; 15: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 132
	i64 1120440138749646132, ; 16: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 92
	i64 1268860745194512059, ; 17: System.Drawing.dll => 0x119be62002c19ebb => 114
	i64 1369545283391376210, ; 18: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 83
	i64 1416135423712704079, ; 19: Microcharts => 0x13a71faa343e364f => 43
	i64 1476839205573959279, ; 20: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 123
	i64 1486715745332614827, ; 21: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 53
	i64 1513467482682125403, ; 22: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 154
	i64 1537168428375924959, ; 23: System.Threading.Thread.dll => 0x15551e8a954ae0df => 143
	i64 1587344118459183377, ; 24: LiveChartsCore => 0x16076110cd10b111 => 39
	i64 1624659445732251991, ; 25: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 68
	i64 1628611045998245443, ; 26: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 80
	i64 1731380447121279447, ; 27: Newtonsoft.Json => 0x18071957e9b889d7 => 58
	i64 1735388228521408345, ; 28: System.Net.Mail.dll => 0x181556663c69b759 => 122
	i64 1743969030606105336, ; 29: System.Memory.dll => 0x1833d297e88f2af8 => 119
	i64 1767386781656293639, ; 30: System.Private.Uri.dll => 0x188704e9f5582107 => 127
	i64 1795316252682057001, ; 31: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 67
	i64 1835311033149317475, ; 32: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 33: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 87
	i64 1875417405349196092, ; 34: System.Drawing.Primitives => 0x1a06d2319b6c713c => 113
	i64 1881198190668717030, ; 35: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1920760634179481754, ; 36: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 54
	i64 1930726298510463061, ; 37: CommunityToolkit.Mvvm.dll => 0x1acb5156cd389055 => 37
	i64 1981742497975770890, ; 38: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 79
	i64 2102659300918482391, ; 39: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 113
	i64 2133195048986300728, ; 40: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 58
	i64 2188974421706709258, ; 41: SkiaSharp.HarfBuzz.dll => 0x1e60cca38c3e990a => 61
	i64 2262844636196693701, ; 42: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 75
	i64 2287834202362508563, ; 43: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 101
	i64 2329709569556905518, ; 44: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 78
	i64 2335503487726329082, ; 45: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 140
	i64 2470498323731680442, ; 46: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 71
	i64 2497223385847772520, ; 47: System.Runtime => 0x22a7eb7046413568 => 137
	i64 2547086958574651984, ; 48: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 66
	i64 2602673633151553063, ; 49: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2624866290265602282, ; 50: mscorlib.dll => 0x246d65fbde2db8ea => 150
	i64 2656907746661064104, ; 51: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 46
	i64 2662981627730767622, ; 52: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2895129759130297543, ; 53: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 3017704767998173186, ; 54: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 92
	i64 3122911337338800527, ; 55: Microcharts.dll => 0x2b56cf50bf1e898f => 43
	i64 3254037935674351285, ; 56: SkiaSharp.Views.Maui.Controls.Compatibility.dll => 0x2d28aa430983deb5 => 64
	i64 3289520064315143713, ; 57: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 77
	i64 3311221304742556517, ; 58: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 125
	i64 3325875462027654285, ; 59: System.Runtime.Numerics => 0x2e27e21c8958b48d => 134
	i64 3344514922410554693, ; 60: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 98
	i64 3411255996856937470, ; 61: Xamarin.GooglePlayServices.Basement => 0x2f5737416a942bfe => 94
	i64 3414639567687375782, ; 62: SkiaSharp.Views.Maui.Controls => 0x2f633c9863ffdba6 => 63
	i64 3429672777697402584, ; 63: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 56
	i64 3446944858302542142, ; 64: LiveChartsCore.dll => 0x2fd60215ff7b713e => 39
	i64 3461602852075779363, ; 65: SkiaSharp.HarfBuzz => 0x300a15741f74b523 => 61
	i64 3494946837667399002, ; 66: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 44
	i64 3522470458906976663, ; 67: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 88
	i64 3551103847008531295, ; 68: System.Private.CoreLib.dll => 0x31480e226177735f => 152
	i64 3567343442040498961, ; 69: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 70: System.Runtime.dll => 0x319037675df7e556 => 137
	i64 3638003163729360188, ; 71: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 45
	i64 3647754201059316852, ; 72: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 147
	i64 3655542548057982301, ; 73: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 44
	i64 3716579019761409177, ; 74: netstandard.dll => 0x3393f0ed5c8c5c99 => 151
	i64 3727469159507183293, ; 75: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 86
	i64 3869221888984012293, ; 76: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 48
	i64 3890352374528606784, ; 77: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 54
	i64 3933965368022646939, ; 78: System.Net.Requests => 0x369840a8bfadc09b => 124
	i64 3966267475168208030, ; 79: System.Memory => 0x370b03412596249e => 119
	i64 4009997192427317104, ; 80: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 136
	i64 4070326265757318011, ; 81: da\Microsoft.Maui.Controls.resources.dll => 0x387cb42c56683b7b => 3
	i64 4073500526318903918, ; 82: System.Private.Xml.dll => 0x3887fb25779ae26e => 129
	i64 4073631083018132676, ; 83: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 52
	i64 4120493066591692148, ; 84: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4154383907710350974, ; 85: System.ComponentModel => 0x39a7562737acb67e => 108
	i64 4187479170553454871, ; 86: System.Linq.Expressions => 0x3a1cea1e912fa117 => 117
	i64 4205801962323029395, ; 87: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 107
	i64 4247996603072512073, ; 88: Xamarin.GooglePlayServices.Tasks => 0x3af3ea6755340049 => 96
	i64 4360412976914417659, ; 89: tr\Microsoft.Maui.Controls.resources.dll => 0x3c834c8002fcc7fb => 28
	i64 4477672992252076438, ; 90: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 145
	i64 4636684751163556186, ; 91: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 89
	i64 4794310189461587505, ; 92: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 66
	i64 4795410492532947900, ; 93: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 88
	i64 4809057822547766521, ; 94: System.Drawing => 0x42bd349c3145ecf9 => 114
	i64 4871824391508510238, ; 95: nb\Microsoft.Maui.Controls.resources.dll => 0x439c3278d7f2c61e => 18
	i64 4895324861018215178, ; 96: Console.dll => 0x43efb0064921130a => 99
	i64 4953714692329509532, ; 97: sv\Microsoft.Maui.Controls.resources.dll => 0x44bf21444aef129c => 26
	i64 5103417709280584325, ; 98: System.Collections.Specialized => 0x46d2fb5e161b6285 => 104
	i64 5182934613077526976, ; 99: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 104
	i64 5471532531798518949, ; 100: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5522859530602327440, ; 101: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5528247634813456972, ; 102: Plugin.LocalNotification.dll => 0x4cb847ef1773124c => 59
	i64 5570799893513421663, ; 103: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 115
	i64 5573260873512690141, ; 104: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 138
	i64 5692067934154308417, ; 105: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 91
	i64 6200764641006662125, ; 106: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6222399776351216807, ; 107: System.Text.Json.dll => 0x565a67a0ffe264a7 => 141
	i64 6284145129771520194, ; 108: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 130
	i64 6300676701234028427, ; 109: es\Microsoft.Maui.Controls.resources.dll => 0x57708013cda25f8b => 6
	i64 6357457916754632952, ; 110: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 111: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 78
	i64 6471714727257221498, ; 112: fi\Microsoft.Maui.Controls.resources.dll => 0x59d026417dd4a97a => 7
	i64 6478287442656530074, ; 113: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6548213210057960872, ; 114: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 74
	i64 6560151584539558821, ; 115: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 50
	i64 6671798237668743565, ; 116: SkiaSharp => 0x5c96fd260152998d => 60
	i64 6743165466166707109, ; 117: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6786606130239981554, ; 118: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 112
	i64 6814185388980153342, ; 119: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 148
	i64 6876862101832370452, ; 120: System.Xml.Linq => 0x5f6f85a57d108914 => 146
	i64 6894844156784520562, ; 121: System.Numerics.Vectors => 0x5faf683aead1ad72 => 125
	i64 7083547580668757502, ; 122: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 128
	i64 7234284632499269838, ; 123: LiveChartsCore.SkiaSharpView => 0x6465578b5c2fb0ce => 40
	i64 7270811800166795866, ; 124: System.Linq => 0x64e71ccf51a90a5a => 118
	i64 7314237870106916923, ; 125: SkiaSharp.Views.Maui.Core.dll => 0x65816497226eb83b => 65
	i64 7377312882064240630, ; 126: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 107
	i64 7488575175965059935, ; 127: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 146
	i64 7489048572193775167, ; 128: System.ObjectModel => 0x67ee71ff6b419e3f => 126
	i64 7654504624184590948, ; 129: System.Net.Http => 0x6a3a4366801b8264 => 121
	i64 7694700312542370399, ; 130: System.Net.Mail => 0x6ac9112a7e2cda5f => 122
	i64 7714652370974252055, ; 131: System.Private.CoreLib => 0x6b0ff375198b9c17 => 152
	i64 7723873813026311384, ; 132: SkiaSharp.Views.Maui.Controls.dll => 0x6b30b64f63600cd8 => 63
	i64 7735176074855944702, ; 133: Microsoft.CSharp => 0x6b58dda848e391fe => 100
	i64 7735352534559001595, ; 134: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 97
	i64 7742555799473854801, ; 135: it\Microsoft.Maui.Controls.resources.dll => 0x6b73157a51479951 => 14
	i64 7836164640616011524, ; 136: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 68
	i64 7927939710195668715, ; 137: SkiaSharp.Views.Android.dll => 0x6e05b32992ed16eb => 62
	i64 7975724199463739455, ; 138: sk\Microsoft.Maui.Controls.resources.dll => 0x6eaf76e6f785e03f => 25
	i64 8064050204834738623, ; 139: System.Collections.dll => 0x6fe942efa61731bf => 105
	i64 8083354569033831015, ; 140: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 77
	i64 8085230611270010360, ; 141: System.Net.Http.Json.dll => 0x703482674fdd05f8 => 120
	i64 8087206902342787202, ; 142: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 111
	i64 8108129031893776750, ; 143: ko\Microsoft.Maui.Controls.resources.dll => 0x7085dc65530f796e => 16
	i64 8167236081217502503, ; 144: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 153
	i64 8185542183669246576, ; 145: System.Collections => 0x7198e33f4794aa70 => 105
	i64 8246048515196606205, ; 146: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 57
	i64 8368701292315763008, ; 147: System.Security.Cryptography => 0x7423997c6fd56140 => 138
	i64 8386351099740279196, ; 148: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x74624de475b9d19c => 31
	i64 8400357532724379117, ; 149: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 85
	i64 8410671156615598628, ; 150: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 131
	i64 8518412311883997971, ; 151: System.Collections.Immutable => 0x76377add7c28e313 => 102
	i64 8563666267364444763, ; 152: System.Private.Uri => 0x76d841191140ca5b => 127
	i64 8599632406834268464, ; 153: CommunityToolkit.Maui => 0x7758081c784b4930 => 35
	i64 8626175481042262068, ; 154: Java.Interop => 0x77b654e585b55834 => 153
	i64 8638972117149407195, ; 155: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 100
	i64 8639588376636138208, ; 156: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 84
	i64 8677882282824630478, ; 157: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8725526185868997716, ; 158: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 111
	i64 8941376889969657626, ; 159: System.Xml.XDocument => 0x7c1626e87187471a => 148
	i64 9045785047181495996, ; 160: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9312692141327339315, ; 161: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 91
	i64 9324707631942237306, ; 162: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 67
	i64 9363564275759486853, ; 163: el\Microsoft.Maui.Controls.resources.dll => 0x81f21019382e9785 => 5
	i64 9551379474083066910, ; 164: uk\Microsoft.Maui.Controls.resources.dll => 0x848d5106bbadb41e => 29
	i64 9659729154652888475, ; 165: System.Text.RegularExpressions => 0x860e407c9991dd9b => 142
	i64 9678050649315576968, ; 166: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 71
	i64 9702891218465930390, ; 167: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 103
	i64 9773637193738963987, ; 168: ca\Microsoft.Maui.Controls.resources.dll => 0x87a2ef3ea85b4c13 => 1
	i64 9808709177481450983, ; 169: Mono.Android.dll => 0x881f890734e555e7 => 155
	i64 9875200773399460291, ; 170: Xamarin.GooglePlayServices.Base.dll => 0x890bc2c8482339c3 => 93
	i64 9956195530459977388, ; 171: Microsoft.Maui => 0x8a2b8315b36616ac => 55
	i64 10038780035334861115, ; 172: System.Net.Http.dll => 0x8b50e941206af13b => 121
	i64 10051358222726253779, ; 173: System.Private.Xml => 0x8b7d990c97ccccd3 => 129
	i64 10092835686693276772, ; 174: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 53
	i64 10143853363526200146, ; 175: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10209869394718195525, ; 176: nl\Microsoft.Maui.Controls.resources.dll => 0x8db0be1ecb4f7f45 => 19
	i64 10229024438826829339, ; 177: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 74
	i64 10245369515835430794, ; 178: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 131
	i64 10364469296367737616, ; 179: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 130
	i64 10406448008575299332, ; 180: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 98
	i64 10430153318873392755, ; 181: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 72
	i64 10506226065143327199, ; 182: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10761706286639228993, ; 183: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0x955942d988382841 => 33
	i64 10773380159644291260, ; 184: LiveChartsCore.SkiaSharpView.Maui.dll => 0x9582bc2ce5d6d0bc => 41
	i64 10785150219063592792, ; 185: System.Net.Primitives => 0x95ac8cfb68830758 => 123
	i64 10880838204485145808, ; 186: CommunityToolkit.Maui.dll => 0x970080b2a4d614d0 => 35
	i64 11002576679268595294, ; 187: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 49
	i64 11009005086950030778, ; 188: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 55
	i64 11103970607964515343, ; 189: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11156122287428000958, ; 190: th\Microsoft.Maui.Controls.resources.dll => 0x9ad2821cdcf6dcbe => 27
	i64 11157797727133427779, ; 191: fr\Microsoft.Maui.Controls.resources.dll => 0x9ad875ea9172e843 => 8
	i64 11162124722117608902, ; 192: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 90
	i64 11220793807500858938, ; 193: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 194: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 50
	i64 11340910727871153756, ; 195: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 73
	i64 11485890710487134646, ; 196: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 133
	i64 11518296021396496455, ; 197: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 198: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 90
	i64 11530571088791430846, ; 199: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 48
	i64 11575476872818742106, ; 200: LiveChartsCore.SkiaSharpView.dll => 0xa0a45ae2e61c535a => 40
	i64 11597940890313164233, ; 201: netstandard => 0xa0f429ca8d1805c9 => 151
	i64 11819001862053230205, ; 202: LiveChartsCore.SkiaSharpView.Maui => 0xa4058792e35cf67d => 41
	i64 11855031688536399763, ; 203: vi\Microsoft.Maui.Controls.resources.dll => 0xa485888294361f93 => 30
	i64 12145679461940342714, ; 204: System.Text.Json => 0xa88e1f1ebcb62fba => 141
	i64 12201331334810686224, ; 205: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 136
	i64 12269460666702402136, ; 206: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 102
	i64 12341818387765915815, ; 207: CommunityToolkit.Maui.Core.dll => 0xab46f26f152bf0a7 => 36
	i64 12451044538927396471, ; 208: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 76
	i64 12466513435562512481, ; 209: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 81
	i64 12475113361194491050, ; 210: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12517810545449516888, ; 211: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 112
	i64 12538491095302438457, ; 212: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 69
	i64 12550732019250633519, ; 213: System.IO.Compression => 0xae2d28465e8e1b2f => 116
	i64 12700543734426720211, ; 214: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 70
	i64 12708922737231849740, ; 215: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 139
	i64 12843321153144804894, ; 216: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 51
	i64 12989346753972519995, ; 217: ar\Microsoft.Maui.Controls.resources.dll => 0xb4436e0d5ee7c43b => 0
	i64 13005833372463390146, ; 218: pt-BR\Microsoft.Maui.Controls.resources.dll => 0xb47e008b5d99ddc2 => 21
	i64 13068258254871114833, ; 219: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 135
	i64 13106026140046202731, ; 220: HarfBuzzSharp.dll => 0xb5e1f555ee70176b => 38
	i64 13343850469010654401, ; 221: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 154
	i64 13381594904270902445, ; 222: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13403416310143541304, ; 223: Microcharts.Droid => 0xba02801ea6c86038 => 42
	i64 13465488254036897740, ; 224: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 97
	i64 13540124433173649601, ; 225: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13572454107664307259, ; 226: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 86
	i64 13717397318615465333, ; 227: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 106
	i64 13881769479078963060, ; 228: System.Console.dll => 0xc0a5f3cade5c6774 => 109
	i64 13959074834287824816, ; 229: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 76
	i64 14124974489674258913, ; 230: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 69
	i64 14125464355221830302, ; 231: System.Threading.dll => 0xc407bafdbc707a9e => 144
	i64 14254574811015963973, ; 232: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 139
	i64 14349907877893689639, ; 233: ro\Microsoft.Maui.Controls.resources.dll => 0xc7251d2f956ed127 => 23
	i64 14461014870687870182, ; 234: System.Net.Requests.dll => 0xc8afd8683afdece6 => 124
	i64 14464374589798375073, ; 235: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14491877563792607819, ; 236: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0xc91d7ddcee4fca4b => 32
	i64 14551742072151931844, ; 237: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 140
	i64 14552901170081803662, ; 238: SkiaSharp.Views.Maui.Core => 0xc9f64a827617ad8e => 65
	i64 14556034074661724008, ; 239: CommunityToolkit.Maui.Core => 0xca016bdea6b19f68 => 36
	i64 14610046442689856844, ; 240: cs\Microsoft.Maui.Controls.resources.dll => 0xcac14fd5107d054c => 2
	i64 14622043554576106986, ; 241: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 135
	i64 14669215534098758659, ; 242: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 46
	i64 14678510994762383812, ; 243: Xamarin.GooglePlayServices.Location.dll => 0xcbb48bfaca7a41c4 => 95
	i64 14690985099581930927, ; 244: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 145
	i64 14705122255218365489, ; 245: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14735017007120366644, ; 246: ja\Microsoft.Maui.Controls.resources.dll => 0xcc7d4be604bfbc34 => 15
	i64 14744092281598614090, ; 247: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14852515768018889994, ; 248: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 73
	i64 14904040806490515477, ; 249: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14931407803744742450, ; 250: HarfBuzzSharp => 0xcf3704499ab36c32 => 38
	i64 14954917835170835695, ; 251: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 47
	i64 14987728460634540364, ; 252: System.IO.Compression.dll => 0xcfff1ba06622494c => 116
	i64 15024878362326791334, ; 253: System.Net.Http.Json => 0xd0831743ebf0f4a6 => 120
	i64 15076659072870671916, ; 254: System.ObjectModel.dll => 0xd13b0d8c1620662c => 126
	i64 15111608613780139878, ; 255: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 256: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 115
	i64 15133485256822086103, ; 257: System.Linq.dll => 0xd204f0a9127dd9d7 => 118
	i64 15203009853192377507, ; 258: pt\Microsoft.Maui.Controls.resources.dll => 0xd2fbf0e9984b94a3 => 22
	i64 15227001540531775957, ; 259: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 45
	i64 15370334346939861994, ; 260: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 72
	i64 15391712275433856905, ; 261: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 47
	i64 15527772828719725935, ; 262: System.Console => 0xd77dbb1e38cd3d6f => 109
	i64 15536481058354060254, ; 263: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15582737692548360875, ; 264: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 80
	i64 15609085926864131306, ; 265: System.dll => 0xd89e9cf3334914ea => 149
	i64 15661133872274321916, ; 266: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 147
	i64 15783653065526199428, ; 267: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 15887023238797786800, ; 268: Console => 0xdc7a0b766eeafeb0 => 99
	i64 15928521404965645318, ; 269: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 52
	i64 15930129725311349754, ; 270: Xamarin.GooglePlayServices.Tasks.dll => 0xdd1330956f12f3fa => 96
	i64 16056281320585338352, ; 271: ru\Microsoft.Maui.Controls.resources.dll => 0xded35eca8f3a9df0 => 24
	i64 16154507427712707110, ; 272: System => 0xe03056ea4e39aa26 => 149
	i64 16288847719894691167, ; 273: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 274: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 49
	i64 16324796876805858114, ; 275: SkiaSharp.dll => 0xe28d5444586b6342 => 60
	i64 16648892297579399389, ; 276: CommunityToolkit.Mvvm => 0xe70cbf55c4f508dd => 37
	i64 16649148416072044166, ; 277: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 57
	i64 16677317093839702854, ; 278: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 85
	i64 16803648858859583026, ; 279: ms\Microsoft.Maui.Controls.resources.dll => 0xe9328d9b8ab93632 => 17
	i64 16833383113903931215, ; 280: mscorlib => 0xe99c30c1484d7f4f => 150
	i64 16856067890322379635, ; 281: System.Data.Common.dll => 0xe9ecc87060889373 => 110
	i64 16890310621557459193, ; 282: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 142
	i64 16942731696432749159, ; 283: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16998075588627545693, ; 284: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 83
	i64 17008137082415910100, ; 285: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 103
	i64 17031351772568316411, ; 286: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 82
	i64 17062143951396181894, ; 287: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 106
	i64 17203614576212522419, ; 288: pl\Microsoft.Maui.Controls.resources.dll => 0xeebf844ef3e135b3 => 20
	i64 17230721278011714856, ; 289: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 128
	i64 17260702271250283638, ; 290: System.Data.Common => 0xef8a5543bba6bc76 => 110
	i64 17310278548634113468, ; 291: hi\Microsoft.Maui.Controls.resources.dll => 0xf03a76a04e6695bc => 10
	i64 17342750010158924305, ; 292: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17514990004910432069, ; 293: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17623389608345532001, ; 294: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17671790519499593115, ; 295: SkiaSharp.Views.Android => 0xf53ecfd92be3959b => 62
	i64 17704177640604968747, ; 296: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 81
	i64 17710060891934109755, ; 297: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 79
	i64 17712670374920797664, ; 298: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 133
	i64 17777860260071588075, ; 299: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 134
	i64 17827813215687577648, ; 300: hr\Microsoft.Maui.Controls.resources.dll => 0xf7691da9f3129030 => 11
	i64 17942426894774770628, ; 301: de\Microsoft.Maui.Controls.resources.dll => 0xf9004e329f771bc4 => 4
	i64 17986907704309214542, ; 302: Xamarin.GooglePlayServices.Basement.dll => 0xf99e554223166d4e => 94
	i64 18025913125965088385, ; 303: System.Threading => 0xfa28e87b91334681 => 144
	i64 18121036031235206392, ; 304: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 82
	i64 18132221390331549284, ; 305: SkiaSharp.Views.Maui.Controls.Compatibility => 0xfba297492f739664 => 64
	i64 18245806341561545090, ; 306: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 101
	i64 18305135509493619199, ; 307: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 84
	i64 18324163916253801303, ; 308: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
	i64 18342408478508122430, ; 309: id\Microsoft.Maui.Controls.resources.dll => 0xfe8d53543697013e => 13
	i64 18358161419737137786, ; 310: he\Microsoft.Maui.Controls.resources.dll => 0xfec54a8ba8b6827a => 9
	i64 18380184030268848184 ; 311: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 89
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [312 x i32] [
	i32 59, ; 0
	i32 51, ; 1
	i32 155, ; 2
	i32 56, ; 3
	i32 42, ; 4
	i32 117, ; 5
	i32 70, ; 6
	i32 87, ; 7
	i32 95, ; 8
	i32 132, ; 9
	i32 93, ; 10
	i32 143, ; 11
	i32 108, ; 12
	i32 12, ; 13
	i32 75, ; 14
	i32 132, ; 15
	i32 92, ; 16
	i32 114, ; 17
	i32 83, ; 18
	i32 43, ; 19
	i32 123, ; 20
	i32 53, ; 21
	i32 154, ; 22
	i32 143, ; 23
	i32 39, ; 24
	i32 68, ; 25
	i32 80, ; 26
	i32 58, ; 27
	i32 122, ; 28
	i32 119, ; 29
	i32 127, ; 30
	i32 67, ; 31
	i32 6, ; 32
	i32 87, ; 33
	i32 113, ; 34
	i32 28, ; 35
	i32 54, ; 36
	i32 37, ; 37
	i32 79, ; 38
	i32 113, ; 39
	i32 58, ; 40
	i32 61, ; 41
	i32 75, ; 42
	i32 101, ; 43
	i32 78, ; 44
	i32 140, ; 45
	i32 71, ; 46
	i32 137, ; 47
	i32 66, ; 48
	i32 27, ; 49
	i32 150, ; 50
	i32 46, ; 51
	i32 2, ; 52
	i32 7, ; 53
	i32 92, ; 54
	i32 43, ; 55
	i32 64, ; 56
	i32 77, ; 57
	i32 125, ; 58
	i32 134, ; 59
	i32 98, ; 60
	i32 94, ; 61
	i32 63, ; 62
	i32 56, ; 63
	i32 39, ; 64
	i32 61, ; 65
	i32 44, ; 66
	i32 88, ; 67
	i32 152, ; 68
	i32 22, ; 69
	i32 137, ; 70
	i32 45, ; 71
	i32 147, ; 72
	i32 44, ; 73
	i32 151, ; 74
	i32 86, ; 75
	i32 48, ; 76
	i32 54, ; 77
	i32 124, ; 78
	i32 119, ; 79
	i32 136, ; 80
	i32 3, ; 81
	i32 129, ; 82
	i32 52, ; 83
	i32 33, ; 84
	i32 108, ; 85
	i32 117, ; 86
	i32 107, ; 87
	i32 96, ; 88
	i32 28, ; 89
	i32 145, ; 90
	i32 89, ; 91
	i32 66, ; 92
	i32 88, ; 93
	i32 114, ; 94
	i32 18, ; 95
	i32 99, ; 96
	i32 26, ; 97
	i32 104, ; 98
	i32 104, ; 99
	i32 26, ; 100
	i32 29, ; 101
	i32 59, ; 102
	i32 115, ; 103
	i32 138, ; 104
	i32 91, ; 105
	i32 23, ; 106
	i32 141, ; 107
	i32 130, ; 108
	i32 6, ; 109
	i32 34, ; 110
	i32 78, ; 111
	i32 7, ; 112
	i32 11, ; 113
	i32 74, ; 114
	i32 50, ; 115
	i32 60, ; 116
	i32 19, ; 117
	i32 112, ; 118
	i32 148, ; 119
	i32 146, ; 120
	i32 125, ; 121
	i32 128, ; 122
	i32 40, ; 123
	i32 118, ; 124
	i32 65, ; 125
	i32 107, ; 126
	i32 146, ; 127
	i32 126, ; 128
	i32 121, ; 129
	i32 122, ; 130
	i32 152, ; 131
	i32 63, ; 132
	i32 100, ; 133
	i32 97, ; 134
	i32 14, ; 135
	i32 68, ; 136
	i32 62, ; 137
	i32 25, ; 138
	i32 105, ; 139
	i32 77, ; 140
	i32 120, ; 141
	i32 111, ; 142
	i32 16, ; 143
	i32 153, ; 144
	i32 105, ; 145
	i32 57, ; 146
	i32 138, ; 147
	i32 31, ; 148
	i32 85, ; 149
	i32 131, ; 150
	i32 102, ; 151
	i32 127, ; 152
	i32 35, ; 153
	i32 153, ; 154
	i32 100, ; 155
	i32 84, ; 156
	i32 21, ; 157
	i32 111, ; 158
	i32 148, ; 159
	i32 31, ; 160
	i32 91, ; 161
	i32 67, ; 162
	i32 5, ; 163
	i32 29, ; 164
	i32 142, ; 165
	i32 71, ; 166
	i32 103, ; 167
	i32 1, ; 168
	i32 155, ; 169
	i32 93, ; 170
	i32 55, ; 171
	i32 121, ; 172
	i32 129, ; 173
	i32 53, ; 174
	i32 3, ; 175
	i32 19, ; 176
	i32 74, ; 177
	i32 131, ; 178
	i32 130, ; 179
	i32 98, ; 180
	i32 72, ; 181
	i32 1, ; 182
	i32 33, ; 183
	i32 41, ; 184
	i32 123, ; 185
	i32 35, ; 186
	i32 49, ; 187
	i32 55, ; 188
	i32 12, ; 189
	i32 27, ; 190
	i32 8, ; 191
	i32 90, ; 192
	i32 15, ; 193
	i32 50, ; 194
	i32 73, ; 195
	i32 133, ; 196
	i32 13, ; 197
	i32 90, ; 198
	i32 48, ; 199
	i32 40, ; 200
	i32 151, ; 201
	i32 41, ; 202
	i32 30, ; 203
	i32 141, ; 204
	i32 136, ; 205
	i32 102, ; 206
	i32 36, ; 207
	i32 76, ; 208
	i32 81, ; 209
	i32 34, ; 210
	i32 112, ; 211
	i32 69, ; 212
	i32 116, ; 213
	i32 70, ; 214
	i32 139, ; 215
	i32 51, ; 216
	i32 0, ; 217
	i32 21, ; 218
	i32 135, ; 219
	i32 38, ; 220
	i32 154, ; 221
	i32 9, ; 222
	i32 42, ; 223
	i32 97, ; 224
	i32 30, ; 225
	i32 86, ; 226
	i32 106, ; 227
	i32 109, ; 228
	i32 76, ; 229
	i32 69, ; 230
	i32 144, ; 231
	i32 139, ; 232
	i32 23, ; 233
	i32 124, ; 234
	i32 24, ; 235
	i32 32, ; 236
	i32 140, ; 237
	i32 65, ; 238
	i32 36, ; 239
	i32 2, ; 240
	i32 135, ; 241
	i32 46, ; 242
	i32 95, ; 243
	i32 145, ; 244
	i32 16, ; 245
	i32 15, ; 246
	i32 32, ; 247
	i32 73, ; 248
	i32 0, ; 249
	i32 38, ; 250
	i32 47, ; 251
	i32 116, ; 252
	i32 120, ; 253
	i32 126, ; 254
	i32 17, ; 255
	i32 115, ; 256
	i32 118, ; 257
	i32 22, ; 258
	i32 45, ; 259
	i32 72, ; 260
	i32 47, ; 261
	i32 109, ; 262
	i32 4, ; 263
	i32 80, ; 264
	i32 149, ; 265
	i32 147, ; 266
	i32 5, ; 267
	i32 99, ; 268
	i32 52, ; 269
	i32 96, ; 270
	i32 24, ; 271
	i32 149, ; 272
	i32 18, ; 273
	i32 49, ; 274
	i32 60, ; 275
	i32 37, ; 276
	i32 57, ; 277
	i32 85, ; 278
	i32 17, ; 279
	i32 150, ; 280
	i32 110, ; 281
	i32 142, ; 282
	i32 25, ; 283
	i32 83, ; 284
	i32 103, ; 285
	i32 82, ; 286
	i32 106, ; 287
	i32 20, ; 288
	i32 128, ; 289
	i32 110, ; 290
	i32 10, ; 291
	i32 10, ; 292
	i32 8, ; 293
	i32 20, ; 294
	i32 62, ; 295
	i32 81, ; 296
	i32 79, ; 297
	i32 133, ; 298
	i32 134, ; 299
	i32 11, ; 300
	i32 4, ; 301
	i32 94, ; 302
	i32 144, ; 303
	i32 82, ; 304
	i32 64, ; 305
	i32 101, ; 306
	i32 84, ; 307
	i32 14, ; 308
	i32 13, ; 309
	i32 9, ; 310
	i32 89 ; 311
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
