Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90FEC6370A
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Nov 2022 21:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ut8wxhNzFOwAyXtzMcmRJVVnyBRaAsMd7itFa/Ue5ZM=; b=pFGEEepAF7XVuE
	6XipWPFrRy2c0UkghW+GohLIgDYTTGsNYqdJt2D2gOV5QZmTbAYl1g3l75HzmI+9b42yw2VFjU0HB
	QL5BDQMYkFdobWIj+DdgbI1ahDZzWD29Xft4EA54PCx6bn1/5P2rV7fw+oc0SrdLZ38QPAzqDvwVi
	TwZNzW2Cf/TcP6k1Wp7XlbJi55uhuILTPDR5q/86IUzIKSowRq7An7Iva7wAcsB/y6XRD4HCA96Le
	QJak7BFlCpMx0TCG/ZrpLCsofoslr6nHEASEhV9Gooz7Ej0yRkZ6ea/2t2k/SNxMBZZDGXyHNFI5k
	nMAnnpICSrElg2c4n41Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyg8K-002E6h-6y; Fri, 25 Nov 2022 21:21:16 +0000
Received: from mail-4322.protonmail.ch ([185.70.43.22])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxz6e-002s2Y-OO
	for linux-i3c@lists.infradead.org; Wed, 23 Nov 2022 23:24:42 +0000
Date: Wed, 23 Nov 2022 23:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1669245874; x=1669505074;
	bh=4D7H7t9cQFG+vEXPzrmjxP0kBkCA637MqCW+lh8xlvo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hPbJVkIuL1M0qEmL0bT4PuPpgSPCUAu33Y+Qb7tdeEgjcQqAn2P9/FpfK16HEA2EM
	 7vjsfHf0eS2PmoRXdPNGezpmX314hJ02XB0zpjgzVkJDzPqhEL7AMChGfIwFpiPwIA
	 NF7ZZEj1iGDIHy5p8DLkWQw2m5Qldpno4e6/JtLA16r0ZaA4hkUD/VeqWm5hbTdlnb
	 BxWDFCkr77h+K0/o8YNYsqjLGq0ZWGeFJce25BsYm5wcKn9VpmO0zKAO32OE9aTevx
	 yfP5UsPCKW2I3bqPQKJL7FqD0bhsWsXV2qxdqiRQ7WsVWh4oHNK9TFNBq0m4+w4lGn
	 bmQFT/VhhjM8A==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Matthew Wilcox <willy@infradead.org>, Maximilian Luz <luzmaximilian@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Stefan Richter <stefanr@s5r6.in-berlin.de>, Wolfram Sang <wsa@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>, Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Chaitanya Kulkarni <kch@nvidia.com>, Ming Lei <ming.lei@redhat.com>, Jilin Yuan <yuanjilin@cdjrlc.com>, Alan Stern <stern@rowland.harvard.edu>, Sakari Ailus <sakari.ailus@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>, Won Chung <wonchung@google.com>, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-acpi@vger.kernel.org, linux-block@vger.kernel.org, linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org, linux-input@vger.kernel.org, linux-media@vger.kernel.org, linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, linux1394-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a const *
Message-ID: <tx7-rd-SyCXl_K0mh2tDzOLPmogI631IJQJRNK8dMW_GVZiy5AHHVN7-b_Ib3P1L_dLTCRPEw8dAhDbMAPGg8QTKs4p1XFoNHlEZpAnWcCw=@protonmail.com>
In-Reply-To: <Y35vLAWWfezPvGSm@kroah.com>
References: <Y34hgIW8p1RlQTBB@smile.fi.intel.com> <Y34+V2bCDdqujBDk@kroah.com> <Y35JfNJDppRp5bLX@ziepe.ca> <Y35R+/eQJYI7VaDS@kroah.com> <Y35YlI93UBuTfgYy@ziepe.ca> <Y35dMIaNYSE0Cykd@casper.infradead.org> <Y35iKfYf3ThdVvaR@kroah.com> <Y35lt+0jXrOKynL5@ziepe.ca> <Y35vLAWWfezPvGSm@kroah.com>
Feedback-ID: 20568564:user:proton
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_152440_984493_40C2FC5F 
X-CRM114-Status: GOOD (  26.85  )
X-Mailman-Approved-At: Fri, 25 Nov 2022 13:21:10 -0800
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

