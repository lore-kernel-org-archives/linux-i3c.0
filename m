Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9BECAC5AA
	for <linux-i3c@archiver.kernel.org>; Thu, 25 Sep 2025 08:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1W6UjqsrQ+5FMdlGyCAJXfK4GHSVikucpcL2q0m9yI=; b=SEjYhUSFAcbKyS
	u+Xp/3tECyGYRTUzC72eG98oWfvwhRGx2QCSD4Pu/pIMLkbyMzj6q/uEIEBQecDql3EI8AD++2Awm
	sXRIP9wbVtgiSWw8kfWbRL2Kvi/iq6VhsuZ9kWJ4dzJUNzF9pG5ridJha2bKIfkiDxb3YvwjCE9Mq
	sYl9AwOL8ON5ix8YaqBUvRechhRx0K8dimew/TjsHuY2CoUy0xnp5sxKNu6XoEDrqRi49/OSv94CK
	qL9+pfU2ABpnOIvz017hG4GVP+gf7N+3v9Nc64fBAH9ds+6lv/BZcu5wcNX8QpUh5AY5D3MHNws7X
	9ImUWbEUh2HG0k/yCprg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1hnJ-00000007LiK-3gd7;
	Thu, 25 Sep 2025 08:57:41 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1hnH-00000007Lfg-0a1B
	for linux-i3c@lists.infradead.org;
	Thu, 25 Sep 2025 08:57:40 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-46b7bf21fceso4557195e9.3
        for <linux-i3c@lists.infradead.org>; Thu, 25 Sep 2025 01:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758790657; x=1759395457; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JDV6lQyFHzUzwoPhPLVE57nzZPLAlDFfGvCbbrW4Ng0=;
        b=AoE84JJRUsCC19XRQLIH3XdtaagA0so6F+mZnTGECvEuTJ5FDjRCkuyyhtS8zwISsM
         gmkK4jitrqp2c2dRS4Sk8B0wVOz4XBjhVRpWJz3ulfEXZYUtkZPtIJhYsGFRhFTlZ6Xl
         KbSH64dsqYKv7b5SfT+/mYc/1MidInxxq8zyb9z/mxg7XWi3myl1vNNvrxOojA7WfHaH
         wP8WTTu/yozDThPSh91A16DxdTg3gTsECB5dJdfaQVF/9aGu+emNVSQnRiwPQrSAhiQe
         NzFunaTHTtiExaYQG80JDMe+6VkRyZM0JHvuY8jzDk5GOPi15/vKwYLFX/26nKDnDXJ4
         W0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758790657; x=1759395457;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JDV6lQyFHzUzwoPhPLVE57nzZPLAlDFfGvCbbrW4Ng0=;
        b=nq+UtJ3Wxs+aXragGkgjNy1195O6fxc90Cd5OOs3ph+O+B72wH2UsFN2zK/aY9wzzU
         UryGGRMulBfWUZzz4SGP9bvj7sBfMEdEBoMwh1Y1OEfHP3oGW8I0iCzFzm3mEmihf7kK
         5jGmDPHsaUEHXcZrnK+8YaBl39xm0yga9H+WH2H0RDwAKfbdzLOF7tPId0IZE9v3wN+J
         ftIlQ127vAjPOi1hWNJPwLBcSdCe5uq9AufOi7OhmAMM0SOLfkEoz1ChSfIHyc6WDfRS
         ysUt9K0UR4170QOFJeCix/dymWzMF5CY6v0EXLc9Mh1XVhWiC0o4qeyjW7Mrnbb2bUR3
         PXOA==
X-Forwarded-Encrypted: i=1; AJvYcCX9YZ8jigsTtLTvaiwdoecmBX0l6YCzAlgk6VhDT6m1pykTtuk+qrNx0kwsZHojlKhOyxu60atvdm4=@lists.infradead.org
X-Gm-Message-State: AOJu0YynoNEL027zBTQ4NEK+fqef22USv7UqsDuDlZlz3ywZPGuttGbR
	wh2Jaq4lC1ILgfHOdYivwy19JbCSGDpuyozcuKYKEGOH/GS/Gl7QRcTh
