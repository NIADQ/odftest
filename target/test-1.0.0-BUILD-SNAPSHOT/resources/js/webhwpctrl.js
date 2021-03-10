var HwpCtrl = function(hwpCtrlApp, imageLoader) {
	if (this._HwpCtrl != null && typeof this._HwpCtrl == "function") {
		this._HwpCtrl(hwpCtrlApp, imageLoader);
    } else {
		throw "ERROR : HwpCtrl : new를 사용하요 생성해 주세요.";
    }
    hwpCtrlApp.hwpCtrlIntf = this;
}

HwpCtrl.prototype._HwpCtrl = function (hwpCtrlApp, imageLoader) {
    this.Impl = hwpCtrlApp.hwpCtrlImpl;
};

HwpCtrl.prototype.__HwpCtrl = function () {
};

//Properties
Object.defineProperties(HwpCtrl.prototype, {
        AutoShowHideToolBar:{
            get: function(){
                return this.Impl.AutoShowHideToolBar;
            },
            set: function(bNewValue){
                this.Impl.AutoShowHideToolBar = bNewValue;
            },
            configurable:false
        },
        CellShape:{
            get: function(){
                return this.Impl.CellShape;
            },
            set: function(newValue){
                this.Impl.CellShape = newValue;
            },
            configurable:false
        },
        CharShape:{
            get: function(){
                return this.Impl.CharShape;
            },
            set: function(newValue){
                this.Impl.CharShape = newValue;
            },
            configurable:false
        },
        CurFieldState:{
            get: function(){
                return this.Impl.CurFieldState;
            },
            //SetNotSupported
            configurable:false
        },
        EditMode:{
            get: function(){
                return this.Impl.EditMode;
            },
            set: function(nNewValue){
                this.Impl.EditMode = nNewValue;
            },
            configurable:false
        },
        EngineProperties:{
            get: function(){
                return this.Impl.EngineProperties;
            },
            set: function(newValue){
                this.Impl.EngineProperties = newValue;
            },
            configurable:false
        },
        HeadCtrl:{
            get: function(){
                return this.Impl.HeadCtrl;
            },
            //SetNotSupported
            configurable:false
        },
        IsEmpty:{
            get: function(){
                return this.Impl.IsEmpty;
            },
            //SetNotSupported
            configurable:false
        },
        IsModified:{
            get: function(){
                return this.Impl.IsModified;
            },
            set: function(modified){
                this.Impl.IsModified = modified;
            },
            configurable:false
        },
        IsPreviewMode:{
            get: function(){
                return this.Impl.IsPreviewMode;
            },
            //SetNotSupported
            configurable:false
        },
        LastCtrl:{
            get: function(){
                return this.Impl.LastCtrl;
            },
            //SetNotSupported
            configurable:false
        },
        PageCount:{
            get: function(){
                return this.Impl.PageCount;
            },
            //SetNotSupported
            configurable:false
        },
        ParaShape:{
            get: function(){
                return this.Impl.ParaShape;
            },
            set: function(newValue){
                this.Impl.ParaShape = newValue;
            },
            configurable:false
        },
        ParentCtrl:{
            get: function(){
                return this.Impl.ParentCtrl;
            },
            //SetNotSupported
            configurable:false
        },
        Path:{
            get: function(){
                return this.Impl.Path;
            },
            set: function(lpszNewValue){
                this.Impl.Path = lpszNewValue;
            },
            configurable:false
        },
        SelectionMode:{
            get: function(){
                return this.Impl.SelectionMode;
            },
            //SetNotSupported
            configurable:false
        },
        Version:{
            //TODO: 기존에는 Registry에서 얻어왔음. 보류
            get: function(){
                return this.Impl.Version;
            },
            //SetNotSupported
            configurable:false
        },
        ViewProperties:{
            get: function(){
                return this.Impl.ViewProperties;
            },
            set: function(newValue){
                this.Impl.ViewProperties = newValue;
            },
            configurable:false
        },
        ScrollPosInfo:{
            get: function(){
                return this.Impl.ScrollPosInfo;
            },
            set: function(newValue){
                this.Impl.ScrollPosInfo = newValue;
            },
            configurable:false
        },
        HyperlinkMode:{
            get: function(){
                return this.Impl.HyperlinkMode;
            },
            set: function(state){
                return this.Impl.HyperlinkMode = state;
            },
            configurable:false
        },
        ReadOnlyMode:{
            get: function(){
                return this.Impl.ReadOnlyMode;
            },
            set: function(bNewValue){
                this.Impl.ReadOnlyMode = bNewValue;
            },
            configurable:false
        },
        XHwpDocuments:{
            //TODO: Automation관련 Property는 현재 지원할 수 없음. 향후 다른 방향으로 지원할 수 있을지 검토.
            get: function(){
                alert("HwpDocuments Property는 지원할 수 없습니다.");
            },
            //SetNotSupported
            configurable:false
        },
        CurSelectedCtrl:{
            get: function(){
                return this.Impl.CurSelectedCtrl;
            },
            //SetNotSupported
            configurable:false
        },
        IsPrivateInfoProtected:{
            // 개인정보관련 Property , 개인정보관련 기능을 지원하지 않으므로 항상 false;
            get: function(){
                return false;
            },
            //SetNotSupported
            configurable:false
        }
    }
)

