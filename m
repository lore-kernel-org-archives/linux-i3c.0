Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D2DC531DC
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Aug 2024 15:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hyrOhIsM2Auj+Y6UV+U58E8iJ5bexMLpDoSetRuJyJI=; b=YYNIuo03ao3tBO
	3D/MSYzrPg+8pY6D3hP4FrIL0dBubYgCznn3wTViSBDrg9RL5ZyqEzL6MFmJoyV9dfUJ8d0zb+0pO
	Xpakp6MRba+0XMKfel7NabVoBR8FeUzkdz5WMP9B5ybHujywHVTHOO3fmLU4zbCZEds0SIZORh0ZZ
	ei3l4OGLuyut+8X7sbdD2nkbK/PnHJcihchNswp+Pz4zTV2RYeVO+MKUcoMlFst5nzJfV22uxWKcI
	d3X8kVnL/Bt5wxLwJTXIvZiR9pfP4wvGBP8SBctyAzLMEI3f/CfUT7WwR4hlE0OLiv2UWaDsae1Xm
	O7xD10YFIAym0eGmA5Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWbR-0000000HPTh-0aSr;
	Fri, 23 Aug 2024 15:53:29 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWbM-0000000HPRz-1oS5
	for linux-i3c@lists.infradead.org;
	Fri, 23 Aug 2024 15:53:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98515240002;
	Fri, 23 Aug 2024 15:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724428402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=psfZHnc2IwERrT4CMt2GdaRFDHWnpUiBb00Vh+zfwqk=;
	b=fXCulUc5ZFe15DOGx5VX8dTHRQnUF33DUJMjgnylhpv/BL1Pi7ywKja/4/8bCIqs/65jyL
	Wv34Zp3sGTiowLCb3tHnU/wYm/Cq+pxdgzlLFpXRw/wnetDQ30zkm2rYE233RNFH78oC16
	wxjUduOf7GS76wuTTaQ8bpwSJp/7DwBnDkClOWbnIqS4BePA+F5Yptc6yVawLojgnitb3H
	xCUBSFmtbL0KejSbqfJs+mTEk56h+QjBSiX1O08FXGLvXtcxQR6AW6tXrURx/LHvF7rcIu
	IpSEkTsN+oF6aCcwlZz0SdqIShVPPPdODUSEhWKzovqfsXa3Niba3zWdVQEohg==
Date: Fri, 23 Aug 2024 17:53:20 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Stanley Chu <stanley.chuys@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Parshuram Thombare <pthombar@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Brezillon
 <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Culhane
 <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 01/11] i3c: master: Remove
 i3c_dev_disable_ibi_locked(olddev) on device hotjoin
Message-ID: <20240823175320.4948f0ce@xps-13>
In-Reply-To: <ZsSr+vmyzcmQIN3e@lizhi-Precision-Tower-5810>
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
	<20240819-i3c_fix-v3-1-7d69f7b0a05e@nxp.com>
	<CAPwEoQOXme+GofEhpXaBBmsyGJP-QQtLMJG45PTdNsSqFn391w@mail.gmail.com>
	<ZsSr+vmyzcmQIN3e@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_085324_814186_4DBBC712 
X-CRM114-Status: GOOD (  23.83  )
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

SGkgRnJhbmssCgpGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIFR1ZSwgMjAgQXVnIDIwMjQgMTA6
NDU6MTQgLTA0MDA6Cgo+IE9uIFR1ZSwgQXVnIDIwLCAyMDI0IGF0IDA5OjM0OjExQU0gKzA4MDAs
IFN0YW5sZXkgQ2h1IHdyb3RlOgo+ID4gT24gVHVlLCBBdWcgMjAsIDIwMjQgYXQgMTI6MDLigK9B
TSBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4gd3JvdGU6ICAKPiA+ID4KPiA+ID4gV2hlbiBh
IG5ldyBkZXZpY2UgaG90am9pbnMsIGEgbmV3IGR5bmFtaWMgYWRkcmVzcyBpcyBhc3NpZ25lZC4K
PiA+ID4gaTNjX21hc3Rlcl9hZGRfaTNjX2Rldl9sb2NrZWQoKSBpZGVudGlmaWVzIHRoYXQgdGhl
IGRldmljZSB3YXMgcHJldmlvdXNseQo+ID4gPiBhdHRhY2hlZCB0byB0aGUgYnVzIGFuZCBsb2Nh
dGVzIHRoZSBvbGRkZXYuCj4gPiA+Cj4gPiA+IGkzY19tYXN0ZXJfYWRkX2kzY19kZXZfbG9ja2Vk
KCkKPiA+ID4gewo+ID4gPiAgICAgLi4uCj4gPiA+ICAgICBvbGRkZXYgPSBpM2NfbWFzdGVyX3Nl
YXJjaF9pM2NfZGV2X2R1cGxpY2F0ZShuZXdkZXYpOwo+ID4gPiAgICAgLi4uCj4gPiA+ICAgICBp
ZiAob2xkZGV2KSB7Cj4gPiA+ICAgICAgICAgLi4uCj4gPiA+ICAgICAgICAgaTNjX2Rldl9kaXNh
YmxlX2liaV9sb2NrZWQob2xkZGV2KTsKPiA+ID4gICAgICAgICBeXl5eXl4KPiA+ID4gICAgICAg
ICBUaGUgb2xkZGV2IHNob3VsZCBub3QgcmVjZWl2ZSBhbnkgY29tbWFuZHMgb24gdGhlIGkzYyBi
dXMgYXMgaXQKPiA+ID4gICAgICAgICBkb2VzIG5vdCBleGlzdCBhbmQgaGFzIGJlZW4gYXNzaWdu
ZWQgYSBuZXcgYWRkcmVzcy4gVGhpcyB3aWxsCj4gPiA+ICAgICAgICAgcmVzdWx0IGluIE5BQ0sg
b3IgdGltZW91dC4gU28gcmVtb3ZlIGl0Lgo+ID4gPiAgICAgfQo+ID4gPiB9Cj4gPiA+Cj4gPiA+
IEZpeGVzOiAzMTdiYWNmOTYwYTQgKCJpM2M6IG1hc3RlcjogYWRkIGVuYWJsZShkaXNhYmxlKSBo
b3Qgam9pbiBpbiBzeXMgZW50cnkiKQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBMaSA8RnJh
bmsuTGlAbnhwLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2kzYy9tYXN0ZXIuYyB8IDQg
Ky0tLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygt
KQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMgYi9kcml2ZXJz
L2kzYy9tYXN0ZXIuYwo+ID4gPiBpbmRleCA3MDI4ZjAzYzJjNDJlLi44NTJiMzIxNzhiNzIyIDEw
MDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+ID4gPiArKysgYi9kcml2ZXJz
L2kzYy9tYXN0ZXIuYwo+ID4gPiBAQCAtMjAzOSwxMCArMjAzOSw4IEBAIGludCBpM2NfbWFzdGVy
X2FkZF9pM2NfZGV2X2xvY2tlZChzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIs
Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGliaXJlcS5tYXhfcGF5bG9hZF9sZW4gPSBv
bGRkZXYtPmliaS0+bWF4X3BheWxvYWRfbGVuOwo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICBpYmlyZXEubnVtX3Nsb3RzID0gb2xkZGV2LT5pYmktPm51bV9zbG90czsKPiA+ID4KPiA+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgaWYgKG9sZGRldi0+aWJpLT5lbmFibGVkKSB7Cj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChvbGRkZXYtPmliaS0+ZW5hYmxlZCkKPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbmFibGVfaWJpID0gdHJ1ZTsKPiA+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpM2NfZGV2X2Rpc2FibGVfaWJpX2xvY2tl
ZChvbGRkZXYpOwo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPiA+Cj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGkzY19kZXZfZnJlZV9pYmlfbG9ja2VkKG9sZGRldik7ICAK
PiA+Cj4gPiBpM2NfZGV2X2ZyZWVfaWJpX2xvY2tlZCB3aWxsIHN0aWxsIGVuY291bnRlciBXQVJO
X09OKGRldi0+aWJpLT5lbmFibGVkKS4gIAo+IAo+IFRoYW5rIHlvdSB0ZXN0IGl0LiBUaGUgYmVs
b3cgcGF0Y2ggc2hvdWxkIGZpeCB0aGlzIHByb2JsZW0uCj4gCj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvaW14LzIwMjQwODIwMDQzODE4LjMzNTI2MTQtMS1yYXZpbmRyYS55YXNodmFudC5zaGlu
ZGVAbnhwLmNvbS9ULyN1CgpJdCBzaG91bGQgaW5kZWVkLiBXaXRoIHRoaXMgY2hhbmdlIGFkZGVk
OgoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+
CgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtaTNjCg==
