Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782EDD0E6DE
	for <linux-i3c@archiver.kernel.org>; Mon, 21 Oct 2024 10:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HOod7Hqj9TTCBEMewPT0YVJFMivSzsVr0JLKuNF+/vo=; b=iP/dW1T1MCE9Vt
	RbKelaXTrfnvYmP/SF04+uk2P6TrRJn3UVsgJnPKdhai2tbPij+TSMHW10D+yOVZ0yr9vRmWpteUT
	hwNCcHD8owPeFxfVqEYhStjbEs0ElMZCnIxu5ERojbC7sYL7scj2vQJP7NXrTfM3Zrob2qvKHfdNR
	DQfDiGiJp926WuFCNrVoBGrA0rnbdGcKUZT3g5uQmE4vc0yWoGh71q/JoHy+Z6+cTy04u4cL8Gl9L
	Yr66j+Zu1rH6vQFWWN+lMLCB4mcFnCpW8c0uy1mlK2Cvn200dO3At8ixwrRgrU0XGT/FCGRA23S5l
	NksWz4QFQRe9uTERboxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pNs-00000006qQO-0ca8;
	Mon, 21 Oct 2024 10:11:32 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pGi-00000006oEP-2laI
	for linux-i3c@lists.infradead.org;
	Mon, 21 Oct 2024 10:04:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4E4F40003;
	Mon, 21 Oct 2024 10:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729505046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FuSdVZXDqTu6KPSGBLpmBKD6jIhd+Wm5khRva2m4vgM=;
	b=gpnuc2bxeHdPO4arqDA5C+wIpkjl+nRAOIL1QthTSWnKQgpiIhOOv9orCjyWqLXlYkBCba
	lp8hxwnzrgagoIHo2H5wL70r4YoAm9a4xEt8CzWTNb3+NiMkFkQhjWQ1RRtQTg6fb2sViW
	eXtPtJhWvWu3P1Er/zs9TvkfCAIJSGjc5h87LHNR06Y6WRDs0lk0qQquZW6mgbGgWHUboN
	dxYEEy+847vdpuyDpnHodgnNhvEc1jyjeTIyQ1GEPcRarKJBF2GHv2bnjy1yfGyA4lggCH
	ixgUWZciQn/GmA1dn4jz1GZAEDUCGLGbSV0BZeq+HrQQJJPhB5EbdhJdxDdFJg==
Date: Mon, 21 Oct 2024 12:04:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 bbrezillon@kernel.org, boris.brezillon@collabora.com,
 conor.culhane@silvaco.com, gregkh@linuxfoundation.org, imx@lists.linux.dev,
 pthombar@cadence.com, ravindra.yashvant.shinde@nxp.com, stable@kernel.org
Subject: Re: [PATCH v7 3/3] i3c: master: Fix dynamic address leak when
 'assigned-address' is present
Message-ID: <20241021120403.5764abbf@xps-13>
In-Reply-To: <20241008-i3c_dts_assign-v7-3-96ec93d1f34c@nxp.com>
References: <20241008-i3c_dts_assign-v7-0-96ec93d1f34c@nxp.com>
	<20241008-i3c_dts_assign-v7-3-96ec93d1f34c@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_030409_014202_4566B06C 
