Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0858C369CB
	for <linux-i3c@archiver.kernel.org>; Wed, 23 Apr 2025 07:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gsz9ptzf8+iL3M8EOSTjd/AHR6DoMV5JpmlHUIatq1k=; b=Z6dmvzHc0HG5Wh
	zNV/mDK1rhrom2J9ubFVCxbl6AUDrsYiJCyf+MRLQRh5QQc/Hd7s9cEHhPkemf/XbBFIB+6oCjFLV
	jC8h1GLvHS6yIOoiT176IdAePYoJxjUOeM6yal9oS7CMG+8U7gSKS9pJswylQgmK1SN69rDPL1EOX
	XiF6qMwkesC1toIIayx+HqcdTfHX3NtprM70Z4cZlkzc5YAIxAt3cItHV9EfJ0lSs1LiHqkcYj53z
	X4uCZXYUpnCm5g7etb3DoF5fjTNfDrjOOVhLXJZh9YgLIb1G+I6ITbXgJjtgKtDldYBsn24rJ4YnU
	/b17HuyomCxKVItqJ1nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Unt-00000009Yx5-25VE;
	Wed, 23 Apr 2025 07:45:57 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UMf-00000009U4e-1yI6
	for linux-i3c@lists.infradead.org;
	Wed, 23 Apr 2025 07:17:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D31C4399E;
	Wed, 23 Apr 2025 07:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745392664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kcc49l+P/H3FfeCDK9jNtCAy/Wuc7OuX4OOHQl1RG28=;
	b=Zt0ZrwG/B2RL983vw/zSRM65rkBTKV3gfAsCPqH18mqqZ4aArlwVwSLQd7gaq6qKZFaqOg
	AC8CWl/5Grxx8Xe0z9ilOdqXl76+ga9knQVgrbrW9rMW/lNNC1ZnYuevPJoEOFVsOkLBrB
	4reNSoj57PpS2w3yUGkaUnnOB3LKuIm1SWLcs4jWiYtuas6ZIedBrBdwrlHhyy7ckzBM49
	RfcbvAqR+9qWQ6Hb4FHoz4pnsVdq6ubscB9Qojql/EUkbZEVlVMwi77wsovWkA0PLWF32c
	8q5Rz+doSj4Be7qLRSQ1qna8lqN5UD8uDZRneL+FpAa0dISt8yFKvf7NtS3Zhg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
  linux-i3c@lists.infradead.org (moderated list:SILVACO I3C DUAL-ROLE
 MASTER),  imx@lists.linux.dev (open list:SILVACO I3C DUAL-ROLE MASTER),
  linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH 1/1] i3c: master: svc: skip address resend on repeat START
In-Reply-To: <20250416164751.3437085-1-Frank.Li@nxp.com> (Frank Li's message
	of "Wed, 16 Apr 2025 12:47:50 -0400")
References: <20250416164751.3437085-1-Frank.Li@nxp.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 23 Apr 2025 09:17:43 +0200
Message-ID: <87zfg75otk.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeehleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrddutdekrdehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrhedupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrr
 dhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_001749_699026_1849EC05 
X-CRM114-Status: GOOD (  13.77  )
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