CkhpCgoKMjAyMi4gbm92ZW1iZXIgMjMuLCBzemVyZGEgMjA6MDYga2VsdGV6w6lzc2VsLCBHcmVn
IEtyb2FoLUhhcnRtYW4gw61ydGE6CgoKPiBPbiBXZWQsIE5vdiAyMywgMjAyMiBhdCAwMjoyNTo1
OVBNIC0wNDAwLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gCj4gPiBPbiBXZWQsIE5vdiAyMywg
MjAyMiBhdCAwNzoxMDo0OVBNICswMTAwLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4gPiAK
PiA+ID4gT24gV2VkLCBOb3YgMjMsIDIwMjIgYXQgMDU6NDk6MzZQTSArMDAwMCwgTWF0dGhldyBX
aWxjb3ggd3JvdGU6Cj4gPiA+IAo+ID4gPiA+IE9uIFdlZCwgTm92IDIzLCAyMDIyIGF0IDAxOjI5
OjU2UE0gLTA0MDAsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiA+ID4gPiAKPiA+ID4gPiA+ICNk
ZWZpbmUgZ2VuZXJpY19jb250YWluZXJfb2YoaW5fdHlwZSwgaW4sIG91dF90eXBlLCBvdXRfbWVt
YmVyKSBcCj4gPiA+ID4gPiBfR2VuZXJpYyhpbiwgXAo+ID4gPiA+ID4gY29uc3QgaW5fdHlwZSAq
OiAoKGNvbnN0IG91dF90eXBlICopY29udGFpbmVyX29mKGluLCBvdXRfdHlwZSwgb3V0X21lbWJl
cikpLCBcCj4gPiA+ID4gPiBpbl90eXBlICo6ICgob3V0X3R5cGUgKiljb250YWluZXJfb2YoaW4s
IG91dF90eXBlLCBvdXRfbWVtYmVyKSkgXAo+ID4gPiA+ID4gKQo+ID4gPiA+IAo+ID4gPiA+IFRo
ZXJlJ3MgYSBuZWF0IHRyaWNrIEkgZm91bmQgaW4gc2VxbG9jay5oOgo+ID4gPiA+IAo+ID4gPiA+
ICNkZWZpbmUgZ2VuZXJpY19jb250YWluZXJfb2YoaW5fdCwgaW4sIG91dF90LCBtKSBcCj4gPiA+
ID4gX0dlbmVyaWMoKihpbiksIFwKPiA+ID4gPiBjb25zdCBpbl90OiAoKGNvbnN0IG91dF90ICop
Y29udGFpbmVyX29mKGluLCBvdXRfdCwgbSkpLCBcCj4gPiA+ID4gaW5fdDogKChvdXRfdCAqKWNv
bnRhaW5lcl9vZihpbiwgb3V0X3R5cGUsIG0pKSBcCj4gPiA+ID4gKQo+ID4gPiA+IAo+ID4gPiA+
IGFuZCBub3cgaXQgZml0cyBpbiA4MCBjb2x1bW5zIDstKQo+ID4gPiAKPiA+ID4gTmljZSB0cmlj
ayEgRHJvcHBpbmcgdGhlIGlubGluZSBmdW5jdGlvbnMgaXMgYSBiaXQgZGlmZmVyZW50LCBsZXQg
bWUKPiA+ID4gc2VlIGlmIHRoYXQgc3RpbGwgZ2l2ZXMgYSBzYW5lIGVycm9yIGlmIHdlIHBhc3Mg
YW4gaW5jb3JyZWN0IHR5cGUgb3IKPiA+ID4gbWVzcyB3aXRoIHRoZSBjb25zdCAqIHRoZSB3cm9u
ZyB3YXkuIEknbGwgcnVuIHNvbWUgdGVzdHMgdG9tb3Jyb3cKPiA+ID4gYWZ0ZXJub29uLi4uCj4g
PiAKPiA+IFRoZSBlcnJvcnMgaW4gc29tZSBjYXNlcyBhcmUgdmVyeSB2ZXJib3NlLCBidXQgaXQg
aXMgc29tZXdoYXQKPiA+IHVuZGVyc3RhbmRhYmxlIC0gdGhlIHdvcnN0IGlzIHdoZW4gX0dlbmVy
aWMgZmFpbHMgdG8gbWF0Y2ggYW55dGhpbmcsCj4gPiBidXQgYWxzbyBhdCBsZWFzdCBjbGFuZyBw
YXJ0aWFsbHkgZXhwYW5kZWQgY29udGFpbmVyX29mIGFuZCBpdCB0aHJvd3MKPiA+IG90aGVyIGFz
c2VydGlvbnMgdG9vLgo+ID4gCj4gPiBJIGFsc28gd29uZGVyIGlmIHRoaXMgY291bGQganVzdCBi
ZSByb2xsZWQgaW50byB0aGUgbm9ybWFsCj4gPiBjb250YWluZXJfb2YuCj4gCj4gCj4gSSB0aGlu
ayB3ZSBtaWdodCBiZSBhYmxlIHRvIG5vdywgbXkgcHJldmlvdXMgYXR0ZW1wdHMgd2l0aCBpbmxp
bmUKPiBmdW5jdGlvbnMgcHJldmVudGVkIHRoYXQuIEknbGwgYmVhdCBvbiB0aGF0IHRvbW9ycm93
Li4uCj4gCj4gPiBpbl90eXBlIHdvdWxkIGhhdmUgdG8gYmUgZGVyaXZlZCBsaWtlOgo+ID4gCj4g
PiBpbl90eXBlID0gdHlwZW9mKChvdXRfdHlwZSAqKU5VTEwpLT5vdXRfbWVtYmVyKQo+ID4gCj4g
PiBCdXQgSSBkb24ndCBrbm93IGlmIHlvdSBjYW4gdXNlIHR5cGVvZiBpbiBhIGdlbmVyaWMgdHlw
ZSBtYXRjaGluZyBleHByZXNzaW9uLi4KPiAKPiAKPiBNYXliZSB0aGF0IGlzIHdoYXQgdGhyZXcg
bWUgYmVmb3JlLCBJIGNhbid0IHJlbWVtYmVyLiBJIGRvIGtub3cgd2UKPiB0cmllZCBhIG51bWJl
ciBvZiBkaWZmZXJlbnQgYXR0ZW1wdHMsIGNhbid0IHJlY2FsbCB0aGUgZmFpbGVkIG9uZXMuLi4K
PiAKCkkgYW0gc29ycnkgSSBoYXZlbid0IGZvbGxvd2VkIHRoZSBwcmV2aW91cyBkaXNjdXNzaW9u
LApidXQgaGFzIHNvbWV0aGluZyBsaWtlIHRoZSBmb2xsb3dpbmcgYmVlbiBjb25zaWRlcmVkPwoK
ICAjZGVmaW5lIGNvbnRhaW5lcl9vZjIocHRyLCB0eXBlLCBtZW1iZXIpIFwKICAJX0dlbmVyaWMo
KHB0ciksIFwKICAJCXR5cGVvZl9tZW1iZXIoY29uc3QgdHlwZSwgbWVtYmVyKSAqOiBjb250YWlu
ZXJfb2YoKHB0ciksIGNvbnN0IHR5cGUsIG1lbWJlciksIFwKICAJCWNvbnN0IHZvaWQgKjogY29u
dGFpbmVyX29mKChwdHIpLCBjb25zdCB0eXBlLCBtZW1iZXIpLCBcCiAgCQlkZWZhdWx0OiBjb250
YWluZXJfb2YoKHB0ciksIHR5cGUsIG1lbWJlcikgXAogIAkpCgpUaGlzIGlzIG5vdCBwZXJmZWN0
IGJ5IGFueSBtZWFucywgYnV0IEkgYmVsaWV2ZSBpdCBpcyBhIHJlYXNvbmFibGUKaW1wcm92ZW1l
bnQuIEl0IG9ubHkgcmVhbGx5IHdvcmtzIHJlbGlhYmx5IGlmIHRoZSBtZW1iZXIgdHlwZSBhbmQK
dGhlIHNwZWNpZmllZCBgdHlwZWAgaW4gdGhlIGFyZ3VtZW50cyBhcmUgdW5xdWFsaWZpZWQsCmJ1
dCBJIGJlbGlldmUgdGhhdCBzaG91bGQgY292ZXIgdGhlIG1ham9yaXR5IG9mIGNhc2VzLgoKSSBo
YXZlIHRyaWVkIHRvIGJ1aWxkIGFuIHg4Ni02NCBkZWZjb25maWcgd2l0aCB0aGlzIGFuZCB0aGVy
ZSBhcmUKbnVtZXJvdXMgY29uc3QgdmlvbGF0aW9ucywgYnV0IEkgaGF2ZW4ndCBzZWVuIGFueSBm
YWxzZSBwb3NpdGl2ZXMuCgoKPiBbLi4uXQoKClJlZ2FyZHMsCkJhcm5hYsOhcyBQxZFjemUKCi0t
IApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
