Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C58ED59D6F
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2024 20:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dfz3aSWzFeL/wNsyU7bCaoZhdTuFZCw/QBdhr6gyUek=; b=eyvzrOeIK2IY5s
	5mP+n9dws4MgsCLnTD31LZ/NzsliAlXKdL+R+KicG7Q9r5D48ezFloUMCEs5vGiiUJm9tGWV0a9bG
	s1iI5ISLQTRFwQzNVQH37wupdCAejuV8q0g4o2mRSRAMKhV6dFcCxLE6/tUZfd0+IUryUZDiXDne7
	CHl9Ne2734ihT3tq4dm6AtfJd0EIhZiCOLf/BJGqc4s7zKCW32J1BLJoLQ9VVEJ+oRU4yzo5I986P
	QiqC+yf1vXIMOL7xN6SLoQzM7N3GfYDvrS/BNBRqKC3GtOL9+JbSXv/D7K7rR7F6CnxrOvObuGJfv
	C59AMDk4rlM+R9VuiUKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFg8U-000000095AA-0HGQ;
	Mon, 25 Nov 2024 20:56:46 +0000
Received: from bout3.ijzerbout.nl ([2a01:7c8:fff8:2b8:5054:ff:fe86:f72d])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDVdK-0000000DnjB-1jup;
	Tue, 19 Nov 2024 21:19:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1732051176; bh=tJWJ6glvL8iioR1yFCOIXYRhx3OL9I4eFIpYdN8Ak8Y=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=btVzf4WCHSa/LZE5ys/D4KYV7XgRNO4J8jO0O06I2JQcRyYGU8QIr+YaKPY+GFDzB
	 KJXJm2jTEca2HzRag93Oo7Bav0y0GIDbsTKGuUVCP0MsZYV3gjMSi6gouIQeWTbOMz
	 6oq9uvYLjuNy8+AJqYPn5YEzEggr86BhOP00pKlNYIoWJFbfWVbczwJtd//yhsrQdN
	 dnzY/hcJBURtBuPnFZbMyvXQFNYPLezEVRNQYBYBd4DKNX3QKvbjf+LfAxwNSsxDjB
	 knxRAbhwrh09QubzpRr7SLOf7KPgmgsKMetMRGUVTVJMKy0xEeTlrnHnTgVa+eZ7bQ
	 PKpYdvsxiw5MqDndzYA9ciw911pjFDOdZrQgVDnMWB6oewYO67zR9wbjxsq3a/CPap
	 /gG0EaqU+0tJilDJKPyypWX2Y4DUPTrKyI58Fj61JBrNFV9PPcpdLKN5s1uHaarZwQ
	 uA+gvz58VIyed6Pu5zNY4nMA3SLQLwiVHQaPi1KSTl7JR+x5B13tkX0irPAAIIRgl+
	 mNmSUeTkBBO2yWgux26+2xgKQMDhndSZ+oE4vV8kucEasFn8zhTdm4WLvGU9uZufcW
	 1sFE9mAJF1ZqlD/qMPd7293bEymLyjgwodwq1uOlftzDaAYZ65AuJ5x8KkfrrkNZbo
	 OSy6QmqZXVu9VbgwMEyWNrbg=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id 85DFF18E0A9;
	Tue, 19 Nov 2024 22:19:36 +0100 (CET)
Message-ID: <89b5778b-d251-4777-bb6c-54f56740d277@ijzerbout.nl>
Date: Tue, 19 Nov 2024 22:19:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i3c: Use i3cdev->desc->info instead of calling
 i3c_device_get_info() to avoid deadlock
From: Kees Bakker <kees@ijzerbout.nl>
To: mtk25126 <defa.li@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com, mingchang.jia@mediatek.com,
 yuhan.wei@mediatek.com, hao.lin@mediatek.com
References: <20241107132549.25439-1-defa.li@mediatek.com>
 <72410501-657b-40ec-b959-a736c913c486@ijzerbout.nl>
