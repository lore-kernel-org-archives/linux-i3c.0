Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F27C87FCE
	for <linux-i3c@archiver.kernel.org>; Sat, 26 Jul 2025 02:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ssToBhVpIEO1Nz9MJ8TTAu6e9NzhOBbZCtPTJrXf4xw=; b=HM9nkJ1V2R7mXS
	m7VQhqjwjO/yp+tmCmTxOgl+7pQN8TB0g6QJMUpn+UGkNJcWstYDf1UMK6nOpkGqJzCooOrZSq0kH
	TLaO94Lo+7kla030mdUgY+h3/LPhcgXprignF4JSNoBYf1HO31l6TRpz+SnRMH3drhBGPIuKLgLvo
	DGwdpnOopH96u8WNKvfQgigdhSRU48dvVMQH1+O7yCBp0vLGouOjs80ZQ8lMc8+ymGzW5odAGMBwd
	8N/J2DhWB5giGFb8mWUBqVgvjGydWfcK+Yl7uVsSyO+EFvuvZFQ8PMGlDajg+v1M/0mjvdR4BIl8d
	iLFiugvyqczwexfwDKxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufUTG-0000000B2PS-1nRe;
	Sat, 26 Jul 2025 02:17:10 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufUTD-0000000B2P6-3FNE
	for linux-i3c@lists.infradead.org;
	Sat, 26 Jul 2025 02:17:09 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-87c26c9e8d5so179729139f.0
        for <linux-i3c@lists.infradead.org>; Fri, 25 Jul 2025 19:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753496227; x=1754101027; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJgRjn3YLVk27IsToicnqn+k2tZqaAwGO0Yoq2mc760=;
        b=Q0W2fWKYfI5KeZDqNz/nzPG6RyDTpJ0w6lANQbZsYrS8/Eu69CIEPTF6HRGAdMIF/g
         JbMplxhlKmc+M4ts/+u2lt4zMKdeUgiH6Dxy9GQhx9qOPACjieKwINYo/pGbDiWU7Hut
         3Z1gl7D9NCfpNndMb3BHU9wqakxy8JFI5aackAYLS027ubPXETndTSRjJTAbWZ99m9Gk
         8C8S63OZ4gTGsre/NIq9NccJn43LHb6azZjZulwRp3WyKarCR3Y2FCAM93y2hAsYqru0
         Vz2R78/iPM+GDVA6V2yLnN3YditCJfsaxdLglI/RIJt6ZI8HdjR5brGCcErs0KskGp7S
         GUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753496227; x=1754101027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJgRjn3YLVk27IsToicnqn+k2tZqaAwGO0Yoq2mc760=;
        b=MeAsb8dwdTNR25fUcYFPfbXE1uzXidJ4dA2BYdDQEIgcAFj2bDMNi4hXlSjm3TBl1b
         QiNMcVWBqeTdATRdKzPUt7ks8pezWjSLhTbikwYK+zIwiHFhei19aujMwwaIoMXinmKZ
         LVZuziFXTuAqNWFGYiOmLou6IOnh3iIFanUeh8rIVo8OFA/gLU/uFQhlZwMqPIXApGSk
         StUSqYcH97xWB/tXgd5diOrmFyBctIv/OxTQNDXTueFWX2dl4iAan7L472LuPqKBDJ0B
         3HSYKeR+IYKe1tVyN0c1xXbMOQf9+1E30Ba6qMLL3WU3s+bg9bGMZaAFWVqN+9TLOnuZ
         9RNw==
X-Forwarded-Encrypted: i=1; AJvYcCVE6Gwkh9GNoEWOb4CDjNGUaEgl7J78EF0f2MttME9mp2l/l71ztwGb6eD1I+oM4TIyX+Vp4d8SBNQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4dcPj8ApaCiILooYhxJdFpN5yBD5It0WSQiFzPvWQmdb3EEDc
	dggF2qhDWH1bX6D01TqMfqsbnwAQ+ah+b3CHUGiRk7hjsrjlz3vamdRCk1576kQy1lwHlSRIjJD
	nw+BH6qv23jz8vt4CZEMIoB34HyB0Cpo=