X-Gm-Gg: ASbGncsoLbwOjuKFLixyobPkZ6t6s89kEY04dp4075x27tcLoSh4YEOHQF+S/hHEHhE
	fdx4fqobuoe3xeVH4pgOfztkigMchCl80uw2yVsINTAtk0gsPQSL73In4uD7n/fdrXrU+MWq3kc
	hx9GY554Ka1IAFHZHDhBb/WS50USglDBmk9qT1sNzlFftojJ9AoWzTG1NEKUbUhrdLhM+ebUXiC
	IT35NfAEFnj7FuXIxIWEqwKG4LLlpfuUnhXPDIHG065blKxhuSb9kHki+8jcL7nuD4tczet/KBB
	WYNhHxjdI9l0VxWRdQsx348LvDytl7/Hx+twGQL74HtK5BXM9AKkEVN3AvWKiej5r7jEhTRXIgM
	RGU1gi6TWHf54dhkfbx6lZrEf1/00QPk=
X-Google-Smtp-Source: AGHT+IFwc/ogQyexaRhKy29O42WYdUKH6a2Y0I5hHzY/tZTegkQSMJsUIpoh57przGHqAXOZ2bO9Og==
X-Received: by 2002:a05:600c:310c:b0:46e:21c8:ad37 with SMTP id 5b1f17b1804b1-46e35d550acmr11127985e9.25.1758790657222;
        Thu, 25 Sep 2025 01:57:37 -0700 (PDT)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb72fb2eesm2188803f8f.12.2025.09.25.01.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 01:57:36 -0700 (PDT)
Message-ID: <e5a6789230840b31ef0f60ca0a770a4fb266da2a.camel@gmail.com>
Subject: Re: [PATCH] [v2] i3c: fix big-endian FIFO transfers
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>, Jorge Marques
	 <gastmaier@gmail.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jorge Marques	
 <jorge.marques@analog.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  Frank Li <Frank.Li@nxp.com>, Arnd
 Bergmann <arnd@arndb.de>, "linux-i3c@lists.infradead.org"	
 <linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>, "Simek,
 Michal" <michal.simek@amd.com>
Date: Thu, 25 Sep 2025 09:58:04 +0100
In-Reply-To: <DM4PR12MB61093CEE50990ECC403D3FB98C1FA@DM4PR12MB6109.namprd12.prod.outlook.com>
References: <20250924201837.3691486-1-arnd@kernel.org>
		 <2wtpklapw5ogsevuvk2l4ngvw7hymer2y4cc454h47u2d7tq44@4mknmpk5yzil>
		 <DM4PR12MB6109367F36487B582ED8EA968C1FA@DM4PR12MB6109.namprd12.prod.outlook.com>
	 <37d47af4f4d5220764efc5870630fdfc1e9be2c9.camel@gmail.com>
	 <DM4PR12MB61093CEE50990ECC403D3FB98C1FA@DM4PR12MB6109.namprd12.prod.outlook.com>
User-Agent: Evolution 3.58.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_015739_248355_91D03A15 
X-CRM114-Status: GOOD (  49.59  )
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