//Method
HwpCtrl.prototype.AddEventListener = function(eventType, listener) {
    this.Impl.AddEventListener(eventType, listener);
};

HwpCtrl.prototype.AboutBox = function() {
    this.Impl.AboutBox();
};

HwpCtrl.prototype.Clear=function (option) {
    this.Impl.Clear(option);
};

HwpCtrl.prototype.CreateAction= function(aidStr) {
    return this.Impl.CreateAction(aidStr);
};

HwpCtrl.prototype.CreateSet = function(setStr) {
    return this.Impl.CreateSet(setStr);
};

HwpCtrl.prototype.CreateField = function (direction, memo, name) {
    return this.Impl.CreateField(direction, memo, name);
};

HwpCtrl.prototype.ConvertPUAHangulToUnicode = function (reverse) {
    return this.Impl.ConvertPUAHangulToUnicode(reverse);
};

HwpCtrl.prototype.DeleteCtrl = function (ctrl) {
    return this.Impl.DeleteCtrl(ctrl);
};

HwpCtrl.prototype.GetMessageBoxMode = function () {
    return this.Impl.GetMessageBoxMode();
};

HwpCtrl.prototype.SetMessageBoxMode = function (mode) {
    return this.Impl.SetMessageBoxMode(mode);
};

HwpCtrl.prototype.ExportStyle = function (styleset) {
    return this.Impl.ExportStyle(styleset);
};

HwpCtrl.prototype.ImportStyle = function (styleset) {
    return this.Impl.ImportStyle(styleset);
};

HwpCtrl.prototype.IsSpellCheckCompleted = function () {
    return this.Impl.IsSpellCheckCompleted();
};

HwpCtrl.prototype.FieldExist = function (field) {
    return this.Impl.FieldExist(field);
};

HwpCtrl.prototype.GetMemoString = function (ctrl) {
    return this.Impl.GetMemoString(ctrl);
};

HwpCtrl.prototype.GetHeadingString = function () {
    return this.Impl.GetHeadingString();
};

HwpCtrl.prototype.GetContextMenu = function (contextID) {
    return this.Impl.GetContextMenu(contextID);
};

HwpCtrl.prototype.GetCtrlHorizontalOffset = function (ctrl, relTo) {
    return this.Impl.GetCtrlHorizontalOffset(ctrl, relTo);
};

HwpCtrl.prototype.GetCtrlVerticalOffset = function (ctrl, relTo) {
    return this.Impl.GetCtrlVerticalOffset(ctrl, relTo);
};

HwpCtrl.prototype.GetFilterList = function (flags) {
    return this.Impl.GetFilterList(flags);
};

HwpCtrl.prototype.KeyIndicator = function () {
    return this.Impl.KeyIndicator();
};

HwpCtrl.prototype.GetFormObjectAttr = function (formname, attrname) {
    return this.Impl.GetFormObjectAttr(formname, attrname);
};

HwpCtrl.prototype.SetFormObjectAttr = function (formname, attrname, value) {
    return this.Impl.SetFormObjectAttr(formname, attrname ,value);
};

HwpCtrl.prototype.GetMessageSet = function () {
    return this.Impl.GetMessageSet();
};

HwpCtrl.prototype.GetMousePos = function (Xrelto, Yrelto) {
    return this.Impl.GetMousePos(Xrelto, Yrelto);
};

HwpCtrl.prototype.PreviewCommand = function (previewmode) {
    return this.Impl.PreviewCommand(previewmode);
};

HwpCtrl.prototype.GetTableCellAddr = function (type) {
    return this.Impl.GetTableCellAddr(type);
};

HwpCtrl.prototype.GetViewStatus = function (nType) {
    return this.Impl.GetViewStatus(nType);
};

HwpCtrl.prototype.GetCurFieldName = function (option) {
    return this.Impl.GetCurFieldName(option);
};

HwpCtrl.prototype.GetFieldList = function (number, option) {
    return this.Impl.GetFieldList(number, option);
};

HwpCtrl.prototype.GetFieldText = function (fieldlist) {
    return this.Impl.GetFieldText(fieldlist);
};

HwpCtrl.prototype.GetText = function(){
    return this.Impl.GetText();
};

HwpCtrl.prototype.GetTextBySet = function(text){
    return this.Impl.GetTextBySet(text);
};

