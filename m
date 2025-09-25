Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1100DCAC5AA
	for <linux-i3c@archiver.kernel.org>; Thu, 25 Sep 2025 07:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o4zS8qvSEiBeWaY1E8JDKuU+CZR+Ab+UDCpoqB8/8gQ=; b=iyYIGb+6jvDNEI
	I1ytmpWIl17t0DwHhf1M0xVscsWdSVCKA4QEM1GOhkJ/xf1wu773ZLrdUDiYgYkzuaxZ3+E/8dNk+
	xPhe5sgmLJRrrZVxue6mOiafGNZPXELbbzdRv6auU/p+ao80xfUWk6sMWN2TFSYKhIJMOtuZYG+Rq
	iiMDk75SsE2romp/cDTchljpWS4ByZ5NyaDRmZxbujo9ug5QpTkTDA/cYsuzmkMJSXd3oVQKnA8kE
	gc5XbrDHdejk1ztf8ksvMehp2KTcs0WS40HdYwn4rBjmVQjzaSPFoLFFs7PVN9nbFT5zO5NcCQ40t
	BFVBMoBccXHlKuBMWxgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1gkv-00000006sGj-3PwB;
	Thu, 25 Sep 2025 07:51:09 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1gkt-00000006sFW-19mu
	for linux-i3c@lists.infradead.org;
	Thu, 25 Sep 2025 07:51:08 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3f0134ccc0cso525658f8f.1
        for <linux-i3c@lists.infradead.org>; Thu, 25 Sep 2025 00:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758786665; x=1759391465; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8POI4Z8NIgZ9eWulLcxOFUXzrhQybf9IS1kQegq4pqU=;
        b=g++EGzdofp4Nnthrh7GWTNvgJHpwgD67UacznP+Aa/raUsMtSn1S131qTW5AhMcHBU
         yC9MdnEnYIDMsMFtaYPFakvm2opVu8iY7lkjC3bHc492weXHo1m7qso1cOPgOv6vO7CZ
         uWa2ytgwz9AdPD80s0LG/l4CzcLHQ3TusEPFkJzbKp1f1mucdYfVuUXFpvJpqaKne10V
         WJt+vtBUfgG7H0EM8qbx2i0lsaX/vvqK5bKej9bHPx/u3QFCUywOETTyc/O0Z5fEqW51
         nPC1Cdh+JiP9IB/03yfAX6QLqkjWqRku0Qb+gxXe8/gRNV3zEmSLANdyXraKZWIIvkD6
         CB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758786665; x=1759391465;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8POI4Z8NIgZ9eWulLcxOFUXzrhQybf9IS1kQegq4pqU=;
        b=eQKzzeygmM6SR5Sbrk4re9q22sVmoudaPzllT8aH/Mzo1k2lUIIv4bclnpeWRrfHjs
         jNV7vq4h27wpqsCg3MNoghXIXwM/WUQdhpzSk00xjtpv7XzFZnKyTf2coAHMs2cVouuE
         GVOi2Axise/za+zwrD7uQu1fAXMlM4PW7GE97Nuh2EUGUVQZQCbG+el984KKhr6YFIfp
         Y2CbM0dgivLxuHQfpcwVfUovdbE2z8b/5iUy4wNDV2hpajr5zD/0AAeJM8Y4U7KeYv0W
         cpEXe/MYz6hZ/9RA8aWUAgOZdtz4DJcajWoNznMhaKQrzmCdlq6EXnPgLhXap33jIZ/H
         EwRw==
X-Forwarded-Encrypted: i=1; AJvYcCU1BVaSHG9hv8hrNKfCbCWQorzmxcTdAmeCpSUu2uAI0uq7p/hqJQiJoKqr3xF/Ypg5rmUBgMABJgw=@lists.infradead.org
X-Gm-Message-State: AOJu0YymmcFNV0ZSjfIWkezI19x/oi97rIB/SDHzorxJ3/vEOfDAf3YQ
	KFMl2vkmVGYQKtpU2h22Yvbnej0PRXj0zXw8KtY/GgaskwLfNdh8Ck7k
