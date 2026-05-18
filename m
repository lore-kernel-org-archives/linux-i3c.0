Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040F7CD4F48
	for <linux-i3c@archiver.kernel.org>; Mon, 18 May 2026 07:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eCDU0Sp/dAqeQapCa7m+RziC4FhmF0HmhmufstzNT4=; b=mS18a4IgNl6k51
	OTadmGIKT0suHMExaNLyLG2Dzw7utyA63nHWSHzFqazc8bZNKIZYD7+fx8EfBCxiFDGTZpPOZZR+m
	bta8iJ9A//yvltK/oOmCfd0iwW75LgYWJQtINHFmR6FVSr/CkKEt4uTTw9Sp5oNEgUaYBp35XBoIC
	G+SZ63XyQcR0K/WiWxkyv3qEHZcC+AM1Ma17NYnAtyJbhQLLLaQl2SMAnMIWblvNZttqQ9TPsEwLs
	xGBGy5PNoVA6pTLkau9WdUJSoTa/a5dexZcmyBfSoL5UJImOQKP0A6bzyuqcMSdCoEdQHkQAUK84Q
	/JQ07IMMUYnC2V3ArVTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsOR-0000000EaZG-3Cqw;
	Mon, 18 May 2026 07:28:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsOP-0000000EaYK-3MQ6;
	Mon, 18 May 2026 07:28:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779089281; x=1810625281;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mTL4AmldJLzLoADrNv/OW3KIjhSEDw/stTd1/0S4/Kk=;
  b=I0nxskgXa2zm4t9c6LiOFJMJycw5icblpKYfpVYvE/rzQTZkBxtU6W+U
   HheCywDj48ByDpHUi03D4E1+dgy14Tx7WyJfCBh0j2Fz8Oz3wCJjhgRJU
   alKDa+BJ2QjSItF04OQ7hCVieZTuuz7xik1Guiiw0XpWpDPwRkv6vLZr3
   aIW3SCwykmMhSGU/iFL00mDCrl135jCoQqQMa+yZdVWWVq/lIF7Indfo9
   mB5EOHJhPm6XxM+0y0+e845CwQM07U9laEOjxE360seCryrjX+AlZuRHA
   cxEcBwbUcMh3I6bdbYX1C6/EjDhrwLAdsB2ex5eZv1sbrEslx7OFOkody
   g==;
X-CSE-ConnectionGUID: J2ZZy5+7R6SKTOgX18Itgw==
X-CSE-MsgGUID: 09Eij195QgmMOObYXG9Vhg==
X-IronPort-AV: E=Sophos;i="6.23,241,1770620400"; 
   d="scan'208";a="66398712"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 00:27:59 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Mon, 18 May 2026 00:27:59 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 18 May 2026 00:27:54 -0700
Message-ID: <0ae90352-2099-4d3d-a55c-40a6e090fde4@microchip.com>
Date: Mon, 18 May 2026 09:27:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] ARM: dts: microchip: add I3C controller
To: Manikandan M - I67131 <Manikandan.M@microchip.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"Frank.Li@nxp.com" <Frank.Li@nxp.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "tytso@mit.edu" <tytso@mit.edu>, Aubin Constans - M51280
	<Aubin.Constans@microchip.com>, Ryan Wanner - C70674
	<Ryan.Wanner@microchip.com>, Romain Sioen - M70749
	<Romain.Sioen@microchip.com>, "durai.manickamkr@microchip.com"
	<durai.manickamkr@microchip.com>, Cristian Birsan - M91496
	<Cristian.Birsan@microchip.com>, "adrian.hunter@intel.com"
	<adrian.hunter@intel.com>, "jarkko.nikula@linux.intel.com"
	<jarkko.nikula@linux.intel.com>, "npitre@baylibre.com" <npitre@baylibre.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
