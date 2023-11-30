Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C53C10DC1
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Nov 2023 10:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kj8jI9OQAfaVLO6cTjJoL/kyubu3r2MKe08OUqRucrE=; b=G22RjCiQNODkc8
	fmAVGVYNZsK7hAj1UrGrUqFZzJnWj42W178MwzxaaYX1RsgMsVukWqsdDKbirqmSwijx9ib+IWllD
	zgZ5/I+gvHFjmaU625TsUfBcJTHJT967ejwWVQ1JirkjsKb6+f1vgcCGsJ2Gsj/O22d7i4/Lg+G83
	cq+hLUbDCFY2PQ013cPhYmN76iX0wVMekTGxYxgEWRKopj6Fftj/3iakJi7KO11lSYj18/xl+gGi1
	ahGP6Xj39UzGu/UOl4FZA13GLwxCsbj57TRmVV6Biljw8+g82Kp+t6kvMBr9nVJOJX8Z1UK5arqrJ
	WSwHJj3NaqQG1UlHOosQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8e9R-00AQgK-2J;
	Thu, 30 Nov 2023 10:20:09 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8e9N-00AQeC-1N
	for linux-i3c@lists.infradead.org;
	Thu, 30 Nov 2023 10:20:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF88124000B;
	Thu, 30 Nov 2023 10:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701339602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gxeX2wy4DYJyBHFFmjfGARbNkbZtBHOZlxHLk2Rp2VQ=;
	b=SzsJiaOHAQP9sp5gZ+zR81XoshHOseb+8oXeDl1RCkHAzNJ68S1q73PKpRl+AoMxS0aHIF
	vq/qJlTVWyE2FPOQdgAV+6fOr2ifbXHP9h7QuzYn/7vxdfz1bA+vFqEd44x9008qz7k9G3
	bpQe3BkalvPYk+j7teQklvpV4k7yLJ5mTwyydgNOxn4A46ZEo8dG/xV8gm0xiGTPUbmTbG
	cS3PZx8fTmgffK6P5UUrzhhOtI3eXJ9A1Xhu8M80vgejYMx7ox4IyEDfmf9PlrCfPJkFHH
	2WUwYsBNAM4L5W1YCRy+X+mDS311DYBfmRIkkpG2eBb+H4WF6CWDVB14qX45QQ==
Date: Thu, 30 Nov 2023 11:19:59 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, zbigniew.lukwinski@linux.intel.com
Subject: Re: [PATCH v4 6/6] i3c: add API i3c_dev_gettstatus_format1() to get
 target device status
Message-ID: <20231130111959.11afd8a8@xps-13>
In-Reply-To: <20231129221225.387952-7-Frank.Li@nxp.com>
References: <20231129221225.387952-1-Frank.Li@nxp.com>
	<20231129221225.387952-7-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_022005_612098_976339EA 