X-Gm-Gg: ASbGncuz80+zq5d5LkqFxmEBl2D0BBAW0M0nRVwX2LQ1EBh3zVy3sA0c12yin9DdO8s
	zdevJSWRrlj5VJtQtU8MEUKHuuDIBJsFMvpNJER2w1LQXMrPq5hImZ3CdOd81G6HRZO9/krRL+P
	GGHvmcMW+PPqVS8DtZGDD1E+y2H/oFWMfGRD2731HAKwBe00iJ9lpTnNI+0mPZaBF8K8sre4W2s
	qNPbAX1XuhdTL346UzyHS299QxYqwd3jBwXbodjsg==
X-Google-Smtp-Source: AGHT+IGwmJFA0QO/fTUC2Zyu0RWKQi3oIuYamLY+kFrPVbF9MIQZqt0msGDVa8Ev0WPFgIG5n+LMEFpLDjc+8Cxo9Y4=
X-Received: by 2002:a05:6e02:2491:b0:3e2:c345:17f2 with SMTP id
 e9e14a558f8ab-3e3c5226dadmr81617365ab.3.1753496226738; Fri, 25 Jul 2025
 19:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250725070310.1655585-1-yschu@nuvoton.com> <aIOKeClm/vOPp4IU@lizhi-Precision-Tower-5810>
 <CAPwEoQNfdit9fOiUY-WzQvS377nEqBu=s8S1zqS7tdSZfQeCHQ@mail.gmail.com> <aIOfLYIVE8NkYTxH@lizhi-Precision-Tower-5810>