X-CRM114-Status: GOOD (  19.24  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFR1ZSwgMDggT2N0IDIwMjQgMTE6
MTg6MjYgLTA0MDA6Cgo+IElmIHRoZSBEVFMgY29udGFpbnMgJ2Fzc2lnbmVkLWFkZHJlc3MnLCBh
IGR5bmFtaWMgYWRkcmVzcyBsZWFrIG9jY3Vycwo+IGR1cmluZyBob3Rqb2luIGV2ZW50cy4KPiAK
PiBBc3N1bWUgYSBkZXZpY2UgaGF2ZSBhc3NpZ25lZC1hZGRyZXNzIDB4Yi4KPiAgIC0gRGV2aWNl
IGlzc3VlIEhvdGpvaW4KPiAgIC0gQ2FsbCBpM2NfbWFzdGVyX2RvX2RhYSgpCj4gICAtIENhbGwg
ZHJpdmVyIHh4eF9kb19kYWEoKQo+ICAgLSBDYWxsIGkzY19tYXN0ZXJfZ2V0X2ZyZWVfYWRkcigp
IHRvIGdldCBkeW5hbWljIGFkZHJlc3MgMHg5Cj4gICAtIGkzY19tYXN0ZXJfYWRkX2kzY19kZXZf
bG9ja2VkKDB4OSkKPiAgIC0gICAgIGV4cGVjdGVkX2R5bl9hZGRyICA9IG5ld2Rldi0+Ym9hcmRp
bmZvLT5pbml0X2R5bl9hZGRyICgweGIpOwo+ICAgLSAgICAgaTNjX21hc3Rlcl9yZWF0dGFjaF9p
M2NfZGV2KG5ld2RldigweGIpLCBvbGRfZHluX2FkZHIoMHg5KSk7Cj4gICAtICAgICAgICAgaWYg
KGRldi0+aW5mby5keW5fYWRkciAhPSBvbGRfZHluX2FkZHIgJiYKPiAgICAgICAgICAgICAgICAg
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXiAweGIgIT0gMHg5IC0+IFRSVUUKPiAg
ICAgICAgICAgICAgICAgKCFkZXYtPmJvYXJkaW5mbyB8fAo+ICAgICAgICAgICAgICAgICAgXl5e
Xl5eXl5eXl5eXl5eIC0+ICBGQUxTRQo+ICAgICAgICAgICAgICAgICAgZGV2LT5pbmZvLmR5bl9h
ZGRyICE9IGRldi0+Ym9hcmRpbmZvLT5pbml0X2R5bl9hZGRyKSkgewo+ICAgICAgICAgICAgICAg
ICAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eCj4g
ICAgICAgICAgICAgICAgICAweGIgIT0gMHhiICAgICAgLT4gIEZBTFNFCj4gICAgICAgICAgICAg
ICAgICAuLi4KPiAgICAgICAgICAgICAgICAgIGkzY19idXNfc2V0X2FkZHJfc2xvdF9zdGF0dXMo
Jm1hc3Rlci0+YnVzLCBvbGRfZHluX2FkZHIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBJM0NfQUREUl9TTE9UX0ZSRUUpOwo+IAkJIF5eXgo+
ICAgICAgICAgICAgICAgICAgVGhpcyB3aWxsIGJlIHNraXBwZWQuIFNvIG9sZF9keW5fYWRkciBu
ZXZlciBmcmVlCj4gICAgICAgICAgICAgfQo+IAo+ICAgLSBpM2NfbWFzdGVyX2dldF9mcmVlX2Fk
ZHIoKSB3aWxsIHJldHVybiBpbmNyZWFzZWQgc2VxdWVuY2UgbnVtYmVyLgo+IAo+IFJlbW92ZSBk
ZXYtPmluZm8uZHluX2FkZHIgIT0gZGV2LT5ib2FyZGluZm8tPmluaXRfZHluX2FkZHIgY29uZGl0
aW9uIGNoZWNrLgo+IGRldi0+aW5mby5keW5fYWRkciBzaG91bGQgYmUgY2hlY2tlZCBiZWZvcmUg
Y2FsbGluZyB0aGlzIGZ1bmN0aW9uIGJlY2F1c2UKPiBpM2NfbWFzdGVyX3NldG5ld2RhX2xvY2tl
ZCgpIGhhcyBhbHJlYWR5IGJlZW4gY2FsbGVkIGFuZCB0aGUgdGFyZ2V0IGRldmljZQo+IGhhcyBh
bHJlYWR5IGFjY2VwdGVkIGR5bl9hZGRyLiBJdCBpcyB0b28gbGF0ZSB0byBjaGVjayBpZiBkeW5f
YWRkciBpcyBmcmVlCj4gaW4gaTNjX21hc3Rlcl9yZWF0dGFjaF9pM2NfZGV2KCkuCj4gCj4gQWRk
IGNoZWNrIHRvIGVuc3VyZSBleHBlY3RlZF9keW5fYWRkciBpcyBmcmVlIGJlZm9yZQo+IGkzY19t
YXN0ZXJfc2V0bmV3ZGFfbG9ja2VkKCkuCj4gCj4gRml4ZXM6IGNjM2EzOTJkNjliNiAoImkzYzog
bWFzdGVyOiBmaXggZm9yIFNFVERBU0EgYW5kIERBQSBwcm9jZXNzIikKPiBDYzogc3RhYmxlQGtl
cm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KPiAt
LS0KPiBDaGFnbmUgdjYgdG8gdjcKPiAtIG5vbmUKPiAKPiBDaGFnbmUgdjUgdG8gdjYKPiAtIGZp
eGVkIHZlcnNpb24gbnVtYmVyIHRvIHY1Cj4gLSBmaXggbWVyZ2UgY29uZmxpY3QgYmVjYXVzZSBj
aGFuZ2UgZnVuY3Rpb24gbmFtZSBhbmQgbWFjcm8gbmFtZS4KPiAKPiBDaGFuZ2UgdjMgdG8gdjQK
PiAtIG5vbmUKPiAtLS0KPiAgZHJpdmVycy9pM2MvbWFzdGVyLmMgfCAxNSArKysrKy0tLS0tLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVy
LmMKPiBpbmRleCBlMDk2MmExN2RlN2YwLi45Y2NmYWJmODQ5YzQyIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvaTNjL21hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiBAQCAtMTU0
OCwxNiArMTU0OCw5IEBAIHN0YXRpYyBpbnQgaTNjX21hc3Rlcl9yZWF0dGFjaF9pM2NfZGV2KHN0
cnVjdCBpM2NfZGV2X2Rlc2MgKmRldiwKPiAgCQkJCSAgICAgICB1OCBvbGRfZHluX2FkZHIpCj4g
IHsKPiAgCXN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3RlciA9IGkzY19kZXZfZ2V0
X21hc3RlcihkZXYpOwo+IC0JZW51bSBpM2NfYWRkcl9zbG90X3N0YXR1cyBzdGF0dXM7Cj4gIAlp
bnQgcmV0Owo+ICAKPiAtCWlmIChkZXYtPmluZm8uZHluX2FkZHIgIT0gb2xkX2R5bl9hZGRyICYm
Cj4gLQkgICAgKCFkZXYtPmJvYXJkaW5mbyB8fAo+IC0JICAgICBkZXYtPmluZm8uZHluX2FkZHIg
IT0gZGV2LT5ib2FyZGluZm8tPmluaXRfZHluX2FkZHIpKSB7Cj4gLQkJc3RhdHVzID0gaTNjX2J1
c19nZXRfYWRkcl9zbG90X3N0YXR1cygmbWFzdGVyLT5idXMsCj4gLQkJCQkJCSAgICAgIGRldi0+
aW5mby5keW5fYWRkcik7Cj4gLQkJaWYgKHN0YXR1cyAhPSBJM0NfQUREUl9TTE9UX0ZSRUUpCj4g
LQkJCXJldHVybiAtRUJVU1k7Cj4gKwlpZiAoZGV2LT5pbmZvLmR5bl9hZGRyICE9IG9sZF9keW5f
YWRkcikgewo+ICAJCWkzY19idXNfc2V0X2FkZHJfc2xvdF9zdGF0dXMoJm1hc3Rlci0+YnVzLAo+
ICAJCQkJCSAgICAgZGV2LT5pbmZvLmR5bl9hZGRyLAo+ICAJCQkJCSAgICAgSTNDX0FERFJfU0xP
VF9JM0NfREVWKTsKPiBAQCAtMTk2MCw5ICsxOTUzLDEwIEBAIHN0YXRpYyBpbnQgaTNjX21hc3Rl
cl9idXNfaW5pdChzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIpCj4gIAkJCWdv
dG8gZXJyX3JzdGRhYTsKPiAgCQl9Cj4gIAo+ICsJCS8qIE5vdCBtYXJrIGFzIG9jY3VwaWVkIHVu
dGlsIHJlYWwgZGV2aWNlIGV4aXN0IGluIGJ1cyAqLwoKCQkvKiBEbyBub3QgbWFyawoKQnV0IHdp
dGggdGhpcyBjaGFuZ2VkLAoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBs
aXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