T24gVGh1LCAyMDI1LTA5LTI1IGF0IDA4OjQ3ICswMDAwLCBHdW50dXBhbGxpLCBNYW5pa2FudGEg
d3JvdGU6Cj4gW1B1YmxpY10KPiAKPiBIaSwKPiAKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tCj4gPiBGcm9tOiBOdW5vIFPDoSA8bm9uYW1lLm51bm9AZ21haWwuY29tPgo+ID4gU2VudDog
VGh1cnNkYXksIFNlcHRlbWJlciAyNSwgMjAyNSAxOjIyIFBNCj4gPiBUbzogR3VudHVwYWxsaSwg
TWFuaWthbnRhIDxtYW5pa2FudGEuZ3VudHVwYWxsaUBhbWQuY29tPjsgSm9yZ2UgTWFycXVlcwo+
ID4gPGdhc3RtYWllckBnbWFpbC5jb20+OyBBcm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5lbC5vcmc+
Cj4gPiBDYzogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29t
PjsgSm9yZ2UgTWFycXVlcwo+ID4gPGpvcmdlLm1hcnF1ZXNAYW5hbG9nLmNvbT47IFdvbGZyYW0g
U2FuZyA8d3NhK3JlbmVzYXNAc2FuZy0KPiA+IGVuZ2luZWVyaW5nLmNvbT47IEZyYW5rIExpIDxG
cmFuay5MaUBueHAuY29tPjsgQXJuZCBCZXJnbWFubgo+ID4gPGFybmRAYXJuZGIuZGU+OyBsaW51
eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZzsKPiA+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IGdpdAo+ID4gKEFNRC1YaWxpbngpIDxnaXRAYW1kLmNvbT47IFNpbWVrLCBNaWNoYWwgPG1p
Y2hhbC5zaW1la0BhbWQuY29tPgo+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gW3YyXSBpM2M6IGZp
eCBiaWctZW5kaWFuIEZJRk8gdHJhbnNmZXJzCj4gPiAKPiA+IE9uIFRodSwgMjAyNS0wOS0yNSBh
dCAwNzozNyArMDAwMCwgR3VudHVwYWxsaSwgTWFuaWthbnRhIHdyb3RlOgo+ID4gPiBbUHVibGlj
XQo+ID4gPiAKPiA+ID4gSGksCj4gPiA+IAo+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tCj4gPiA+ID4gRnJvbTogSm9yZ2UgTWFycXVlcyA8Z2FzdG1haWVyQGdtYWlsLmNvbT4KPiA+
ID4gPiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDI1LCAyMDI1IDEyOjQ3IFBNCj4gPiA+ID4g
VG86IEFybmQgQmVyZ21hbm4gPGFybmRAa2VybmVsLm9yZz4KPiA+ID4gPiBDYzogQWxleGFuZHJl
IEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPjsgSm9yZ2UgTWFycXVlcwo+
ID4gPiA+IDxqb3JnZS5tYXJxdWVzQGFuYWxvZy5jb20+OyBXb2xmcmFtIFNhbmcgPHdzYStyZW5l
c2FzQHNhbmctCj4gPiA+ID4gZW5naW5lZXJpbmcuY29tPjsgRnJhbmsgTGkgPEZyYW5rLkxpQG54
cC5jb20+OyBBcm5kIEJlcmdtYW5uCj4gPiA+ID4gPGFybmRAYXJuZGIuZGU+OyBHdW50dXBhbGxp
LCBNYW5pa2FudGEKPiA+ID4gPiA8bWFuaWthbnRhLmd1bnR1cGFsbGlAYW1kLmNvbT47Cj4gPiA+
ID4gbGludXgtCj4gPiA+ID4gaTNjQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmcKPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIXSBbdjJdIGkzYzogZml4
IGJpZy1lbmRpYW4gRklGTyB0cmFuc2ZlcnMKPiA+ID4gPiAKPiA+ID4gPiBPbiBXZWQsIFNlcCAy
NCwgMjAyNSBhdCAxMDoxODozM1BNICswMjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4gPiA+
ID4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiA+ID4gPiA+IAo+ID4gPiA+
ID4gU2hvcnQgTU1JTyB0cmFuc2ZlcnMgdGhhdCBhcmUgbm90IGEgbXVsdGlwbGUgb2YgZm91ciBi
eXRlcyBpbiBzaXplCj4gPiA+ID4gPiBuZWVkIGEgc3BlY2lhbCBjYXNlIGZvciB0aGUgZmluYWwg
Ynl0ZXMsIGhvd2V2ZXIgdGhlIGV4aXN0aW5nCj4gPiA+ID4gPiBpbXBsZW1lbnRhdGlvbiBpcyBu
b3QgZW5kaWFuLXNhZmUgYW5kIGludHJvZHVjZXMgYW4gaW5jb3JyZWN0Cj4gPiA+ID4gPiBieXRl
c3dhcCBvbiBiaWctZW5kaWFuIGtlcm5lbHMuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoaXMgdXN1
YWxseSBkb2VzIG5vdCBjYXVzZSBwcm9ibGVtcyBiZWNhdXNlIG1vc3Qgc3lzdGVtcyBhcmUKPiA+
ID4gPiA+IGxpdHRsZS1lbmRpYW4gYW5kIG1vc3QgdHJhbnNmZXJzIGFyZSBtdWx0aXBsZSBvZiBm
b3VyIGJ5dGVzIGxvbmcsCj4gPiA+ID4gPiBidXQgc3RpbGwgbmVlZHMgdG8gYmUgZml4ZWQgdG8g
YXZvaWQgdGhlIGV4dHJhIGJ5dGVzd2FwLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBDaGFuZ2UgdGhl
IHNwZWNpYWwgY2FzZSBmb3IgYm90aCBpM2Nfd3JpdGVsX2ZpZm8oKSBhbmQKPiA+ID4gPiA+IGkz
Y19yZWFkbF9maWZvKCkgdG8gdXNlIG5vbi1ieXRlc3dhcHBpbmcgd3JpdGVzbCgpIGFuZCByZWFk
c2woKQo+ID4gPiA+ID4gd2l0aCBhIHNpbmdsZSBlbGVtZW50IGluc3RlYWQgb2YgdGhlIGJ5dGVz
d2FwcGluZyB3cml0ZWwoKS9yZWFkbCgpCj4gPiA+ID4gPiB0aGF0IGFyZSBtZWFudCBmb3IgaW5k
aXZpZHVhbCBNTUlPIHJlZ2lzdGVycy4gQXMgZGF0YSBpcyBjb3BpZWQKPiA+ID4gPiA+IGJldHdl
ZW4gYSBGSUZPIGFuZCBhIG1lbW9yeSBidWZmZXIsIHRoZSB3cml0ZXNsKCkvcmVhZHNsKCkgbG9v
cHMKPiA+ID4gPiA+IGFyZSB0eXBpY2FsbHkgYmFzZWQgb24gX19yYXdfcmVhZGwoKS8gX19yYXdf
d3JpdGVsKCksIHJlc3VsdGluZyBpbgo+ID4gPiA+ID4gdGhlIG9yZGVyIG9mIGJ5dGVzIGluIHRo
ZSBGSUZPIHRvIG1hdGNoIHRoZSBvcmRlciBpbiB0aGUgYnVmZmVyLAo+ID4gPiA+ID4gcmVnYXJk
bGVzcyBvZiB0aGUgQ1BVIGVuZGlhbmVzcy4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhlIGVhcmxp
ZXIgdmVyc2lvbnMgaW4gdGhlIGR3LWkzYyBhbmQgaTNjLW1hc3Rlci1jZG5zIGhhZCBhCj4gPiA+
ID4gPiBjb3JyZWN0IGltcGxlbWVudGF0aW9uLCBidXQgdGhlIGdlbmVyaWMgdmVyc2lvbiB0aGF0
IHdhcyByZWNlbnRseQo+ID4gPiA+ID4gYWRkZWQgYnJva2UKPiA+IGl0Lgo+ID4gPiA+ID4gCj4g
PiA+ID4gPiBGaXhlczogNzMzYjQzOTM3NWI0ICgiaTNjOiBtYXN0ZXI6IEFkZCBpbmxpbmUgaTNj
X3JlYWRsX2ZpZm8oKSBhbmQKPiA+ID4gPiA+IGkzY193cml0ZWxfZmlmbygpIikKPiA+ID4gPiA+
IENjOiBNYW5pa2FudGEgR3VudHVwYWxsaSA8bWFuaWthbnRhLmd1bnR1cGFsbGlAYW1kLmNvbT4K
PiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4g
PiA+ID4gPiAtLS0KPiA+ID4gPiA+IFRoaXMgd2FzIGEgcmVjZW50IHJlZ3Jlc3Npb24sIHRoZSB2
ZXJzaW9uIGluIDYuMTYgc3RpbGwgd29ya3MsIGJ1dAo+ID4gPiA+ID4gNi4xNy1yYyBpcyBicm9r
ZW4uCj4gPiA+ID4gPiAKPiA+ID4gPiA+IHYyIGNoYW5nZXM6Cj4gPiA+ID4gPiDCoC0gYWRkIGNv
ZGUgY29tbWVudHMKPiA+ID4gPiA+IMKgLSB3cml0ZSBjb3JyZWN0IGRhdGEgYnVmZmVyCj4gPiA+
ID4gPiAtLS0KPiA+ID4gPiA+IMKgZHJpdmVycy9pM2MvaW50ZXJuYWxzLmggfCAxMiArKysrKysr
KysrLS0KPiA+ID4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4gPiA+ID4gPiAKPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9p
bnRlcm5hbHMuaCBiL2RyaXZlcnMvaTNjL2ludGVybmFscy5oCj4gPiA+ID4gPiBpbmRleCAwZDg1
N2NjNjhjYzUuLjc5Y2VhYTVmNWFmZCAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvaTNj
L2ludGVybmFscy5oCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2kzYy9pbnRlcm5hbHMuaAo+ID4g
PiA+ID4gQEAgLTM4LDcgKzM4LDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBpM2Nfd3JpdGVsX2Zp
Zm8odm9pZCBfX2lvbWVtCj4gPiA+ID4gPiAqYWRkciwgY29uc3QKPiA+ID4gPiB2b2lkICpidWYs
Cj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHUzMiB0bXAgPSAwOwo+ID4gPiA+ID4g
Cj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1lbWNweSgmdG1wLCBidWYgKyAobmJ5
dGVzICYgfjMpLCBuYnl0ZXMgJiAzKTsKPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoCB3
cml0ZWwodG1wLCBhZGRyKTsKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKgo+ID4g
PiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiB3cml0ZXNsKCkgaW5zdGVhZCBvZiB3cml0
ZWwoKSB0byBrZWVwIEZJRk8KPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogYnl0
ZW9yZGVyIG9uIGJpZy1lbmRpYW4gdGFyZ2V0cwo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKi8KPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCB3cml0ZXNsKGFkZHIsICZ0
bXAsIDEpOwo+ID4gPiA+ID4gwqDCoMKgIH0KPiA+ID4gPiA+IMKgfQo+ID4gPiA+ID4gCj4gPiA+
ID4gPiBAQCAtNTUsNyArNTksMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIGkzY19yZWFkbF9maWZv
KGNvbnN0IHZvaWQKPiA+ID4gPiA+IF9faW9tZW0gKmFkZHIsCj4gPiA+ID4gdm9pZCAqYnVmLAo+
ID4gPiA+ID4gwqDCoMKgIGlmIChuYnl0ZXMgJiAzKSB7Cj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHUzMiB0bXA7Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoCB0bXAgPSByZWFkbChhZGRyKTsKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCAv
Kgo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiByZWFkc2woKSBpbnN0ZWFkIG9m
IHJlYWRsKCkgdG8ga2VlcCBGSUZPCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAq
IGJ5dGVvcmRlciBvbiBiaWctZW5kaWFuIHRhcmdldHMKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICovCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVhZHNsKGFkZHIs
ICZ0bXAsIDEpOwo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZW1jcHkoYnVmICsg
KG5ieXRlcyAmIH4zKSwgJnRtcCwgbmJ5dGVzICYgMyk7Cj4gPiA+ID4gPiDCoMKgwqAgfQo+ID4g
PiA+ID4gwqB9Cj4gPiA+ID4gUmV2aWV3ZWQtYnk6IEpvcmdlIE1hcnF1ZXMgPGpvcmdlLm1hcnF1
ZXNAYW5hbG9nLmNvbT4KPiA+ID4gPiA+IC0tCj4gPiA+ID4gPiAyLjM5LjUKPiA+ID4gPiA+IAo+
ID4gPiAKPiA+ID4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgc3ViLXdvcmQgdHJhbnNmZXIgY2FzZSBv
biBiaWctZW5kaWFuIGtlcm5lbHMsIGJ1dAo+ID4gPiBpdCBzdGlsbCBkb2VzIG5vdCBhZGRyZXNz
IHRoZSBzY2VuYXJpbyBvZiBsaXR0bGUtZW5kaWFuIGtlcm5lbHMKPiA+ID4gYWNjZXNzaW5nIGJp
Zy0gZW5kaWFuIEZJRk9zLgo+ID4gPiAKPiA+IAo+ID4gSSB3b3VsZCBhcmd1ZSB0aGF0J3Mgc29t
ZXRoaW5nIGZvciBjYWxsZXJzIG9mIHRoZXNlIGZ1bmN0aW9ucyB0byBjYXJlIGFib3V0Lgo+IElm
IGVhY2ggSTNDIGRyaXZlciBoYXMgdG8gaGFuZGxlIEZJRk8gZW5kaWFubmVzcyBpbmRpdmlkdWFs
bHksIGl0IGludHJvZHVjZXMKPiB1bm5lY2Vzc2FyeSBkdXBsaWNhdGlvbiBhbmQgb3ZlcmhlYWQg
YWNyb3NzIGRyaXZlcnMuIENlbnRyYWxpemluZyB0aGlzIGluIHRoZQo+IEZJRk8gYWNjZXNzIGhl
bHBlcnMga2VlcHMgdGhlIGxvZ2ljIGNvbnNpc3RlbnQsIGF2b2lkcyByZXBlYXRlZCBib2lsZXJw
bGF0ZSwKPiBhbmQgcmVkdWNlcyB0aGUgY2hhbmNlIG9mIHN1YnRsZSBidWdzLgoKSSBtZWFuLCB0
aGF0J3Mgd2hhdCBzcGkgYW5kIGkyYyBkcml2ZXJzIGRvIGFscmVhZHkuwqBXaXRoIGVudW0gaTNj
X2ZpZm9fZW5kaWFuCnlvdSdyZSBhbHJlYWR5IGZvcmNpbmcgdXNlcnMgdG8gY2FyZSAob3Iga25v
dykgYWJvdXQgZW5kaWFuaXNtIHNvIHRoZXkgbWlnaHQgYXMKd2VsbCBqdXN0IHBhc3MgdGhlIGRh
dGEgaW4gdGhlIHByb3BlciBvcmRlciBhbHJlYWR5IChub3Qgc3VyZSBpZiBpdCdzIHN1Y2ggYSBi
aWcKJ2J1cmRlbicpLgoKVGhhdCBzYWlkLCBJJ20gbm90IHJlYWxseSBpbiB0aGUgbG9vcCBmb3Ig
aTNjIHNvIG5vdCBzdXJlIHdoYXQgdGhlIGV4cGVjdGF0aW9ucwphcmUuIElPVywgaGF2ZSBubyBz
dHJvbmcgZmVlbGluZyBhYm91dCB0aGlzIGF0IGFsbCA6KQoKLSBOdW5vIFPDoQoKPiA+IAo+ID4g
PiBXaXRoIHRoZSBjdXJyZW50IHZlcnNpb24sIGkzY193cml0ZWxfZmlmbygpIGFuZCBpM2NfcmVh
ZGxfZmlmbygpIG9ubHkKPiA+ID4gd29yayB3aGVuIHRoZSBGSUZPIGhhcyB0aGUgc2FtZSBlbmRp
YW5uZXNzIGFzIHRoZSBDUFUuIE9uIHBsYXRmb3Jtcwo+ID4gPiBzdWNoIGFzIHRoZQo+ID4gPiBa
Q1UxMDIgKFp5bnEgVWx0cmFTY2FsZSsgTVBTb0MsIENvcnRleC1BNTMsIGxpdHRsZS1lbmRpYW4p
LCB0aGUgSTNDCj4gPiA+IEZJRk9zIGFyZSBiaWctZW5kaWFuLCBhbmQgdGhpcyBwYXRjaCBhbG9u
ZSBpcyBub3Qgc3VmZmljaWVudCAtCj4gPiA+IHRyYW5zZmVycyBmYWlsIGluIHRoYXQgY29uZmln
dXJhdGlvbi4KPiA+ID4gCj4gPiA+IFdlIGhhdmUgdmFsaWRhdGVkIHRoaXMgb24gWkNVMTAyLCBh
bmQgdGhlIG1pc21hdGNoIGJldHdlZW4gTEUga2VybmVsCj4gPiA+IGFuZCBCRSBGSUZPIGlzIHN0
aWxsIGFuIGlzc3VlLgo+ID4gPiAKPiA+ID4gT24gdG9wIG9mIHRoaXMgZml4LCBleHBsaWNpdCBG
SUZPIGVuZGlhbm5lc3Mgc3VwcG9ydCBpcyByZXF1aXJlZCwgYXMKPiA+ID4gcHJvcG9zZWQgaW4g
W1BBVENIIHY3IDMvNF0gImkzYzogbWFzdGVyOiBBZGQgZW5kaWFubmVzcyBzdXBwb3J0IGZvcgo+
ID4gPiBpM2NfcmVhZGxfZmlmbygpIGFuZCBpM2Nfd3JpdGVsX2ZpZm8oKSIuIFRoYXQgYXBwcm9h
Y2ggYWRkcyBhbiBlbmRpYW4KPiA+ID4gYXJndW1lbnQgYW5kIHVzZXMKPiA+ID4gd3JpdGVzbF9i
ZSgpL3JlYWRzbF9iZSgpIHdoZXJlIG5lY2Vzc2FyeSwgZS5nLjoKPiA+ID4gCj4gPiA+IHN0YXRp
YyBpbmxpbmUgdm9pZCBpM2Nfd3JpdGVsX2ZpZm8odm9pZCBfX2lvbWVtICphZGRyLCBjb25zdCB2
b2lkCj4gPiA+ICpidWYsCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCBuYnl0ZXMsIGVudW0gaTNjX2Zp
Zm9fZW5kaWFuCj4gPiA+IGVuZGlhbikgewo+ID4gPiDCoMKgwqDCoMKgwqDCoCBpZiAoZW5kaWFu
KQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd3JpdGVzbF9iZShhZGRyLCBi
dWYsIG5ieXRlcyAvIDQpOwo+ID4gPiDCoMKgwqDCoMKgwqDCoCBlbHNlCj4gPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3cml0ZXNsKGFkZHIsIGJ1ZiwgbmJ5dGVzIC8gNCk7Cj4g
PiA+IAo+ID4gPiDCoMKgwqDCoMKgwqDCoCBpZiAobmJ5dGVzICYgMykgewo+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdTMyIHRtcCA9IDA7Cj4gPiA+IAo+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVtY3B5KCZ0bXAsIGJ1ZiArIChuYnl0ZXMgJiB+Myks
IG5ieXRlcyAmIDMpOwo+ID4gPiAKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGlmIChlbmRpYW4pCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgd3JpdGVzbF9iZShhZGRyLCAmdG1wLCAxKTsKPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGVsc2UKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB3cml0ZXNsKGFkZHIsICZ0bXAsIDEpOwo+ID4gPiDCoMKgwqDCoMKg
wqDCoCB9Cj4gPiA+IH0KPiA+ID4gCj4gPiA+IAo+IFRoYW5rcywKPiBNYW5pa2FudGEuCgotLSAK
bGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