X-CRM114-Status: GOOD (  17.25  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFdlZCwgMjkgTm92IDIwMjMgMTc6
MTI6MjUgLTA1MDA6Cgo+IEkzQyBzdGFuZGFyZCA1LjEuOS4zLjE1IEdldCBEZXZpY2UgU3RhdHVz
IChHRVRTVEFUVVMpOgo+IEdldCByZXF1ZXN0IGZvciBvbmUgSTNDIFRhcmdldCBEZXZpY2UgdG8g
cmV0dXJuIGl0cyBjdXJyZW50IHN0YXR1cy4KPiAKPiBBZGQgQVBJIHRvIGZldGNoIGl0IHdpdGgg
Zm9ybWF0MS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9pM2MvZGV2aWNlLmMgICAgICAgfCAyNCArKysrKysrKysrKysrKysr
KysrKysrKysKPiAgZHJpdmVycy9pM2MvaW50ZXJuYWxzLmggICAgfCAgMSArCj4gIGRyaXZlcnMv
aTNjL21hc3Rlci5jICAgICAgIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgaW5j
bHVkZS9saW51eC9pM2MvZGV2aWNlLmggfCAgMSArCj4gIDQgZmlsZXMgY2hhbmdlZCwgNTIgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9kZXZpY2UuYyBiL2RyaXZl
cnMvaTNjL2RldmljZS5jCj4gaW5kZXggMWE2YTg3MDNkYmMzYS4uYWEyNmNmNTBhYjljNiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9kZXZpY2UuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL2Rldmlj
ZS5jCj4gQEAgLTE5Niw2ICsxOTYsMzAgQEAgdm9pZCBpM2NfZGV2aWNlX2ZyZWVfaWJpKHN0cnVj
dCBpM2NfZGV2aWNlICpkZXYpCj4gIH0KPiAgRVhQT1JUX1NZTUJPTF9HUEwoaTNjX2RldmljZV9m
cmVlX2liaSk7Cj4gIAo+ICsvKioKPiArICogaTNjX2RldmljZV9nZXRzdGF0dXNfZm9ybWF0MSgp
IC0gR2V0IGRldmljZSBzdGF0dXMgd2l0aCBmb3JtYXQgMS4KPiArICogQGRldjogZGV2aWNlIGZv
ciB3aGljaCB5b3Ugd2FudCB0byBnZXQgc3RhdHVzLgo+ICsgKiBAc3RhdHVzOiBJM0Mgc3RhdHVz
IGZvcm1hdCAxCj4gKyAqCj4gKyAqIFJldHVybjogMCBpbiBjYXNlIG9mIHN1Y2Nlc3MsIGEgbmVn
YXRpdmUgZXJyb3IgY29yZSBvdGhlcndpc2UuCj4gKyAqLwo+ICtpbnQgaTNjX2RldmljZV9nZXRz
dGF0dXNfZm9ybWF0MShzdHJ1Y3QgaTNjX2RldmljZSAqZGV2LCB1MTYgKnN0YXR1cykKCkknbSBu
b3QgYSBiaWcgZmFuIG9mIHRoZSBvcHBvc2l0aW9uIGJldHdlZW4gImkzY19kZXZpY2UiIGFuZCAi
aTNjX2RldiIuCkNvdWxkIHdlIGNsYXJpZnkgdGhlIHByZWZpeGVzPwoKPiArewo+ICsJaW50IHJl
dCA9IC1FSU5WQUw7CgpJbml0IG5vdCB1c2VmdWwKCj4gKwo+ICsJaWYgKCFzdGF0dXMpCj4gKwkJ
cmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsJaTNjX2J1c19ub3JtYWx1c2VfbG9jayhkZXYtPmJ1cyk7
Cj4gKwlpZiAoZGV2LT5kZXNjKQo+ICsJCXJldCA9IGkzY19kZXZfZ2V0c3RhdHVzX2Zvcm1hdDFf
bG9ja2VkKGRldi0+ZGVzYywgc3RhdHVzKTsKPiArCj4gKwlpM2NfYnVzX25vcm1hbHVzZV91bmxv
Y2soZGV2LT5idXMpOwo+ICsKPiArCXJldHVybiByZXQ7Cj4gK30KPiArRVhQT1JUX1NZTUJPTF9H
UEwoaTNjX2RldmljZV9nZXRzdGF0dXNfZm9ybWF0MSk7CgpUaGVyZSBpcyBubyB1c2VyIHlldC4g
TWF5YmUgdGhpcyBuZWVkcyB0byBiZSBkb25lIGluIGFub3RoZXIgc2VyaWVzPwpTYW1lIGJlbG93
LgoKLi4uCgo+ICtpbnQgaTNjX2Rldl9nZXRzdGF0dXNfZm9ybWF0MV9sb2NrZWQoc3RydWN0IGkz
Y19kZXZfZGVzYyAqZGV2LCB1MTYgKnN0YXR1cykKCi4uLgoKVGhhbmtzLApNaXF1w6hsCgotLSAK
bGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
