Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAC7CAC5A7
	for <linux-i3c@archiver.kernel.org>; Thu, 25 Sep 2025 10:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ypn4YSrLQpxAQToXhjHon9t+Gs4Iwq0igqbrwfc7+V8=; b=CaHkRdFU70xA0v
	Q0l03DFSanLhqFbUvJyMehHls9Go6PM0PJmeE9BzS0e7sV+4tUcc/bhTuEY5kGKMu+a2X2zeexmGT
	AgakEZmjVYvqzv3gxqCo9fljDefmWpFpG+h41XCSOal+itihHU191B4TrOM3Fbvy4oyo6AgdoJd95
	ku2lXK5VA33UMcOvwD/lXOSaxDylMdy+XcxNf8xXMygK0Ss8jZ+71V881zGxgrnSpvF9mIDyYTx0h
	/kXuf3LwRDftu7CpyAEEw/7SKShj06mqLTsRu/kkybPb6dpgkQO0soB1J/jWXzD6S1JC4boAzY84z
	1//hEitEaR5y+IVaImYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iyR-00000007yJg-3xIe;
	Thu, 25 Sep 2025 10:13:15 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iyQ-00000007yJE-0vbL
	for linux-i3c@lists.infradead.org;
	Thu, 25 Sep 2025 10:13:15 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45f2acb5f42so3767525e9.1
        for <linux-i3c@lists.infradead.org>; Thu, 25 Sep 2025 03:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758795192; x=1759399992; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HmljixeQc8xgr6LVqYOS1SBQvDhtnhXHQXUSYqpft9s=;
        b=WmiJb39ZWU0smQK9hwrssGOxY05GWAB45E9v1in5gIlrCZVpz6DUf5YtoFH78z5aCR
         NAuj03pQCaRUFMhP44pLSXsqdOeltj08okYvwQEEL8JQ+yIMbBqFc38exqXY0Bo0KPKV
         Tkuev9yIpv88YjKysqH17cUn+SOpdFg18tTasyZIKiDeZ+PcrL0chklPjNW4cUwOUdf1
         M+4sqHikgkD+l12J08upcjX/ylgM9qJsplaoMjI0r1NtpvpyE8RI6wIKr56cUAHTRCN6
         f5/BjDSGtm28FA7Hg4GxBelDViCOe+tTKtURGTlwhfl6fEZGnI887Bcqt2fMMujbaYyy
         1qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758795192; x=1759399992;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HmljixeQc8xgr6LVqYOS1SBQvDhtnhXHQXUSYqpft9s=;
        b=iMXEybhQgvKZbbyFDGHq6DKBWpWDPaTMx7+4+kZpmw/kAREFqfEiF4YwVKG07AMtQf
         MtZsHHbsu+2oPEPCwvjbt6wd31Lyl2Z4BiXMKq5nQ5Pnif6ySyk7eEl31x4MLse79tYu
         +g/7luELAtGklvDS22pCeC2bcENgQRfgQ7GsrKfvv5jSMO/vNPSN5oe9DhFfVewbnDFM
         KGfLpVsyzDjkxCeXuFS7fxBuibEHWi2WP6e3i7j/iOzWu08RQuAPVy+ZM9Zd43cdEa31
         e1ZxpdjNSBJFDWRTWF0iLhH/fTDVHWAgsN58JZcp7/+jWiyWr/0x6S+UzWzIjK1GQUc2
         lDcA==
X-Forwarded-Encrypted: i=1; AJvYcCWNEPsFWG1Uu+bGfVxV9EyoIWrS0Nn60qZ3E7bBXyTJpQDuSU1dNG96PBFJnAfe6Y+1X3nSgvvO25k=@lists.infradead.org
X-Gm-Message-State: AOJu0YwMl9/j9Cc7Zg7KkstXf2ywZnH/ONZtqE/nnUBiylagoZNfFtK4
	TpW620CqQWIrAXwGUBikwI6ayn4nBvld3zAlqyGdBwkIfgjNhpFmakLz
X-Gm-Gg: ASbGncvN3jbuai2XtX3983XRfLTF0tscV4WnSa2ig8Y3vxdQUzROsdpKRA6OfnZBXbk
	o75WUsW7ysxhr2+DaurAywtExDJRau7hOzcHrAZnt43a4qUWXx0FA+f75jzkkYZJrPphTAycoq1
	hsBoQK7sOV7PH7yChXOfHrmAr7GHdqh1H8V9rGtK8YLP0LvqsFgobp6Zdc5n35Sk0iVTQ46XIJ0
	kQDGwKONcStbCdblpQjjwl6aRvn/QC0Lnqd4uUbiXbOd8fZLVHnNJBhfDD6cQ9RuL3SHJu0FTfm
	fTdUL8Lqm9ViyvD4r9CNSHd/+k/PxQ3elQ8abiiMTpl41L4Gh9NC9YanD8P6BHDD1AKnkl0XMsW
	iYvGt2vtSav7o/8+SZRuiJ+EnGA1Ut+k=