References: <20260507084805.481737-1-manikandan.m@microchip.com>
 <20260507084805.481737-5-manikandan.m@microchip.com>
 <da83523d-f3ac-42e3-83a2-fb7e7d64ebf9@tuxon.dev>
 <515e89f3-fca9-477c-be4d-be9ed9428d5f@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <515e89f3-fca9-477c-be4d-be9ed9428d5f@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_002801_849803_A95829FC 
X-CRM114-Status: GOOD (  18.36  )
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

T24gMTgvMDUvMjAyNiBhdCAwODoxMCwgTWFuaWthbmRhbiBNIC0gSTY3MTMxIHdyb3RlOgo+IEhp
IENsYXVkaXUsCj4gCj4gT24gMTYvMDUvMjYgOTozNyBwbSwgQ2xhdWRpdSBCZXpuZWEgd3JvdGU6
Cj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50
cyB1bmxlc3MgeW91IGtub3cKPj4gdGhlIGNvbnRlbnQgaXMgc2FmZQo+Pgo+PiBIaSwgTWFuaWth
bmRhbiwKPj4KPj4gT24gNS83LzI2IDExOjQ4LCBNYW5pa2FuZGFuIE11cmFsaWRoYXJhbiB3cm90
ZToKPj4+IEZyb206IER1cmFpIE1hbmlja2FtIEtSIDxkdXJhaS5tYW5pY2thbWtyQG1pY3JvY2hp
cC5jb20+Cj4+Pgo+Pj4gQWRkIEkzQyBjb250cm9sbGVyIGZvciBzYW1hN2Q2NSBTb0MuCj4+Pgo+
Pj4gU2lnbmVkLW9mZi1ieTogRHVyYWkgTWFuaWNrYW0gS1IgPGR1cmFpLm1hbmlja2Fta3JAbWlj
cm9jaGlwLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIDxt
YW5pa2FuZGFuLm1AbWljcm9jaGlwLmNvbT4KPj4+IC0tLQo+Pj4gQ2hhbmdlcyBpbiB2MzoKPj4+
IC0gUmVtb3ZlIGNsb2NrLW5hbWVzIHByb3BlcnR5IGFzIGRyaXZlciBlbmFibGVzIHRoZSBjbGsg
aW4gYnVsawo+Pj4KPj4+ICDCoCBhcmNoL2FybS9ib290L2R0cy9taWNyb2NoaXAvc2FtYTdkNjUu
ZHRzaSB8IDggKysrKysrKysKPj4+ICDCoCAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL21pY3JvY2hpcC9zYW1hN2Q2
NS5kdHNpCj4+PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL21pY3JvY2hpcC9zYW1hN2Q2NS5kdHNpCj4+
PiBpbmRleCA2NzI1M2JiYzA4ZGYuLmVjMjAwODQ4YzE1MyAxMDA2NDQKPj4+IC0tLSBhL2FyY2gv
YXJtL2Jvb3QvZHRzL21pY3JvY2hpcC9zYW1hN2Q2NS5kdHNpCj4+PiArKysgYi9hcmNoL2FybS9i
b290L2R0cy9taWNyb2NoaXAvc2FtYTdkNjUuZHRzaQo+Pj4gQEAgLTEwNTUsNSArMTA1NSwxMyBA
QCBnaWM6IGludGVycnVwdC1jb250cm9sbGVyQGU4YzExMDAwIHsKPj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgI2FkZHJlc3MtY2VsbHMgPSA8MD47Cj4+PiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludGVycnVwdC1jb250
cm9sbGVyOwo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+PiArCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGkzYzogaTNjQGU5MDAwMDAwIHsKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAibWljcm9jaGlwLHNh
bWE3ZDY1LWkzYy1oY2kiOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmVnID0gPDB4ZTkwMDAwMDAgMHgzMDA+Owo+Pgo+PiAgIEZyb20gbWFudWFsIGF0IFsx
XSBJIHNlZSB0aGUgc2l6ZSBvZiBJM0NDIHJlZ2lvbiBpcyAweDEwMDAuIFVubGVzcyB0aGF0IGlz
Cj4+IHdyb25nIEkgdGhpbmsgd2Ugc2hvdWxkIHVzZSAweDEwMDAgdG8gcHJvcGVybHkgZGVzY3Jp
YmUgZGUgSFcuIFBsZWFzZQo+PiBsZXQgbWUKPj4ga25vdyBhbmQgSSBjYW4gZG8gaXQgd2hpbGUg
YXBwbHlpbmcuCgpUaGUgbWVtb3J5IG1hcCBzaW1wbHkgZGVzY3JpYmVzIHdoYXQgaXMgdGhlIG5l
eHQgbWVtb3J5IGJvdW5kYXJ5IAphc3NpZ25lZCAob3Igdm9pZCBpbiB0aGlzIGNhc2UpLCBub3Qg
dGhlIGFjdHVhbCBzaXplIG9mIHRoZSBJUCB1c2VyIAppbnRlcmZhY2UuClNvIHdlIHRvb2sgdGhl
IG9wcG9ydHVuaXR5IHRvIGF2b2lkIG1hcHBpbmcgdW51c2VkIG1lbW9yeS4KCj4gQWNjb3JkaW5n
IHRvIFRhYmxlIDc4LjYgKFJlZ2lzdGVyIFN1bW1hcnkpLCB0aGUgSTNDQyByZWdpc3RlciBzcGFj
ZQo+IGV4dGVuZHMgdXAgdG8gb2Zmc2V0IDB4MjU4LCBJZGVhbGx5IHRoZSBtYXBwaW5nIHNob3Vs
ZCBoYXZlIGJlZW4gMHg0MDAKClRoZSB1bmRlcmx5aW5nIG1lbW9yeSBtYXBwaW5nIGNlcnRhaW5s
eSBkb2VzIHdoYXQgaXMgYmVzdCwgc28gSSB3b3VsZCAKY2xpbmcgdG8gYmVpbmcgdGhlIGNsb3Nl
c3QgdG8gbGFzdCByZWdpc3RlciBkZXNjcmliZWQuIFNvIHlvdXIgMHgzMDAgCnZhbHVlIGxvb2tz
IHZlcnkgZ29vZCB0byBtZS4KCkJlc3QgcmVnYXJkcywKICAgTmljb2xhcwoKPiAobmV4dCBwb3dl
ciBvZiAyIGNvbnNpZGVyaW5nIHRoZSBtZW1vcnkgcmVnaW9uIGFsaWdubWVudCksIHVzaW5nIDB4
MTAwMAo+IGlzIGFsc28gYWNjZXB0YWJsZS4gUGxlYXNlIGFkdmlzZSB3aGljaCB2YWx1ZSBpcyBw
cmVmZXJyZWQuCj4gCj4+IFRoYW5rIHlvdSwKPj4gQ2xhdWRpdQo+Pgo+PiBbMV0KPj4gaHR0cHM6
Ly93dzEubWljcm9jaGlwLmNvbS9kb3dubG9hZHMvYWVtRG9jdW1lbnRzL2RvY3VtZW50cy9NUFUz
Mi9Qcm9kdWN0RG9jdW1lbnRzL0RhdGFTaGVldHMvU0FNQTdENi1TZXJpZXMtRGF0YS1TaGVldC1E
UzYwMDAxODUxLnBkZgo+Pgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDEwNSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrcyA9IDwmcG1j
IFBNQ19UWVBFX1BFUklQSEVSQUwgMTA1PiwgPCZwbWMKPj4+IFBNQ19UWVBFX0dDSyAxMDU+Owo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdHVzID0gImRp
c2FibGVkIjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4+ICDCoMKgwqDCoMKg
IH07Cj4+PiAgwqAgfTsKPj4KPiAKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1p
M2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWkzYwo=