HwpCtrl.prototype.GetTextFile = function (format, option, callback) {
    return this.Impl.GetTextFile(format, option, callback);
};

HwpCtrl.prototype.GetFileInfo = function (FileName) {
    return this.Impl.GetFileInfo(FileName);
};

HwpCtrl.prototype.GetPosBySet = function () {
    return this.Impl.GetPosBySet();
};

HwpCtrl.prototype.GetPos = function () {
    return this.Impl.GetPos();
};

HwpCtrl.prototype.GetMousePos = function(Xrelto, Yrelto) {
    return this.Impl.GetMousePos(Xrelto, Yrelto);
};

HwpCtrl.prototype.GetSelectedPosBySet = function(sset, eset) {
    return this.Impl.GetSelectedPosBySet(sset, eset);
};

HwpCtrl.prototype.GetSelectedPos = function() {
    return this.Impl.GetSelectedPos();
};

HwpCtrl.prototype.InsertMenu = function(menuidx, menustr, actionstr, menutype) {
    return this.Impl.InsertMenu(menuidx, menustr, actionstr, menutype);
};

HwpCtrl.prototype.RemoveMenu = function(menuidx, menutype) {
    return this.Impl.RemoveMenu(menuidx, menutype);
};

HwpCtrl.prototype.GetPageText = function(pgno, option) {
    return this.Impl.GetPageText(pgno, option);
};

HwpCtrl.prototype.ShowCaret = function(bShow) {
    return this.Impl.ShowCaret(bShow);
};

HwpCtrl.prototype.SetBarCodeImage = function(lpImagePath, pgno, index, x, y, width, height) {
    return this.Impl.SetBarCodeImage(lpImagePath, pgno, index, x, y, width, height);
};

HwpCtrl.prototype.ShowPageTooltip = function(bShow) {
    return this.Impl.ShowPageTooltip(bShow);
};

HwpCtrl.prototype.ShowToolBar = function(bShow) {
    return this.Impl.ShowToolBar(bShow);
};

HwpCtrl.prototype.ShowRibbon = function(bShow) {
    return this.Impl.ShowRibbon(bShow);
};

HwpCtrl.prototype.SetToolBar = function(option, toolbarID) {
    return this.Impl.SetToolBar(option, toolbarID);
};

HwpCtrl.prototype.ShowStatusBar = function(bShow) {
    return this.Impl.ShowStatusBar(bShow);
};

HwpCtrl.prototype.IsCommandLock = function (actionID) {
    return this.Impl.IsCommandLock(actionID);
};

HwpCtrl.prototype.InitScan = function (option, range, spara, spos, epara, epos) {
    return this.Impl.InitScan(option, range, spara, spos, epara, epos);
};

HwpCtrl.prototype.Insert = function (path, format, arg, callback, callbackUserData) {
    return this.Impl.Insert(path, format, arg, callback, callbackUserData);
};

HwpCtrl.prototype.InsertPicture = function (path, embedded, sizeoption, reverse, watermark, effect, width, height, callback) {
    return this.Impl.InsertPicture(path, embedded, sizeoption, reverse, watermark, effect, width, height, callback);
};

HwpCtrl.prototype.InsertBackgroundPicture = function (bordertype, path, embedded, filloption, watermark, effect, brightness, contrast, callback) {
    return this.Impl.InsertBackgroundPicture(bordertype, path, embedded, filloption, watermark, effect, brightness, contrast, callback);
};

HwpCtrl.prototype.InsertCtrl = function(ctrlid, initparam) {
    return this.Impl.InsertCtrl(ctrlid, initparam);
};

HwpCtrl.prototype.InsertDocument = function(path, callback, callbackUserData) {
    return this.Impl.InsertDocument(path, callback, callbackUserData);
};

HwpCtrl.prototype.LunarToSolar = function(nLunarYear, nLunarMonth, nLunarDay, bLeap) {
    return this.Impl.LunarToSolar(nLunarYear, nLunarMonth, nLunarDay, bLeap);
};

HwpCtrl.prototype.LunarToSolarBySet = function(nLunarYear, nLunarMonth, nLunarDay,  bLeap) {
    return this.Impl.LunarToSolarBySet(nLunarYear, nLunarMonth, nLunarDay,  bLeap);
};

HwpCtrl.prototype.SolarToLunar = function(nSolarYear, nSolarMonth, nSolarDay) {
    return this.Impl.SolarToLunar(nSolarYear, nSolarMonth, nSolarDay);
};

HwpCtrl.prototype.SolarToLunarBySet = function(nSolarYear, nSolarMonth, nSolarDay) {
    return this.Impl.SolarToLunarBySet(nSolarYear, nSolarMonth, nSolarDay);
};

HwpCtrl.prototype.ShowVerticalScroll = function (bShow) {
    this.Impl.ShowVerticalScroll(bShow);
};