Content-Language: en-US
In-Reply-To: <72410501-657b-40ec-b959-a736c913c486@ijzerbout.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_131938_588858_C51D4532 
X-CRM114-Status: GOOD (  16.51  )
X-Mailman-Approved-At: Mon, 25 Nov 2024 12:56:44 -0800
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T3AgMTktMTEtMjAyNCBvbSAyMTo1MSBzY2hyZWVmIEtlZXMgQmFra2VyOgo+IE9wIDA3LTExLTIw
MjQgb20gMTQ6MjUgc2NocmVlZiBtdGsyNTEyNjoKPj4gRnJvbTogRGVmYSBMaSA8ZGVmYS5saUBt
ZWRpYXRlay5jb20+Cj4+Cj4+IEEgZGVhZGxvY2sgbWF5IGhhcHBlbiBzaW5jZSB0aGUgaTNjX21h
c3Rlcl9yZWdpc3RlcigpIGFjcXVpcmVzCj4+ICZpM2NidXMtPmxvY2sgdHdpY2UuIFNlZSB0aGUg
bG9nIGJlbG93Lgo+PiBVc2UgaTNjZGV2LT5kZXNjLT5pbmZvIGluc3RlYWQgb2YgY2FsbGluZyBp
M2NfZGV2aWNlX2luZm8oKSB0bwo+PiBhdm9pZCBhY3F1aXJpbmcgdGhlIGxvY2sgdHdpY2UuCj4+
Cj4+IHYyOgo+PiDCoMKgIC0gTW9kaWZpZWQgdGhlIHRpdGxlIGFuZCBjb21taXQgbWVzc2FnZQo+
Pgo+PiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+PiBXQVJO
SU5HOiBwb3NzaWJsZSByZWN1cnNpdmUgbG9ja2luZyBkZXRlY3RlZAo+PiA2LjExLjAtbWFpbmxp
bmUKPj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gaW5p
dC8xIGlzIHRyeWluZyB0byBhY3F1aXJlIGxvY2s6Cj4+IGYxZmZmZjgwYTZhNDBkYzAgKCZpM2Ni
dXMtPmxvY2speysrKyt9LXszOjN9LCBhdDogaTNjX2J1c19ub3JtYWx1c2VfbG9jawo+Pgo+PiBi
dXQgdGFzayBpcyBhbHJlYWR5IGhvbGRpbmcgbG9jazoKPj4gZjFmZmZmODBhNmE0MGRjMCAoJmkz
Y2J1cy0+bG9jayl7KysrK30tezM6M30sIGF0OiBpM2NfbWFzdGVyX3JlZ2lzdGVyCj4+Cj4+IG90
aGVyIGluZm8gdGhhdCBtaWdodCBoZWxwIHVzIGRlYnVnIHRoaXM6Cj4+IMKgIFBvc3NpYmxlIHVu
c2FmZSBsb2NraW5nIHNjZW5hcmlvOgo+Pgo+PiDCoMKgwqDCoMKgwqDCoCBDUFUwCj4+IMKgwqDC
oMKgwqDCoMKgIC0tLS0KPj4gwqDCoCBsb2NrKCZpM2NidXMtPmxvY2spOwo+PiDCoMKgIGxvY2so
JmkzY2J1cy0+bG9jayk7Cj4+Cj4+IMKgICoqKiBERUFETE9DSyAqKioKPj4KPj4gwqAgTWF5IGJl
IGR1ZSB0byBtaXNzaW5nIGxvY2sgbmVzdGluZyBub3RhdGlvbgo+Pgo+PiAyIGxvY2tzIGhlbGQg
YnkgaW5pdC8xOgo+PiDCoCAjMDogZmNmZmZmODA5YjY3OThmOCAoJmRldi0+bXV0ZXgpey4uLi59
LXszOjN9LCBhdDogX19kcml2ZXJfYXR0YWNoCj4+IMKgICMxOiBmMWZmZmY4MGE2YTQwZGMwICgm
aTNjYnVzLT5sb2NrKXsrKysrfS17MzozfSwgYXQ6IAo+PiBpM2NfbWFzdGVyX3JlZ2lzdGVyCj4+
Cj4+IHN0YWNrIGJhY2t0cmFjZToKPj4gQ1BVOiA2IFVJRDogMCBQSUQ6IDEgQ29tbTogaW5pdAo+
PiBDYWxsIHRyYWNlOgo+PiDCoCBkdW1wX2JhY2t0cmFjZSsweGZjLzB4MTdjCj4+IMKgIHNob3df
c3RhY2srMHgxOC8weDI4Cj4+IMKgIGR1bXBfc3RhY2tfbHZsKzB4NDAvMHhjMAo+PiDCoCBkdW1w
X3N0YWNrKzB4MTgvMHgyNAo+PiDCoCBwcmludF9kZWFkbG9ja19idWcrMHgzODgvMHgzOTAKPj4g
wqAgX19sb2NrX2FjcXVpcmUrMHgxOGJjLzB4MzJlYwo+PiDCoCBsb2NrX2FjcXVpcmUrMHgxMzQv
MHgyYjAKPj4gwqAgZG93bl9yZWFkKzB4NTAvMHgxOWMKPj4gwqAgaTNjX2J1c19ub3JtYWx1c2Vf
bG9jaysweDE0LzB4MjQKPj4gwqAgaTNjX2RldmljZV9nZXRfaW5mbysweDI0LzB4NTgKPj4gwqAg
aTNjX2RldmljZV91ZXZlbnQrMHgzNC8weGE0Cj4+IMKgIGRldl91ZXZlbnQrMHgzMTAvMHgzODQK
Pj4gwqAga29iamVjdF91ZXZlbnRfZW52KzB4MjQ0LzB4NDE0Cj4+IMKgIGtvYmplY3RfdWV2ZW50
KzB4MTQvMHgyMAo+PiDCoCBkZXZpY2VfYWRkKzB4Mjc4LzB4NDYwCj4+IMKgIGRldmljZV9yZWdp
c3RlcisweDIwLzB4MzQKPj4gwqAgaTNjX21hc3Rlcl9yZWdpc3Rlcl9uZXdfaTNjX2RldnMrMHg3
OC8weDE1NAo+PiDCoCBpM2NfbWFzdGVyX3JlZ2lzdGVyKzB4NmEwLzB4NmQ0Cj4+IMKgIG10a19p
M2NfbWFzdGVyX3Byb2JlKzB4M2I4LzB4NGQ4Cj4+IMKgIHBsYXRmb3JtX3Byb2JlKzB4YTAvMHhl
MAo+PiDCoCByZWFsbHlfcHJvYmUrMHgxMTQvMHg0NTQKPj4gwqAgX19kcml2ZXJfcHJvYmVfZGV2
aWNlKzB4YTAvMHgxNWMKPj4gwqAgZHJpdmVyX3Byb2JlX2RldmljZSsweDNjLzB4MWFjCj4+IMKg
IF9fZHJpdmVyX2F0dGFjaCsweGM0LzB4MWYwCj4+IMKgIGJ1c19mb3JfZWFjaF9kZXYrMHgxMDQv
MHgxNjAKPj4gwqAgZHJpdmVyX2F0dGFjaCsweDI0LzB4MzQKPj4gwqAgYnVzX2FkZF9kcml2ZXIr
MHgxNGMvMHgyOTQKPj4gwqAgZHJpdmVyX3JlZ2lzdGVyKzB4NjgvMHgxMDQKPj4gwqAgX19wbGF0
Zm9ybV9kcml2ZXJfcmVnaXN0ZXIrMHgyMC8weDMwCj4+IMKgIGluaXRfbW9kdWxlKzB4MjAvMHhm
ZTQKPj4gwqAgZG9fb25lX2luaXRjYWxsKzB4MTg0LzB4NDY0Cj4+IMKgIGRvX2luaXRfbW9kdWxl
KzB4NTgvMHgxZWMKPj4gwqAgbG9hZF9tb2R1bGUrMHhlZmMvMHgxMGM4Cj4+IMKgIF9fYXJtNjRf
c3lzX2Zpbml0X21vZHVsZSsweDIzOC8weDMzYwo+PiDCoCBpbnZva2Vfc3lzY2FsbCsweDU4LzB4
MTBjCj4+IMKgIGVsMF9zdmNfY29tbW9uKzB4YTgvMHhkYwo+PiDCoCBkb19lbDBfc3ZjKzB4MWMv
MHgyOAo+PiDCoCBlbDBfc3ZjKzB4NTAvMHhhYwo+PiDCoCBlbDB0XzY0X3N5bmNfaGFuZGxlcisw
eDcwLzB4YmMKPj4gwqAgZWwwdF82NF9zeW5jKzB4MWE4LzB4MWFjCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IERlZmEgTGkgPGRlZmEubGlAbWVkaWF0ZWsuY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9p
M2MvbWFzdGVyLmMgfCAzICsrLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBi
L2RyaXZlcnMvaTNjL21hc3Rlci5jCj4+IGluZGV4IDZmM2ViNzEwYTc1ZC4uYmI4YThiZjBjNGM3
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+PiArKysgYi9kcml2ZXJzL2kz
Yy9tYXN0ZXIuYwo+PiBAQCAtMjgyLDcgKzI4Miw4IEBAIHN0YXRpYyBpbnQgaTNjX2RldmljZV91
ZXZlbnQoY29uc3Qgc3RydWN0IGRldmljZSAKPj4gKmRldiwgc3RydWN0IGtvYmpfdWV2ZW50X2Vu
diAqZQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBpM2NfZGV2aWNlX2luZm8gZGV2aW5mbzsKPj4gwqDC
oMKgwqDCoCB1MTYgbWFudWYsIHBhcnQsIGV4dDsKPj4gwqAgLcKgwqDCoCBpM2NfZGV2aWNlX2dl
dF9pbmZvKGkzY2RldiwgJmRldmluZm8pOwo+PiArwqDCoMKgIGlmIChpM2NkZXYtPmRlc2MpCj4+
ICvCoMKgwqDCoMKgwqDCoCBkZXZpbmZvID0gaTNjZGV2LT5kZXNjLT5pbmZvOwo+IE5vdyB5b3Ug
aGF2ZSBsZWZ0IGRldmluZm8gdW5pdGlhbGl6ZWQgaWYgaTNjZGV2LT5kZXNjID09IE5VTEwKPiBZ
b3UgaGF2ZSB0byBmaWd1cmUgb3V0IHdoYXQgdG8gZG8gaW4gdGhhdCBjYXNlLgpJdCBsb29rcyBs
aWtlIGl0IGlzIG9sZCBwcm9sZW0sIGFscmVhZHkgaW50cm9kdWNlZCBpbiAyMDE3LCBjb21taXQg
CjNhMzc5YmJjZWEuClRoZXJlIGlzIGEgc2ltaWxhciBwcm9ibGVtIGluIG1vZGFsaWFzX3Nob3co
KSBhbmQgbWN0cF9pM2Nfc2V0dXAoKQoKVG8gYmUgaG9uZXN0LCBJIGRvbid0IGtub3cgdGhlIGRy
aXZlciB3ZWxsIGVub3VnaC4gTWF5YmUgaTNjZGV2LT5kZXNjIHNob3VsZApuZXZlciBiZSBOVUxM
LiBQZXJoYXBzIHdlIG5lZWQgYSBXQVJOX09OIG9yIFdBUk5fT05fT05DRSBpbnN0ZWFkCm9mIGEg
c2ltcGxlIE5VTEwgY2hlY2suIFN0aWxsIHdlIG5lZWQgdG8gZXhpdCB0aGUgZnVuY3Rpb24gaWYg
dGhlIHVuZXhwZWN0ZWQKaGFwcGVucy4KPj4gwqDCoMKgwqDCoCBtYW51ZiA9IEkzQ19QSURfTUFO
VUZfSUQoZGV2aW5mby5waWQpOwo+PiDCoMKgwqDCoMKgIHBhcnQgPSBJM0NfUElEX1BBUlRfSUQo
ZGV2aW5mby5waWQpOwo+PiDCoMKgwqDCoMKgIGV4dCA9IEkzQ19QSURfRVhUUkFfSU5GTyhkZXZp
bmZvLnBpZCk7Cj4KCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWkzYwo=