X-Google-Smtp-Source: AGHT+IEC57Rdx2+h+FGeZVFTjH1ezVMChuJ93kmZqX1ZaXIDR/t+6gNu7QdgglKgxzNMt7eo3aLEiA==
X-Received: by 2002:a05:600c:5d1:b0:46d:83e7:45ec with SMTP id 5b1f17b1804b1-46e33ca94eamr14208235e9.11.1758795191990;
        Thu, 25 Sep 2025 03:13:11 -0700 (PDT)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb9768bdesm2438865f8f.23.2025.09.25.03.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 03:13:11 -0700 (PDT)
Message-ID: <ab4b09ba3a332305f5e1e9d456acbecdb492bd85.camel@gmail.com>
Subject: Re: [PATCH] [v2] i3c: fix big-endian FIFO transfers
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Manikanta Guntupalli
	 <manikanta.guntupalli@amd.com>, Jorge Marques <gastmaier@gmail.com>, Arnd
 Bergmann <arnd@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jorge Marques	
 <jorge.marques@analog.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  Frank Li <Frank.Li@nxp.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>, "git
 (AMD-Xilinx)" <git@amd.com>, Michal Simek	 <michal.simek@amd.com>
Date: Thu, 25 Sep 2025 11:13:39 +0100
In-Reply-To: <91e73a29-96e3-4a52-addb-0cb954f46c04@app.fastmail.com>
References: <20250924201837.3691486-1-arnd@kernel.org>
	 <2wtpklapw5ogsevuvk2l4ngvw7hymer2y4cc454h47u2d7tq44@4mknmpk5yzil>
	 <DM4PR12MB6109367F36487B582ED8EA968C1FA@DM4PR12MB6109.namprd12.prod.outlook.com>
	 <37d47af4f4d5220764efc5870630fdfc1e9be2c9.camel@gmail.com>
	 <DM4PR12MB61093CEE50990ECC403D3FB98C1FA@DM4PR12MB6109.namprd12.prod.outlook.com>
	 <e5a6789230840b31ef0f60ca0a770a4fb266da2a.camel@gmail.com>
	 <91e73a29-96e3-4a52-addb-0cb954f46c04@app.fastmail.com>
User-Agent: Evolution 3.58.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_031314_279691_1D73B398 
X-CRM114-Status: GOOD (  27.91  )
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