X-Gm-Gg: ASbGnctc8EwWyOYMr/nolKpf+c3a4y9vcfKev1z3nP3kvF/fzDdrSJIWg/hw553ibG4
	fHE1SWrcB3HKrawaX8lB6a+CVPWXW33LZ+FNxPvljsh6InFEvQfpei+DJOvvND/9335x8Dp4m3V
	Y+od67/dKOLHnux03dRikwTKtuGrvcsBaLiBfC0OPR118U7PPTqi8eYVAfyr0k+iXGpNbOko6rd
	NWusWulDb/xO0xpXvpMhJSvKZoh1GBSPSOkrYx/N+4dJxPzp35QJF1XHReqHAFIDPjtNU4FAPVf
	mJ2cjJZmrRmJey6wpLAJOIon8yZivEIPMndreXOo9uN/vtGyPPifX7Dc9yDCsdFu4jZ2k7qJdxI
	Jo/+LXcgJObbYajhPc+zzGw==
X-Google-Smtp-Source: AGHT+IGUuGO0MctI5suTsLaRzPLAL3wVtTajfyppJ7wHXCpSF63TKkBkV3h0klrqzYRmhS5fxuQM5A==
X-Received: by 2002:a5d:5d84:0:b0:3ee:14e9:23d2 with SMTP id ffacd0b85a97d-40e447770abmr2010911f8f.8.1758786665164;
        Thu, 25 Sep 2025 00:51:05 -0700 (PDT)
