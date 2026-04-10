Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2F8EA3C5C
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Apr 2026 10:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ruRoKX9aCvmQ6kubXVHbr2yyXx325WBaxIfvE8Pk3l4=; b=G8WAR0ZY8zzn7W
	9lodNVLAQ7XRubNbwABPs06S40IzUmobyGdiFUO757sylm8HV2447hX+gthj56xFgGzBa4l7A31YG
	kB2JrWRkA9NgyNsoKoEObAyvMAp8JK5SJhCsf1FSo4ANdmM8RuVl6LzyijrEZSlpXfNY/3lzWvpFY
	EQ3DMJ3bUwb1laZ+iK+O/boFS3pE/kcWN/XsynoZ0VjemNSXCVnsCgc29gQSdER7d45UrNe5n0P5g
	voiYDAOyuK891o9JKVtArk1Z+tvHnX5mNWXDq78nVEmuBh9GB2LypntGQES8yR6Rm3XfwttqfdlXR
	FIib4NOyjM5MGBRWG/9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9Yl-0000000C2yR-0QMi;
	Fri, 10 Apr 2026 10:57:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9Yj-0000000C2yA-0rVw
	for linux-i3c@lists.infradead.org;
	Fri, 10 Apr 2026 10:57:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A54B76091C
	for <linux-i3c@lists.infradead.org>; Fri, 10 Apr 2026 10:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55A25C2BCB3
	for <linux-i3c@lists.infradead.org>; Fri, 10 Apr 2026 10:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775818676;
	bh=J3SSveqiYGEqaxrur6FeuF/gwWkfkw7ff6t1aPxNYSY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Dwgpam1tEIdD4KfA38GLrh/kCplxbb1sZsi4kWDQOVcU/0tTUe7m3eJfuAhJoxuL8
	 T4LIl+2KPAKpNfHPRFX1+r3S1hkiuvyBRKmDLRwYzdiF0X0Og19SVk3GWo37y4SATU
	 mW3PETNmvpIUJC7kp/v1kwQ+XZC8FkAe3eY6Fb5OcbWVKOVWYycieZhIvDcNFMoRRL
	 JjSkC6RPc+SrMyKSQUw6wl29bjk7KHlO0NFKIH6XkOBhx60Hpl/II1R7jaNNPWfTPU
	 lmId3dYTXb8I9MIWozUoe3Dyr845RD3njfWukCSDjMMv9wo+kFdSj/9WDqaFbxSg26
	 itFG9fN30+Uew==
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7dbce74e537so1417934a34.1
        for <linux-i3c@lists.infradead.org>; Fri, 10 Apr 2026 03:57:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdGfw8X6lmPpW3dlpwq28vADk6W59bA13oJAfQvli+L1dYn+d4sCOg/xqPTTLkC3gyhBAOBK4dyoo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwufJvapNwu/XFTgIPgpTKrhu8B2OCZUTZzmp5lNzVdCe+eyuNM
	rY7xKoIIrp2BRUTvS2uzuPS+jTU58W5nItqmviBj5d9owdIHU+XYoqazGjMtwUcb55Ua01zQhuq
	jWmlfXbVkFentKX8zrH2iJjHuL1pj33k=
X-Received: by 2002:a05:6820:328d:b0:682:fa66:61cb with SMTP id
 006d021491bc7-68be7ee1e4emr834163eaf.41.1775818675345; Fri, 10 Apr 2026
 03:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
 <20260409105747.48158-3-akhilrajeev@nvidia.com> <adhalQxfbMsL3V0T@lizhi-Precision-Tower-5810>
In-Reply-To: <adhalQxfbMsL3V0T@lizhi-Precision-Tower-5810>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Apr 2026 12:57:43 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jKZJg3Yh6OYiKncipT-47N0o0QLniPtj4NO+ojmsJ1rQ@mail.gmail.com>
X-Gm-Features: AQROBzAjJeCEEVSt2XY1F7M-MV9mizZ42mbvlFT3Shx19xZYzF_yLub_Mz-tACQ
Message-ID: <CAJZ5v0jKZJg3Yh6OYiKncipT-47N0o0QLniPtj4NO+ojmsJ1rQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] ACPICA: Read LVR from the I2C resource descriptor
To: Frank Li <Frank.li@nxp.com>
Cc: Akhil R <akhilrajeev@nvidia.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Eric Biggers <ebiggers@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, linux-i3c@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
	linux-hwmon@vger.kernel.org
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