In-Reply-To: <aIOfLYIVE8NkYTxH@lizhi-Precision-Tower-5810>
From: Stanley Chu <stanley.chuys@gmail.com>
Date: Sat, 26 Jul 2025 10:16:54 +0800
X-Gm-Features: Ac12FXxQspcgwBj2DhIBGT3V55FvnqyU52l4Wl8p6U_oPpKwgo1g9sLEszoQdt4
Message-ID: <CAPwEoQOG3qt9APbk5ULOHmJer-tXNPcrK_u09km7ye2qoTZcnA@mail.gmail.com>
Subject: Re: [PATCH v1] i3c: master: svc: Fix npcm845 FIFO_EMPTY quirk
To: Frank Li <Frank.li@nxp.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_191707_835965_E651D308 
X-CRM114-Status: GOOD (  33.62  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdWwgMjUsIDIwMjUgYXQgMTE6MTPigK9QTSBGcmFuayBMaSA8RnJhbmsubGlAbnhw
LmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1bCAyNSwgMjAyNSBhdCAxMDo1MDozNFBNICswODAw
LCBTdGFubGV5IENodSB3cm90ZToKPiA+IEhpIEZyYW5rLAo+ID4KPiA+IE9uIEZyaSwgSnVsIDI1
LCAyMDI1IGF0IDk6NDXigK9QTSBGcmFuayBMaSA8RnJhbmsubGlAbnhwLmNvbT4gd3JvdGU6Cj4g
PiA+Cj4gPiA+IE9uIEZyaSwgSnVsIDI1LCAyMDI1IGF0IDAzOjAzOjEwUE0gKzA4MDAsIFN0YW5s
ZXkgQ2h1IHdyb3RlOgo+ID4gPiA+IEZyb206IFN0YW5sZXkgQ2h1IDx5c2NodUBudXZvdG9uLmNv
bT4KPiA+ID4gPgo+ID4gPiA+IFByZWZpbGxpbmcgaW4gcHJpdmF0ZSB3cml0ZSB0cmFuc2ZlcnMg
aXMgb25seSBuZWNlc3Nhcnkgd2hlbiB0aGUgRklGTwo+ID4gPiA+IGlzIGVtcHR5LiBPdGhlcndp
c2UsIGlmIHRoZSB0cmFuc2ZlciBpcyBOQUNLZWQgZHVlIHRvIElCSVdPTiBhbmQgcmV0cmllcwo+
ID4gPiA+IGNvbnRpbnVlLCBkYXRhIG1heSBiZSBwcmVmaWxsZWQgYWdhaW4gYnV0IGNvdWxkIGJl
IGxvc3QgYmVjYXVzZSB0aGUgRklGTwo+ID4gPiA+IGlzIG5vdCBlbXB0eS4KPiA+ID4KPiA+ID4g
d2h5ICJtYXliZSBwcmVmaWxsZWQiLCBwbGVhc2UgdXNlIGNlcnRhaW4gd29yZHMuCj4gPiBUaGUg
b3JpZ2luYWwgY29kZSBkaWRuJ3QgY29uc2lkZXIgdGhlIHJldHJ5IGNhc2UsIGRhdGEgbG9zdCBo
YXBwZW4gaW4KPiA+IHRoZSByZXRyeSBjYXNlIG9ubHkgd2hlbiB0b3RhbCB3cml0ZSBieXRlcyBp
cyBsYXJnZXIgdGhhbiBGSUZPIHNpemUsCj4gPiBub3QgYWx3YXlzIGhhcHBlbi4KPiA+IEluIHRo
ZSBleGFtcGxlIG9mIHdyaXRpbmcgMTcgYnl0ZXMgKEZJRk8gc2l6ZSBpcyAxNiksIHRoZSBsYXN0
IGJ5dGUgaXMgbG9zdC4KPiA+IDEuIEVtaXQgUytBZGRyL1cKPiA+IDIuIFdyaXRlIDE2IGJ5dGVz
IHRvIEZJRk8gKEZJRk8gaXMgZnVsbCkKPiA+IDMuIE5BQ0tlZCBkdWUgdG8gSUJJV09OCj4gPiA0
LiAocmV0cnkpIEVtaXQgU3IrQWRkci9XCj4gPiA1LiBXcml0ZSBsYXN0IGJ5dGUgdG8gRklGTyAo
ZGF0YSBsb3N0KQo+Cj4gWW91IG5lZWQgZGVzY3JpcHQgY2xlYXJseSBhdCBjb21taXQgbWVzc2Fn
ZSBhYm91dCB0aGlzLgo+Cj4gPgo+ID4gSSBqdXN0IG5lZWQgdG8gcHJlZmlsbCBGSUZPIGluIHRo
ZSBiZWdpbm5pbmcgdG8gbWFrZSBzdXJlIEZJRk8gaXMgbm90Cj4gPiBlbXB0eSB3aGVuIEhXIHN0
YXJ0cyB0cmFuc21pdHRpbmcuCj4gPiBTbywgdGhpcyBwYXRjaCBhZGRzIGEgY29uZGl0aW9uIHRo
YXQgcHJlZmlsbCBGSUZPIG9ubHkgd2hlbiBGSUZPIGlzIGVtcHR5Lgo+ID4KPiA+ID4KPiA+ID4g
Pgo+ID4gPiA+IEZpeGVzOiA0MDA4YTc0ZTBmOWIgKCJpM2M6IG1hc3Rlcjogc3ZjOiBGaXggbnBj
bTg0NSBGSUZPIGVtcHR5IGlzc3VlIikKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTdGFubGV5IENo
dSA8eXNjaHVAbnV2b3Rvbi5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvaTNjL21h
c3Rlci9zdmMtaTNjLW1hc3Rlci5jIHwgMTEgKysrKysrKysrKy0KPiA+ID4gPiAgMSBmaWxlIGNo
YW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPgo+ID4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMv
aTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gPiA+ID4gaW5kZXggN2UxYTdjYjk0YjQzLi4z
NGI2ZTEyNWIxOGEgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1p
M2MtbWFzdGVyLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0
ZXIuYwo+ID4gPiA+IEBAIC0xMDQsNiArMTA0LDcgQEAKPiA+ID4gPiAgI2RlZmluZSAgIFNWQ19J
M0NfTURBVEFDVFJMX1RYVFJJR19GSUZPX05PVF9GVUxMIEdFTk1BU0soNSwgNCkKPiA+ID4gPiAg
I2RlZmluZSAgIFNWQ19JM0NfTURBVEFDVFJMX1JYVFJJR19GSUZPX05PVF9FTVBUWSAwCj4gPiA+
ID4gICNkZWZpbmUgICBTVkNfSTNDX01EQVRBQ1RSTF9SWENPVU5UKHgpIEZJRUxEX0dFVChHRU5N
QVNLKDI4LCAyNCksICh4KSkKPiA+ID4gPiArI2RlZmluZSAgIFNWQ19JM0NfTURBVEFDVFJMX1RY
Q09VTlQoeCkgRklFTERfR0VUKEdFTk1BU0soMjAsIDE2KSwgKHgpKQo+ID4gPiA+ICAjZGVmaW5l
ICAgU1ZDX0kzQ19NREFUQUNUUkxfVFhGVUxMIEJJVCgzMCkKPiA+ID4gPiAgI2RlZmluZSAgIFNW
Q19JM0NfTURBVEFDVFJMX1JYRU1QVFkgQklUKDMxKQo+ID4gPiA+Cj4gPiA+ID4gQEAgLTI4MCw2
ICsyODEsMTMgQEAgc3RhdGljIGlubGluZSBib29sIGlzX2V2ZW50c19lbmFibGVkKHN0cnVjdCBz
dmNfaTNjX21hc3RlciAqbWFzdGVyLCB1MzIgbWFzaykKPiA+ID4gPiAgICAgICByZXR1cm4gISEo
bWFzdGVyLT5lbmFibGVkX2V2ZW50cyAmIG1hc2spOwo+ID4gPiA+ICB9Cj4gPiA+ID4KPiA+ID4g
PiArc3RhdGljIGlubGluZSBib29sIHN2Y19pM2NfbWFzdGVyX3R4X2VtcHR5KHN0cnVjdCBzdmNf
aTNjX21hc3RlciAqbWFzdGVyKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyAgICAgdTMyIHJlZyA9IHJl
YWRsKG1hc3Rlci0+cmVncyArIFNWQ19JM0NfTURBVEFDVFJMKTsKPiA+ID4gPiArCj4gPiA+ID4g
KyAgICAgcmV0dXJuIChTVkNfSTNDX01EQVRBQ1RSTF9UWENPVU5UKHJlZykgPT0gMCk7Cj4gPiA+
ID4gK30KPiA+ID4gPiArCj4gPiA+ID4gIHN0YXRpYyBib29sIHN2Y19pM2NfbWFzdGVyX2Vycm9y
KHN0cnVjdCBzdmNfaTNjX21hc3RlciAqbWFzdGVyKQo+ID4gPiA+ICB7Cj4gPiA+ID4gICAgICAg
dTMyIG1zdGF0dXMsIG1lcnJ3YXJuOwo+ID4gPiA+IEBAIC0xMzAzLDcgKzEzMTEsOCBAQCBzdGF0
aWMgaW50IHN2Y19pM2NfbWFzdGVyX3hmZXIoc3RydWN0IHN2Y19pM2NfbWFzdGVyICptYXN0ZXIs
Cj4gPiA+ID4gICAgICAgICAgICAgICAgKiBUaGUgb25seSB3YXkgdG8gd29yayBhcm91bmQgdGhp
cyBoYXJkd2FyZSBpc3N1ZSBpcyB0byBsZXQgdGhlCj4gPiA+ID4gICAgICAgICAgICAgICAgKiBG
SUZPIHN0YXJ0IGZpbGxpbmcgYXMgc29vbiBhcyBwb3NzaWJsZSBhZnRlciBFbWl0U3RhcnRBZGRy
Lgo+ID4gPiA+ICAgICAgICAgICAgICAgICovCj4gPiA+ID4gLSAgICAgICAgICAgICBpZiAoc3Zj
X2hhc19xdWlyayhtYXN0ZXIsIFNWQ19JM0NfUVVJUktfRklGT19FTVBUWSkgJiYgIXJudyAmJiB4
ZmVyX2xlbikgewo+ID4gPiA+ICsgICAgICAgICAgICAgaWYgKHN2Y19oYXNfcXVpcmsobWFzdGVy
LCBTVkNfSTNDX1FVSVJLX0ZJRk9fRU1QVFkpICYmICFybncgJiYgeGZlcl9sZW4gJiYKPiA+ID4g
PiArICAgICAgICAgICAgICAgICBzdmNfaTNjX21hc3Rlcl90eF9lbXB0eShtYXN0ZXIpKSB7Cj4g
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHUzMiBlbmQgPSB4ZmVyX2xlbiA+IFNWQ19JM0Nf
RklGT19TSVpFID8gMCA6IFNWQ19JM0NfTVdEQVRBQl9FTkQ7Cj4gPiA+ID4gICAgICAgICAgICAg
ICAgICAgICAgIHUzMiBsZW4gPSBtaW5fdCh1MzIsIHhmZXJfbGVuLCBTVkNfSTNDX0ZJRk9fU0la
RSk7Cj4gPiA+Cj4gPiA+IGlmIHByZWZpbGwgdG8gRklGTyBTSVpFIGVhY2ggdGltZSwgc3VjaCBh
cwo+ID4gPgo+ID4gPiByZXBsYWNlIFNWQ19JM0NfRklGT19TSVpFIHdpdGgKPiA+ID4KPiA+ID4g
U1ZDX0kzQ19GSUZPX1NJWkUgLSBTVkNfSTNDX01EQVRBQ1RSTF9UWENPVU5UKHJlYWRsKG1hc3Rl
ci0+cmVncyArIFNWQ19JM0NfTURBVEFDVFJMKSkuCj4gPiA+Cj4gPiBUaGUgZnJlZSBzcGFjZSBp
cyBTVkNfSTNDX0ZJRk9fU0laRSB3aGVuIEZJRk8gaXMgZW1wdHksIG5vIG5lZWQgdG8KPiA+IGNo
ZWNrIFRYIGNvdW50IGFnYWluLgo+Cj4gTXkgbWVhbnMgaXMgdGhhdCBpZiB1c2UgYWJvdmUgbG9n
aWMsIG5lZWRuJ3QgY2hlY2sgaGVscGVyIGZ1bmN0aW9uCj4gc3ZjX2kzY19tYXN0ZXJfdHhfZW1w
dHkobWFzdGVyKS4KPgo+IERvZXMgdGhpcyBtZXRob2Qgd29yaz8KPgpUaGFua3MgRnJhbmssClRo
aXMgbWV0aG9kIGlzIGFub3RoZXIgb3B0aW9uIHRoYXQgYWxzbyBjYW4gd29yayBmb3IgdGhpcyBp
c3N1ZS4KSSB3aWxsIHN1Ym1pdCB2ZXJzaW9uIDIuCgo+IEZyYW5rCj4KPiA+Cj4gPiAtLQo+ID4g
U3RhbmxleQo+ID4KPiA+ID4gRnJhbmsKPiA+ID4gPgo+ID4gPiA+IC0tCj4gPiA+ID4gMi4zNC4x
Cj4gPiA+ID4KPiA+Cj4gPiAtLQo+ID4gbGludXgtaTNjIG1haWxpbmcgbGlzdAo+ID4gbGludXgt
aTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtaTNjCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51
eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