Received: from [10.5.0.2] ([45.94.208.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2ab31f62sm64575345e9.15.2025.09.25.00.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 00:51:04 -0700 (PDT)
Message-ID: <37d47af4f4d5220764efc5870630fdfc1e9be2c9.camel@gmail.com>
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
Date: Thu, 25 Sep 2025 08:51:33 +0100
In-Reply-To: <DM4PR12MB6109367F36487B582ED8EA968C1FA@DM4PR12MB6109.namprd12.prod.outlook.com>
References: <20250924201837.3691486-1-arnd@kernel.org>
	 <2wtpklapw5ogsevuvk2l4ngvw7hymer2y4cc454h47u2d7tq44@4mknmpk5yzil>
	 <DM4PR12MB6109367F36487B582ED8EA968C1FA@DM4PR12MB6109.namprd12.prod.outlook.com>
User-Agent: Evolution 3.58.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_005107_356447_03093D1C 
X-CRM114-Status: GOOD (  39.61  )
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

T24gVGh1LCAyMDI1LTA5LTI1IGF0IDA3OjM3ICswMDAwLCBHdW50dXBhbGxpLCBNYW5pa2FudGEg
d3JvdGU6Cj4gW1B1YmxpY10KPiAKPiBIaSwKPiAKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tCj4gPiBGcm9tOiBKb3JnZSBNYXJxdWVzIDxnYXN0bWFpZXJAZ21haWwuY29tPgo+ID4gU2Vu
dDogVGh1cnNkYXksIFNlcHRlbWJlciAyNSwgMjAyNSAxMjo0NyBQTQo+ID4gVG86IEFybmQgQmVy
Z21hbm4gPGFybmRAa2VybmVsLm9yZz4KPiA+IENjOiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFu
ZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+OyBKb3JnZSBNYXJxdWVzCj4gPiA8am9yZ2UubWFycXVl
c0BhbmFsb2cuY29tPjsgV29sZnJhbSBTYW5nIDx3c2ErcmVuZXNhc0BzYW5nLQo+ID4gZW5naW5l
ZXJpbmcuY29tPjsgRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+OyBBcm5kIEJlcmdtYW5uCj4g
PiA8YXJuZEBhcm5kYi5kZT47IEd1bnR1cGFsbGksIE1hbmlrYW50YSA8bWFuaWthbnRhLmd1bnR1
cGFsbGlAYW1kLmNvbT47Cj4gPiBsaW51eC0KPiA+IGkzY0BsaXN0cy5pbmZyYWRlYWQub3JnOyBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIXSBbdjJd
IGkzYzogZml4IGJpZy1lbmRpYW4gRklGTyB0cmFuc2ZlcnMKPiA+IAo+ID4gT24gV2VkLCBTZXAg
MjQsIDIwMjUgYXQgMTA6MTg6MzNQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiA+ID4g
RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiA+ID4gCj4gPiA+IFNob3J0IE1N
SU8gdHJhbnNmZXJzIHRoYXQgYXJlIG5vdCBhIG11bHRpcGxlIG9mIGZvdXIgYnl0ZXMgaW4gc2l6
ZQo+ID4gPiBuZWVkIGEgc3BlY2lhbCBjYXNlIGZvciB0aGUgZmluYWwgYnl0ZXMsIGhvd2V2ZXIg
dGhlIGV4aXN0aW5nCj4gPiA+IGltcGxlbWVudGF0aW9uIGlzIG5vdCBlbmRpYW4tc2FmZSBhbmQg
aW50cm9kdWNlcyBhbiBpbmNvcnJlY3QgYnl0ZXN3YXAKPiA+ID4gb24gYmlnLWVuZGlhbiBrZXJu
ZWxzLgo+ID4gPiAKPiA+ID4gVGhpcyB1c3VhbGx5IGRvZXMgbm90IGNhdXNlIHByb2JsZW1zIGJl
Y2F1c2UgbW9zdCBzeXN0ZW1zIGFyZQo+ID4gPiBsaXR0bGUtZW5kaWFuIGFuZCBtb3N0IHRyYW5z
ZmVycyBhcmUgbXVsdGlwbGUgb2YgZm91ciBieXRlcyBsb25nLCBidXQKPiA+ID4gc3RpbGwgbmVl
ZHMgdG8gYmUgZml4ZWQgdG8gYXZvaWQgdGhlIGV4dHJhIGJ5dGVzd2FwLgo+ID4gPiAKPiA+ID4g
Q2hhbmdlIHRoZSBzcGVjaWFsIGNhc2UgZm9yIGJvdGggaTNjX3dyaXRlbF9maWZvKCkgYW5kCj4g
PiA+IGkzY19yZWFkbF9maWZvKCkgdG8gdXNlIG5vbi1ieXRlc3dhcHBpbmcgd3JpdGVzbCgpIGFu
ZCByZWFkc2woKSB3aXRoIGEKPiA+ID4gc2luZ2xlIGVsZW1lbnQgaW5zdGVhZCBvZiB0aGUgYnl0
ZXN3YXBwaW5nIHdyaXRlbCgpL3JlYWRsKCkgdGhhdCBhcmUKPiA+ID4gbWVhbnQgZm9yIGluZGl2
aWR1YWwgTU1JTyByZWdpc3RlcnMuIEFzIGRhdGEgaXMgY29waWVkIGJldHdlZW4gYSBGSUZPCj4g
PiA+IGFuZCBhIG1lbW9yeSBidWZmZXIsIHRoZSB3cml0ZXNsKCkvcmVhZHNsKCkgbG9vcHMgYXJl
IHR5cGljYWxseSBiYXNlZAo+ID4gPiBvbiBfX3Jhd19yZWFkbCgpLyBfX3Jhd193cml0ZWwoKSwg
cmVzdWx0aW5nIGluIHRoZSBvcmRlciBvZiBieXRlcyBpbgo+ID4gPiB0aGUgRklGTyB0byBtYXRj
aCB0aGUgb3JkZXIgaW4gdGhlIGJ1ZmZlciwgcmVnYXJkbGVzcyBvZiB0aGUgQ1BVCj4gPiA+IGVu
ZGlhbmVzcy4KPiA+ID4gCj4gPiA+IFRoZSBlYXJsaWVyIHZlcnNpb25zIGluIHRoZSBkdy1pM2Mg
YW5kIGkzYy1tYXN0ZXItY2RucyBoYWQgYSBjb3JyZWN0Cj4gPiA+IGltcGxlbWVudGF0aW9uLCBi
dXQgdGhlIGdlbmVyaWMgdmVyc2lvbiB0aGF0IHdhcyByZWNlbnRseSBhZGRlZCBicm9rZSBpdC4K
PiA+ID4gCj4gPiA+IEZpeGVzOiA3MzNiNDM5Mzc1YjQgKCJpM2M6IG1hc3RlcjogQWRkIGlubGlu
ZSBpM2NfcmVhZGxfZmlmbygpIGFuZAo+ID4gPiBpM2Nfd3JpdGVsX2ZpZm8oKSIpCj4gPiA+IENj
OiBNYW5pa2FudGEgR3VudHVwYWxsaSA8bWFuaWthbnRhLmd1bnR1cGFsbGlAYW1kLmNvbT4KPiA+
ID4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiA+ID4gLS0t
Cj4gPiA+IFRoaXMgd2FzIGEgcmVjZW50IHJlZ3Jlc3Npb24sIHRoZSB2ZXJzaW9uIGluIDYuMTYg
c3RpbGwgd29ya3MsIGJ1dAo+ID4gPiA2LjE3LXJjIGlzIGJyb2tlbi4KPiA+ID4gCj4gPiA+IHYy
IGNoYW5nZXM6Cj4gPiA+IMKgLSBhZGQgY29kZSBjb21tZW50cwo+ID4gPiDCoC0gd3JpdGUgY29y
cmVjdCBkYXRhIGJ1ZmZlcgo+ID4gPiAtLS0KPiA+ID4gwqBkcml2ZXJzL2kzYy9pbnRlcm5hbHMu
aCB8IDEyICsrKysrKysrKystLQo+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNj
L2ludGVybmFscy5oIGIvZHJpdmVycy9pM2MvaW50ZXJuYWxzLmggaW5kZXgKPiA+ID4gMGQ4NTdj
YzY4Y2M1Li43OWNlYWE1ZjVhZmQgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvaTNjL2ludGVy
bmFscy5oCj4gPiA+ICsrKyBiL2RyaXZlcnMvaTNjL2ludGVybmFscy5oCj4gPiA+IEBAIC0zOCw3
ICszOCwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgaTNjX3dyaXRlbF9maWZvKHZvaWQgX19pb21l
bSAqYWRkciwKPiA+ID4gY29uc3QKPiA+IHZvaWQgKmJ1ZiwKPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB1MzIgdG1wID0gMDsKPiA+ID4gCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
bWVtY3B5KCZ0bXAsIGJ1ZiArIChuYnl0ZXMgJiB+MyksIG5ieXRlcyAmIDMpOwo+ID4gPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqAgd3JpdGVsKHRtcCwgYWRkcik7Cj4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoCAvKgo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHdyaXRlc2woKSBpbnN0
ZWFkIG9mIHdyaXRlbCgpIHRvIGtlZXAgRklGTwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAqIGJ5dGVvcmRlciBvbiBiaWctZW5kaWFuIHRhcmdldHMKPiA+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKi8KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIHdyaXRlc2woYWRkciwgJnRt
cCwgMSk7Cj4gPiA+IMKgwqDCoCB9Cj4gPiA+IMKgfQo+ID4gPiAKPiA+ID4gQEAgLTU1LDcgKzU5
LDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBpM2NfcmVhZGxfZmlmbyhjb25zdCB2b2lkIF9faW9t
ZW0KPiA+ID4gKmFkZHIsCj4gPiB2b2lkICpidWYsCj4gPiA+IMKgwqDCoCBpZiAobmJ5dGVzICYg
Mykgewo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHUzMiB0bXA7Cj4gPiA+IAo+ID4gPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdG1wID0gcmVhZGwoYWRkcik7Cj4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoCAvKgo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHJlYWRzbCgpIGlu
c3RlYWQgb2YgcmVhZGwoKSB0byBrZWVwIEZJRk8KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKiBieXRlb3JkZXIgb24gYmlnLWVuZGlhbiB0YXJnZXRzCj4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICovCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWFkc2woYWRkciwgJnRt
cCwgMSk7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVtY3B5KGJ1ZiArIChuYnl0ZXMg
JiB+MyksICZ0bXAsIG5ieXRlcyAmIDMpOwo+ID4gPiDCoMKgwqAgfQo+ID4gPiDCoH0KPiA+IFJl
dmlld2VkLWJ5OiBKb3JnZSBNYXJxdWVzIDxqb3JnZS5tYXJxdWVzQGFuYWxvZy5jb20+Cj4gPiA+
IC0tCj4gPiA+IDIuMzkuNQo+ID4gPiAKPiAKPiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBzdWItd29y
ZCB0cmFuc2ZlciBjYXNlIG9uIGJpZy1lbmRpYW4ga2VybmVscywgYnV0IGl0Cj4gc3RpbGwgZG9l
cyBub3QgYWRkcmVzcyB0aGUgc2NlbmFyaW8gb2YgbGl0dGxlLWVuZGlhbiBrZXJuZWxzIGFjY2Vz
c2luZyBiaWctCj4gZW5kaWFuIEZJRk9zLgo+IAoKSSB3b3VsZCBhcmd1ZSB0aGF0J3Mgc29tZXRo
aW5nIGZvciBjYWxsZXJzIG9mIHRoZXNlIGZ1bmN0aW9ucyB0byBjYXJlIGFib3V0LgoKLSBOdW5v
IFPDoQoKPiBXaXRoIHRoZSBjdXJyZW50IHZlcnNpb24sIGkzY193cml0ZWxfZmlmbygpIGFuZCBp
M2NfcmVhZGxfZmlmbygpIG9ubHkgd29yawo+IHdoZW4gdGhlIEZJRk8gaGFzIHRoZSBzYW1lIGVu
ZGlhbm5lc3MgYXMgdGhlIENQVS4gT24gcGxhdGZvcm1zIHN1Y2ggYXMgdGhlCj4gWkNVMTAyICha
eW5xIFVsdHJhU2NhbGUrIE1QU29DLCBDb3J0ZXgtQTUzLCBsaXR0bGUtZW5kaWFuKSwgdGhlIEkz
QyBGSUZPcyBhcmUKPiBiaWctZW5kaWFuLCBhbmQgdGhpcyBwYXRjaCBhbG9uZSBpcyBub3Qgc3Vm
ZmljaWVudCAtIHRyYW5zZmVycyBmYWlsIGluIHRoYXQKPiBjb25maWd1cmF0aW9uLgo+IAo+IFdl
IGhhdmUgdmFsaWRhdGVkIHRoaXMgb24gWkNVMTAyLCBhbmQgdGhlIG1pc21hdGNoIGJldHdlZW4g
TEUga2VybmVsIGFuZCBCRQo+IEZJRk8gaXMgc3RpbGwgYW4gaXNzdWUuCj4gCj4gT24gdG9wIG9m
IHRoaXMgZml4LCBleHBsaWNpdCBGSUZPIGVuZGlhbm5lc3Mgc3VwcG9ydCBpcyByZXF1aXJlZCwg
YXMgcHJvcG9zZWQKPiBpbiBbUEFUQ0ggdjcgMy80XSAiaTNjOiBtYXN0ZXI6IEFkZCBlbmRpYW5u
ZXNzIHN1cHBvcnQgZm9yIGkzY19yZWFkbF9maWZvKCkKPiBhbmQgaTNjX3dyaXRlbF9maWZvKCki
LiBUaGF0IGFwcHJvYWNoIGFkZHMgYW4gZW5kaWFuIGFyZ3VtZW50IGFuZCB1c2VzCj4gd3JpdGVz
bF9iZSgpL3JlYWRzbF9iZSgpIHdoZXJlIG5lY2Vzc2FyeSwgZS5nLjoKPiAKPiBzdGF0aWMgaW5s
aW5lIHZvaWQgaTNjX3dyaXRlbF9maWZvKHZvaWQgX19pb21lbSAqYWRkciwgY29uc3Qgdm9pZCAq
YnVmLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGludCBuYnl0ZXMsIGVudW0gaTNjX2ZpZm9fZW5kaWFuIGVuZGlh
bikKPiB7Cj4gwqDCoMKgwqDCoMKgwqAgaWYgKGVuZGlhbikKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgd3JpdGVzbF9iZShhZGRyLCBidWYsIG5ieXRlcyAvIDQpOwo+IMKgwqDCoMKg
wqDCoMKgIGVsc2UKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd3JpdGVzbChhZGRy
LCBidWYsIG5ieXRlcyAvIDQpOwo+IAo+IMKgwqDCoMKgwqDCoMKgIGlmIChuYnl0ZXMgJiAzKSB7
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHUzMiB0bXAgPSAwOwo+IAo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZW1jcHkoJnRtcCwgYnVmICsgKG5ieXRlcyAmIH4z
KSwgbmJ5dGVzICYgMyk7Cj4gCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChl
bmRpYW4pCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3
cml0ZXNsX2JlKGFkZHIsICZ0bXAsIDEpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBlbHNlCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3
cml0ZXNsKGFkZHIsICZ0bXAsIDEpOwo+IMKgwqDCoMKgwqDCoMKgIH0KPiB9Cj4gCj4gCj4gVGhh
bmtzLAo+IE1hbmlrYW50YS4KCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtaTNjCg==