T24gRnJpLCBBcHIgMTAsIDIwMjYgYXQgNDowNOKAr0FNIEZyYW5rIExpIDxGcmFuay5saUBueHAu
Y29tPiB3cm90ZToKPgo+IE9uIFRodSwgQXByIDA5LCAyMDI2IGF0IDA0OjI3OjMyUE0gKzA1MzAs
IEFraGlsIFIgd3JvdGU6Cj4gPiBBQ1BJIDYuMyBzcGVjaWZpZXMgYnl0ZSA4IG9mIEkyQyBTZXJp
YWwgQnVzIENvbm5lY3Rpb24gZGVzY3JpcHRvciB0byBiZQo+ID4gdXNlZCBmb3IgTGVnYWN5IFZp
cnR1YWwgUmVnaXN0ZXIgKExWUikgZGF0YSBhcyBzcGVjaWZpZWQgaW4gdGhlIE1JUEkKPiA+IEkz
QyBTcGVjaWZpY2F0aW9uIGZvciBhbiBJMkMgZGV2aWNlIGNvbm5lY3RlZCB0byBhbiBJM0MgSG9z
dCBDb250cm9sbGVyLgo+ID4gTFZSIHdpbGwgYmUgcmVhZCBieSBJM0MgaG9zdCBjb250cm9sbGVy
IGRyaXZlcnMgYW5kIGl0IHByb3ZpZGVzIGRldGFpbHMKPiA+IGFib3V0IHRoZSBzcGVjaWZpYyBz
cGVlZCBhbmQgNTBucyBzcGlrZSBmaWx0ZXIgY2FwYWJpbGl0aWVzIG9mIEkyQwo+ID4gZGV2aWNl
cy4KPiA+Cj4gPiBVcGRhdGUgdGhlIHJzY29udmVydF9pbmZvIHRvIGluY2x1ZGUgdGhpcyBmaWVs
ZC4gRm9yIEkyQyBkZXZpY2VzIG9uIGFuCj4gPiBJMkMgYnVzLCB0aGlzIGZpZWxkIGlzIFJlc2Vy
dmVkIGFuZCB1bnVzZWQuCj4gPgo+ID4gVGhpcyBjb21taXQgaXMgdGhlIHJlc3VsdCBvZiBzcXVh
c2hpbmcgdGhlIGZvbGxvd2luZzoKPiA+IEFDUElDQSBjb21taXQgNzAwODJkYzhmYzg0NzY3M2Fj
N2Y0YmJiMTU0MTc3NjczMGYwYjYzZQo+ID4gQUNQSUNBIGNvbW1pdCBlNjJlNzRiYWY3ZTA4Y2Yw
NTllYzgyMDQ5YWVjY2Q1NjViMjRkNjYxCj4gPiBBQ1BJQ0EgY29tbWl0IGM0MDQxMTgyMzUxMDgw
MTJjYWQzOTZjODM0YjVhYWJlMmRkMWI1MWEKPiA+IEFDUElDQSBjb21taXQgNzY1MGQ0YTg4OWVh
NzkwNzA2MGJmY2U4OWY0Zjc4MGNlODNlN2IyOAo+ID4gQUNQSUNBIGNvbW1pdCAwMTRmYTlmMmRi
Y2M2YjFiZDQyYTRhNGE2ZjY3MDVkOWNmN2Q0NjBiCj4KPiBUaGVzZSBjb21taXQgbnVtYmVyIGlz
IG5vdCBleGlzdGVkIGF0IGxpbnVzIG9mZmljaWFsIHRyZWUuIFBsZWFzZSByZW1vdmUgaXQuCgpU
aGVzZSBhcmUgdXBzdHJlYW0gQUNQSUNBIGNvbW1pdHMgYW5kIGl0IGlzIGVudGlyZWx5IGxlZ2l0
aW1hdGUgdG8KbWVudGlvbiB0aGVtIGluIGtlcm5lbCBjb21taXRzIHRvdWNoaW5nIEFDUElDQSBj
b2RlLgoKSG93ZXZlciwgTGluazogdGFncyBwb2ludGluZyB0byB0aG9zZSBjb21taXRzIHdvdWxk
IGJlIHN1ZmZpY2llbnQuCgo+ID4KPiA+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9hY3BpY2Ev
YWNwaWNhL2NvbW1pdC83MDA4MmRjOAo+ID4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL2FjcGlj
YS9hY3BpY2EvY29tbWl0L2IzYzM4ZGM5Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBa2hpbCBSIDxha2hp
bHJhamVldkBudmlkaWEuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9hY3BpL2FjcGljYS9yc3Nl
cmlhbC5jIHwgNiArKysrKy0KPiA+ICBpbmNsdWRlL2FjcGkvYWNyZXN0eXAuaCAgICAgICAgfCAx
ICsKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvYWNwaWNhL3Jzc2VyaWFsLmMgYi9kcml2
ZXJzL2FjcGkvYWNwaWNhL3Jzc2VyaWFsLmMKPiA+IGluZGV4IDI3OWJmYTI3ZGE5NC4uYzA2ZTkx
OGFiODg5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9hY3BpL2FjcGljYS9yc3NlcmlhbC5jCj4g
PiArKysgYi9kcml2ZXJzL2FjcGkvYWNwaWNhL3Jzc2VyaWFsLmMKPiA+IEBAIC0zMTUsNyArMzE1
LDcgQEAgc3RydWN0IGFjcGlfcnNjb252ZXJ0X2luZm8gYWNwaV9yc19jb252ZXJ0X2NzaTJfc2Vy
aWFsX2J1c1sxNF0gPSB7Cj4gPiAgICoKPiA+ICAgKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLwo+ID4K
PiA+IC1zdHJ1Y3QgYWNwaV9yc2NvbnZlcnRfaW5mbyBhY3BpX3JzX2NvbnZlcnRfaTJjX3Nlcmlh
bF9idXNbMTddID0gewo+ID4gK3N0cnVjdCBhY3BpX3JzY29udmVydF9pbmZvIGFjcGlfcnNfY29u
dmVydF9pMmNfc2VyaWFsX2J1c1sxOF0gPSB7Cj4gPiAgICAgICB7QUNQSV9SU0NfSU5JVEdFVCwg
QUNQSV9SRVNPVVJDRV9UWVBFX1NFUklBTF9CVVMsCj4gPiAgICAgICAgQUNQSV9SU19TSVpFKHN0
cnVjdCBhY3BpX3Jlc291cmNlX2kyY19zZXJpYWxidXMpLAo+ID4gICAgICAgIEFDUElfUlNDX1RB
QkxFX1NJWkUoYWNwaV9yc19jb252ZXJ0X2kyY19zZXJpYWxfYnVzKX0sCj4gPiBAQCAtMzkxLDYg
KzM5MSwxMCBAQCBzdHJ1Y3QgYWNwaV9yc2NvbnZlcnRfaW5mbyBhY3BpX3JzX2NvbnZlcnRfaTJj
X3NlcmlhbF9idXNbMTddID0gewo+ID4gICAgICAgIEFNTF9PRkZTRVQoaTJjX3NlcmlhbF9idXMu
dHlwZV9zcGVjaWZpY19mbGFncyksCj4gPiAgICAgICAgMH0sCj4gPgo+ID4gKyAgICAge0FDUElf
UlNDX01PVkU4LCBBQ1BJX1JTX09GRlNFVChkYXRhLmkyY19zZXJpYWxfYnVzLmx2ciksCj4gPiAr
ICAgICAgQU1MX09GRlNFVChpMmNfc2VyaWFsX2J1cy50eXBlX3NwZWNpZmljX2ZsYWdzKSArIDEs
Cj4gPiArICAgICAgMX0sCj4gPiArCj4gPiAgICAgICB7QUNQSV9SU0NfTU9WRTMyLCBBQ1BJX1JT
X09GRlNFVChkYXRhLmkyY19zZXJpYWxfYnVzLmNvbm5lY3Rpb25fc3BlZWQpLAo+ID4gICAgICAg
IEFNTF9PRkZTRVQoaTJjX3NlcmlhbF9idXMuY29ubmVjdGlvbl9zcGVlZCksCj4gPiAgICAgICAg
MX0sCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9hY3BpL2FjcmVzdHlwLmggYi9pbmNsdWRlL2Fj
cGkvYWNyZXN0eXAuaAo+ID4gaW5kZXggODQyZjkzMmUyYzJiLi4zOGExOWIxZDE5YWMgMTAwNjQ0
Cj4gPiAtLS0gYS9pbmNsdWRlL2FjcGkvYWNyZXN0eXAuaAo+ID4gKysrIGIvaW5jbHVkZS9hY3Bp
L2FjcmVzdHlwLmgKPiA+IEBAIC00MjMsNiArNDIzLDcgQEAgc3RydWN0IGFjcGlfcmVzb3VyY2Vf
aTJjX3NlcmlhbGJ1cyB7Cj4gPiAgICAgICBBQ1BJX1JFU09VUkNFX1NFUklBTF9DT01NT04gdTgg
YWNjZXNzX21vZGU7Cj4gPiAgICAgICB1MTYgc2xhdmVfYWRkcmVzczsKPiA+ICAgICAgIHUzMiBj
b25uZWN0aW9uX3NwZWVkOwo+ID4gKyAgICAgdTggbHZyOwo+ID4gIH07Cj4gPgo+ID4gIC8qIFZh
bHVlcyBmb3IgYWNjZXNzX21vZGUgZmllbGQgYWJvdmUgKi8KPiA+IC0tCj4gPiAyLjUwLjEKPiA+
Cj4KCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNj
Cg==