T24gMTYvMDQvMjAyNSBhdCAxMjo0Nzo1MCAtMDQsIEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29t
PiB3cm90ZToKCj4gQWNjb3JkaW5nIHRvIHRoZSBJM0Mgc3BlY2lmaWNhdGlvbiwgYWRkcmVzcyBh
cmJpdHJhdGlvbiBvbmx5IGhhcHBlbnMgZHVyaW5nCj4gdGhlIFNUQVJULiBSZXBlYXRlZCBTVEFS
VCBkbyBub3QgaW5pdGlhdGUgYXJiaXRyYXRpb24sIGFuZCBJbi1CYW5kCj4gSW50ZXJydXB0cyAo
SUJJcykgY2Fubm90IG9jY3VyIGF0IHRoaXMgc3RhZ2UuCj4KPiBSZXNlbmRpbmcgdGhlIGFkZHJl
c3MgdXBvbiBhIE5BQ0sgaW4gYSByZXBlYXQgU1RBUlQgaXMgdGhlcmVmb3JlIHJlZHVuZGFudAo+
IGFuZCB1bm5lY2Vzc2FyeS4gQXZvaWQgcmVkdW5kYW50IHJldHJpZXMsIGltcHJvdmluZyBlZmZp
Y2llbmN5IGFuZCBlbnN1cmluZwo+IHByb3RvY29sIGNvbXBsaWFuY2UuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9pM2MvbWFz
dGVyL3N2Yy1pM2MtbWFzdGVyLmMgfCA2ICsrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21h
c3Rlci9zdmMtaTNjLW1hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVy
LmMKPiBpbmRleCA4NWUxNmRlMjA4ZDNiLi41MjEyYzJjYzY4NTVmIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFz
dGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiBAQCAtMTI4MSw5ICsxMjgxLDkgQEAgc3RhdGljIGludCBz
dmNfaTNjX21hc3Rlcl93cml0ZShzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlciwKPiAgc3Rh
dGljIGludCBzdmNfaTNjX21hc3Rlcl94ZmVyKHN0cnVjdCBzdmNfaTNjX21hc3RlciAqbWFzdGVy
LAo+ICAJCQkgICAgICAgYm9vbCBybncsIHVuc2lnbmVkIGludCB4ZmVyX3R5cGUsIHU4IGFkZHIs
Cj4gIAkJCSAgICAgICB1OCAqaW4sIGNvbnN0IHU4ICpvdXQsIHVuc2lnbmVkIGludCB4ZmVyX2xl
biwKPiAtCQkJICAgICAgIHVuc2lnbmVkIGludCAqYWN0dWFsX2xlbiwgYm9vbCBjb250aW51ZWQp
Cj4gKwkJCSAgICAgICB1bnNpZ25lZCBpbnQgKmFjdHVhbF9sZW4sIGJvb2wgY29udGludWVkLCBi
b29sIHJlcGVhdF9zdGFydCkKPiAgewo+IC0JaW50IHJldHJ5ID0gMjsKPiArCWludCByZXRyeSA9
IHJlcGVhdF9zdGFydCA/IDEgOiAyOwo+ICAJdTMyIHJlZzsKPiAgCWludCByZXQ7Cj4gIAo+IEBA
IC0xNDY4LDcgKzE0NjgsNyBAQCBzdGF0aWMgdm9pZCBzdmNfaTNjX21hc3Rlcl9zdGFydF94ZmVy
X2xvY2tlZChzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlcikKPiAgCQlyZXQgPSBzdmNfaTNj
X21hc3Rlcl94ZmVyKG1hc3RlciwgY21kLT5ybncsIHhmZXItPnR5cGUsCj4gIAkJCQkJICBjbWQt
PmFkZHIsIGNtZC0+aW4sIGNtZC0+b3V0LAo+ICAJCQkJCSAgY21kLT5sZW4sICZjbWQtPmFjdHVh
bF9sZW4sCj4gLQkJCQkJICBjbWQtPmNvbnRpbnVlZCk7Cj4gKwkJCQkJICBjbWQtPmNvbnRpbnVl
ZCwgISFpKTsKCkNvdWxkIHdlIGp1c3QgcGFzcyAnaScgaGVyZT8gT3IgbWF5YmUgJ2kgPiAwJyB3
aGljaCBtaWdodCBiZSBldmVuIGNsZWFyZXIuCgo+ICAJCS8qIGNtZC0+eGZlciBpcyBOVUxMIGlm
IEkyQyBvciBDQ0MgdHJhbnNmZXIgKi8KPiAgCQlpZiAoY21kLT54ZmVyKQo+ICAJCQljbWQtPnhm
ZXItPmFjdHVhbF9sZW4gPSBjbWQtPmFjdHVhbF9sZW47CgpUaGFua3MsCk1pcXXDqGwKCi0tIAps
aW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