HwpCtrl.prototype.ShowHorizontalScroll = function (bShow) {
    this.Impl.ShowHorizontalScroll(bShow);
};

HwpCtrl.prototype.LockCommand = function (aidStr, lock) {
    this.Impl.LockCommand(aidStr, lock);
};

HwpCtrl.prototype.ModifyFieldProperties = function (field, remove, add) {
    return this.Impl.ModifyFieldProperties(field, remove, add);
};

HwpCtrl.prototype.MovePos = function (moveID, para, pos) {
    return this.Impl.MovePos(moveID, para, pos);
};

HwpCtrl.prototype.MoveToField = function (field, text, start, select) {
    return this.Impl.MoveToField(field, text, start, select);
};

HwpCtrl.prototype.MoveToFieldEx = function (field, text, start, select) {
    return this.Impl.MoveToFieldEx(field, text, start, select);
};

HwpCtrl.prototype.Open = function (path, format, arg, callback, callbackUserData) {
    return this.Impl.Open(path, format, arg, callback, callbackUserData);
};

HwpCtrl.prototype.OpenDocument = function (path, format, callback) {
    return this.Impl.OpenDocument(path, format, callback);
};

HwpCtrl.prototype.PrintDocument = function(){
    return this.Impl.PrintDocument();
};

HwpCtrl.prototype.RegisterModule = function() {
    this.Impl.RegisterModule();
};

HwpCtrl.prototype.ReleaseScan = function() {
    this.Impl.ReleaseScan();
};

HwpCtrl.prototype.RenameField = function (oldname, newname) {
    this.Impl.RenameField(oldname, newname);
};

HwpCtrl.prototype.ReplaceAction = function (oldActionID, newActionID) {
    return this.Impl.ReplaceAction(oldActionID, newActionID);
};

HwpCtrl.prototype.PutFieldText = function (fieldlist, textlist) {
    this.Impl.PutFieldText(fieldlist, textlist);
};

HwpCtrl.prototype.Run = function (aidStr, callback, callbackUserData) {
    this.Impl.Run(aidStr, callback, callbackUserData);
};

// 웹에서 지원 여부 확인 필요.
HwpCtrl.prototype.Save = function (save_if_dirty) {
    return this.Impl.Save(save_if_dirty);
};

HwpCtrl.prototype.SaveAs = function (fileName, format, arg, callback, callbackUserData) {
    return this.Impl.SaveAs(fileName, format, arg, callback, callbackUserData);
};

HwpCtrl.prototype.SaveDocument = function (fileName, format, callback) {
    return this.Impl.SaveDocument(fileName, format, callback);
};

HwpCtrl.prototype.SelectText = function (spara, spos, epara, epos) {
    return this.Impl.SelectText(spara, spos, epara, epos);
};

HwpCtrl.prototype.SetFieldViewOption = function(option){
    return this.Impl.SetFieldViewOption(option);
};

HwpCtrl.prototype.SetClientName = function(szClient){
    return this.Impl.SetClientName(szClient);
};

HwpCtrl.prototype.SetCurFieldName = function (fieldname, option, direction, memo) {
    return this.Impl.SetCurFieldName(fieldname, option, direction, memo);
};

HwpCtrl.prototype.SetTextFile = function (data, format, option, callback, callbackUserData) {
    return this.Impl.SetTextFile(data, format, option, callback, callbackUserData);
};

HwpCtrl.prototype.SetPosBySet = function (pos) {
    return this.Impl.SetPosBySet(pos);
};

HwpCtrl.prototype.SetPos = function (list, para, pos) {
    return this.Impl.SetPos(list, para, pos);
};

HwpCtrl.prototype.CreatePageImage = function (filename, pgno, format) {
    this.Impl.CreatePageImage(filename, pgno, format);
};

HwpCtrl.prototype.CreatePageImageEx = function (filename, pgno, resolution, depth, format, option, callback, callbackUserData) {
    return this.Impl.CreatePageImageEx(filename, pgno, resolution, depth, format, option, callback, callbackUserData);
};

HwpCtrl.prototype.IsEqualData = function (source, target, format) {
    return this.Impl.IsEqualData(source, target, format);
};

HwpCtrl.prototype.GetActionCallbackMode = function (actionID) {
    return this.Impl.GetActionCallbackMode(actionID);
};

HwpCtrl.prototype.ChangeIME = function(target){
    this.Impl.ChangeIME(target);
};

function BuildWebHwpCtrl(id, baseurl, callback) {
    window.HwpCtrlApp = window.HwpCtrlApp || HwpCtrlApp;
    window.ImageLoader = window.ImageLoader || ImageLoader;
    window.HwpCtrlApp.Initialize(id, baseurl, callback);

    return new HwpCtrl(window.HwpCtrlApp, window.ImageLoader);
}