T24gVGh1LCAyMDI1LTA5LTI1IGF0IDExOjM1ICswMjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+
IE9uIFRodSwgU2VwIDI1LCAyMDI1LCBhdCAxMDo1OCwgTnVubyBTw6Egd3JvdGU6Cj4gPiBPbiBU
aHUsIDIwMjUtMDktMjUgYXQgMDg6NDcgKzAwMDAsIEd1bnR1cGFsbGksIE1hbmlrYW50YSB3cm90
ZToKPiA+ID4gPiAoQU1ELVhpbGlueCkgPGdpdEBhbWQuY29tPjsgU2ltZWssIE1pY2hhbCA8bWlj
aGFsLnNpbWVrQGFtZC5jb20+Cj4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gW3YyXSBpM2M6
IGZpeCBiaWctZW5kaWFuIEZJRk8gdHJhbnNmZXJzCj4gPiA+ID4gT24gVGh1LCAyMDI1LTA5LTI1
IGF0IDA3OjM3ICswMDAwLCBHdW50dXBhbGxpLCBNYW5pa2FudGEgd3JvdGU6Cj4gPiA+ID4gPiA+
IGkzY0BsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4g
PiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIFt2Ml0gaTNjOiBmaXggYmlnLWVuZGlhbiBG
SUZPIHRyYW5zZmVycwo+ID4gPiA+ID4gPiBPbiBXZWQsIFNlcCAyNCwgMjAyNSBhdCAxMDoxODoz
M1BNICswMjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4gPiA+IAo+ID4gPiA+IEkgd291bGQg
YXJndWUgdGhhdCdzIHNvbWV0aGluZyBmb3IgY2FsbGVycyBvZiB0aGVzZSBmdW5jdGlvbnMgdG8g
Y2FyZQo+ID4gPiA+IGFib3V0Lgo+ID4gPiBJZiBlYWNoIEkzQyBkcml2ZXIgaGFzIHRvIGhhbmRs
ZSBGSUZPIGVuZGlhbm5lc3MgaW5kaXZpZHVhbGx5LCBpdAo+ID4gPiBpbnRyb2R1Y2VzCj4gPiA+
IHVubmVjZXNzYXJ5IGR1cGxpY2F0aW9uIGFuZCBvdmVyaGVhZCBhY3Jvc3MgZHJpdmVycy4gQ2Vu
dHJhbGl6aW5nIHRoaXMgaW4KPiA+ID4gdGhlCj4gPiA+IEZJRk8gYWNjZXNzIGhlbHBlcnMga2Vl
cHMgdGhlIGxvZ2ljIGNvbnNpc3RlbnQsIGF2b2lkcyByZXBlYXRlZAo+ID4gPiBib2lsZXJwbGF0
ZSwKPiA+ID4gYW5kIHJlZHVjZXMgdGhlIGNoYW5jZSBvZiBzdWJ0bGUgYnVncy4KPiA+IAo+ID4g
SSBtZWFuLCB0aGF0J3Mgd2hhdCBzcGkgYW5kIGkyYyBkcml2ZXJzIGRvIGFscmVhZHkuwqBXaXRo
IGVudW0KPiA+IGkzY19maWZvX2VuZGlhbgo+ID4geW91J3JlIGFscmVhZHkgZm9yY2luZyB1c2Vy
cyB0byBjYXJlIChvciBrbm93KSBhYm91dCBlbmRpYW5pc20gc28gdGhleSBtaWdodAo+ID4gYXMK
PiA+IHdlbGwganVzdCBwYXNzIHRoZSBkYXRhIGluIHRoZSBwcm9wZXIgb3JkZXIgYWxyZWFkeSAo
bm90IHN1cmUgaWYgaXQncyBzdWNoIGEKPiA+IGJpZwo+ID4gJ2J1cmRlbicpLgo+IAo+IENhbiB5
b3UgZ2l2ZSBhbiBleGFtcGxlIG9mIGFuIHNwaSBvciBpMmMgZHJpdmVyIGhhbmRsZXMgYSBzaW1p
bGFyCj4gc2l0dWF0aW9uIHRvIHRoZSBuZXcgaTNjIGRyaXZlcj8gQXMgZmFyIGFzIEkgY2FuIHRl
bGwsIHN3YXBwaW5nCj4gdGhlIGJ5dGVzIGluIGEgRklGTyByZWdpc3RlciBpcyB2ZXJ5IHVudXN1
YWwgZm9yIGEgaGFyZHdhcmUgZGVzaWduCj4gYW5kIHByb2JhYmx5IGEgbWlzdGFrZSByYXRoZXIg
dGhhbiBhbiBpbnRlbnRpb25hbCBkZWNpc2lvbi4KPiAKCkkgbWVhbnQgdGhhdCBpMmMgYW5kIHNw
aSBkcml2ZXJzIChhbmQgSSBtZWFudCBvbiB0aGUgZGV2aWNlIHNpZGUpIGFscmVhZHkgYXJlCnRo
ZSBvbmVzIGhhdmluZyB0byBjYXJlIGFib3V0IHB1dHRpbmcgdGhlIGRhdGEgaW4gdGhlIHByb3Bl
ciBlbmRpYW5pc20gc28gdGhhdApjb250cm9sbGVycyBkb24ndCBoYXZlIHRvIGNhcmUgKEFGQUlL
KS4KCkJ1dCBJIHNvIHNlZSBub3cgdGhhdCB0aGUgYWJvdmUgaXMga2luZCBvZiB1bnJlbGF0ZWQu
Cgo+IE9uIHRoZSBvdGhlciBoYW5kLCBJIGNhbiBmaW5kIGRyaXZlcnMgdGhhdCBhcmUgb2J2aW91
c2x5IHdyb25nCj4gb24gYmlnLWVuZGlhbiBrZXJuZWxzLCBzdWNoIGFzIFRlZ3JhJ3MgaTJjX3dy
aXRlc2xfdmkoKSBmdW5jdGlvbgo+IGJlaW5nIHVuaW50ZW50aW9uYWxseSBzd2FwcGVkIGZyb20g
aTJjX3dyaXRlc2woKSBvbiBiaWctZW5kaWFuLgo+IAo+IEZvciB0aGUgaTNjIGhlbHBlciwgSSB0
aGluayBKb3JnZSdzIGN1cnJlbnQgdmVyc2lvbiB3aXRoIG15Cj4gZml4IHNob3VsZCB3b3JrIGZv
ciBldmVyeSBub3JtYWwgZHJpdmVyLCBhbmQgSSB3b3VsZCBub3QKPiB3YW50IHRvIG1ha2UgaXQg
bW9yZSBjb21wbGljYXRlZCBmb3IgYW4gb2JzY3VyZSBjYXNlLiBUaGUKPiB2ZXJzaW9uIGZvciB0
aGUgQU1EIGRyaXZlciBjYW4ganVzdCBiZSBpbiB0aGF0IGRyaXZlciwgb3IKPiBpdCBjb3VsZCBi
ZSBhIHNlcGFyYXRlIGZ1bmN0aW9uIG5hbWUgaW4gdGhlIGNvbW1vbiBoZWFkZXIKPiBpZiB0aGVy
ZSBpcyBhIGNoYW5jZSB3ZSdsbCBuZWVkIGl0IGFnYWluLgo+IAoKSSBkbyBhZ3JlZSB3aXRoIHRo
ZSBhYm92ZS4KCi0gTnVubyBTw6EKCj4gwqDCoMKgwqDCoCBBcm5kCgotLSAKbGludXgtaTNjIG1h
aWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
