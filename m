Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3406C87FC5
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Jul 2025 11:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A9KEoOD4G4wvLL8yNQnsE2AVrUMz4amTXanhs6AxFoU=; b=GHbqphRKsRWrWd
	A5j9m6APmDKA5j/HIKMiVmw0g/EOK9xdmk7ldYjVzVcb3hBYpTh4ghZsBbqj2j/Hqm3v7RjAzEUcN
	TibD1oihS39f47T6/74cTgK3QTSJlZT01Wnn0eUiwjNyQv2hYBnRHbYjOOwBCV4XJHO6Vd16Qq4eP
	WXTXWK4dtMhXDyci3eXVw6gBseyZgQlyZkeG1s3fx0zEDvx2P5JHR5UCEMTzGMZHx7GC7tDdbpU4D
	TDiVEti2sL181sFa2t+49z2JxJs+Zqy0RuJfMSIbSasY9HwfqAUJtYifZ0n2kcZey3LPTDmlP6WCG
	HVYUwOAuVT6hsTjiENXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAx9-00000002Fod-2YGp;
	Tue, 22 Jul 2025 11:14:35 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udeoY-0000000Ftq0-1KYG
	for linux-i3c@lists.infradead.org;
	Mon, 21 Jul 2025 00:55:35 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-237e6963f63so21512685ad.2
        for <linux-i3c@lists.infradead.org>; Sun, 20 Jul 2025 17:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753059333; x=1753664133; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=su3U52+sp+PSAMNUwV41V2iuvGngzlC1kSqRffejv28=;
        b=QucXO9YOyI+BEgVjAcTAQnqd3T1FLNEg78VlHRnSJXBUx1bhvhWMFcGVxBihcdFJHl
         MG2+W5AJ80Y9eYFHyJtv9cUDGsYkk4b0LMxwYNjcLMQuTiQ5JAVWwQxzNmbD5uzM6Qsc
         DRJP8zzFGdYLjQT3bV/DPyGElYLZ2Z2cXfthDJJpZsReBgOp7osOk6ZXLywuUIM0EyDL
         A77VwX6nLOSXSrjgwzjZUou9MfG/vyEqhMVSANtmJVDI05rWGeMH6zv+7U7rDmqjCAAk
         NdvWtY9ddzqsOPiYDEsoE2uKhjAk53ew6XKb3LMbps+CoHKO1VVtfGDB7XCwztXRwDYq
         J7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753059333; x=1753664133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=su3U52+sp+PSAMNUwV41V2iuvGngzlC1kSqRffejv28=;
        b=d6UdTRHoScTDwp5drseRQLsax5RW/t8g/Z+ftty8ScxTKAChdWgN6z0PE7GaiDQ0Zg
         35T0fhWSNHntJ/io33Nh12dWF6HiYlzbWd2odQNFS3w2hK/SsNB6+H7Lluf/ogWLhgQ4
         P7vfL8866xP651Du5k5lg0W+jNktTw6ja05bsXVBv9dTCsmvJGjnZKwrIVk0y/ZSXYRX
         VCSoEPoAJgBPB0/PI8iR9PwJ2aWNefrSvnemvlX9Oh8cCWbNAjOYNv1bJSRH/MJOx/gK
         88ATdu7ktHi5z8FpBVdTpU8mcFcM4t2CEGF4TtTPt8tl5cJ4exou0AloE3gb7Ei/xoWC
         rgNw==
X-Forwarded-Encrypted: i=1; AJvYcCUNQuAkKqpBoc82hGkNoTE6Rm+e2uDgrWm1pDXZoMrVq0Y7wC67bDGZEf0nwOj16xYcV7pfAfRdfBA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4pbjhZPXmbo2ZM9L13el39A0ZY8uQwaXIF3kGN1qX+bCWQLFf
	ohnFTiX00WH9Sn1GpAdB0fXcNx6Zn3YwuaIqC7YnFNjDg5jyUXDGWajgFu6Dr6CpKklEBLxb4jw
	lQbUd/dZWSeFLBlVqbqT46vpMhf5C3FE=
X-Gm-Gg: ASbGnctq7j9ij5jVgCjqsNQfO+wvB6QOifgQZVzHK+JK8zpb6EhtU/heKPdnFjO7BDe
	M4mTH3VzY8WWA9BtLNyT3kBu3E/Uv5pSDAYiZRTyVLoVTZDaV/Fxb9wcGcZoKSwpjLd57tJcVFD
	itPaLOKcjzoYGsZG3d8oM2D57s+n4SGGzOnzRfY0aiPLhqctVlc75eSv7SpDQEO5RAFcDlTrUP5
	oK8TUP6sQ==
X-Google-Smtp-Source: AGHT+IEE4N6Umc2ltH0YODkkoDHlFEVnhWKExhhBa/MRkZda2Ky+fkbswM6oupyOFN1r4hYW1mpTt1aIle7MXrVo1yM=
X-Received: by 2002:a17:903:22ce:b0:23d:dd04:28d4 with SMTP id
 d9443c01a7336-23e25770595mr233472765ad.43.1753059333434; Sun, 20 Jul 2025
 17:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250720152401.70720-1-luis.hernandez093@gmail.com>
 <20250720152401.70720-2-luis.hernandez093@gmail.com> <1b00e570-f51e-4768-a882-d03252d84534@infradead.org>
In-Reply-To: <1b00e570-f51e-4768-a882-d03252d84534@infradead.org>
From: Felipe Hernandez <luis.hernandez093@gmail.com>
Date: Sun, 20 Jul 2025 20:54:57 -0400
X-Gm-Features: Ac12FXxtTP0SrYJjWusZlgSAcBLOj0fssYgo6ZebCpxEa_mtI094lXf21XdNDRk
Message-ID: <CAGRSKZixNThTx_cUJhiXef4N4=K+eLNemqv6+9nZ=o=0d45NWg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] docs: Fix kernel-doc indentation errors
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Pavel Pisa <pisa@cmp.felk.cvut.cz>, Ondrej Ille <ondrej.ille@gmail.com>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Frank Li <Frank.Li@nxp.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-i3c@lists.infradead.org, linux-can@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_175534_357670_58849DC6 
X-CRM114-Status: GOOD (  27.43  )
X-Mailman-Approved-At: Tue, 22 Jul 2025 04:10:58 -0700
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

T24gU3VuLCBKdWwgMjAsIDIwMjUgYXQgMzowM+KAr1BNIFJhbmR5IER1bmxhcCA8cmR1bmxhcEBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPgo+ICsgQmFnYXMKPgo+IE9uIDcvMjAvMjUgODoyNCBBTSwg
THVpcyBGZWxpcGUgSGVybmFuZGV6IHdyb3RlOgo+ID4gRml4IGtlcm5lbC1kb2MgaXNzdWVzIHRo
YXQgcmVwb3J0ZWQgVW5leHBlY3RlZCBpbmRlbnRhdGlvbiBlcnJvcnMKPiA+IGR1cnJpbmcgZG9j
dW1lbnRhdGlvbiBidWlsZCAobWFrZSBodG1sZG9jcykgaW4gQ0FOLCBJM0MgYW5kIEdQVSBkcml2
ZXJzLgo+ID4KPiA+IENvbnZlcnQgZm9ybWF0dGluZyB0byBwcm9wZXIgUmVTVCBsaXN0IHN5bnRh
eCB0byByZXNvbHZlIHdhcm5pbmcuCj4gPgo+ID4gQ2hhbmdlcyBzaW5jZSB2MToKPiA+IC0gQ29u
dmVydCByZXR1cm4gdmFsdWUgZGVzY3JpcHRpb25zIHRvIHByb3BlciBSZVNUIGZvcm1hdAo+ID4g
LSBGaXggY29kZSBibG9jayBpbnRyb2R1Y3Rpb24gd2l0aCA6OiBzeW50YXgKPiA+IC0gQWRkIEdQ
VSBkcml2ZXIgZml4ZXMKPiA+IC0gUmVtb3ZlIFNDU0kgZHJpdmVyIChhbHJlYWR5IGZpeGVkKQo+
ID4KPiA+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDcwMzAyMzUxMS44
Mjc2OC0xLWx1aXMuaGVybmFuZGV6MDkzQGdtYWlsLmNvbS8KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBMdWlzIEZlbGlwZSBIZXJuYW5kZXogPGx1aXMuaGVybmFuZGV6MDkzQGdtYWlsLmNvbT4KPiA+
IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ3B1dm0uYyAgICAgICAgICAgICAgfCAxNiAr
KysrKysrKy0tLS0tLS0tCj4KPiBkcm1fZ3B1dm0uYyBmaXhlZCBieSBCYWdhczoKPgo+ICAgaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZG9jLzIwMjUwNzA5MDI0NTAxLjkxMDUtMS1iYWdh
c2RvdG1lQGdtYWlsLmNvbS8KPgo+IE90aGVyd2lzZSBMR1RNLgo+Cj4gPiAgZHJpdmVycy9pM2Mv
ZGV2aWNlLmMgICAgICAgICAgICAgICAgICAgICB8IDEzICsrKysrKysrLS0tLS0KPgo+IGkzYyBp
cyBhbHNvIGZpeGVkIGJ5IEJhZ2FzOgo+ICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
aTNjLzIwMjUwNzAyMDQwNDI0LjE4NTc3LTEtYmFnYXNkb3RtZUBnbWFpbC5jb20vCj4KPiBPdGhl
cndpc2UgTEdUTS4KPgo+ID4gIGRyaXZlcnMvbmV0L2Nhbi9jdHVjYW5mZC9jdHVjYW5mZF9iYXNl
LmMgfCAxMiArKysrKysrLS0tLS0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMo
KyksIDE4IGRlbGV0aW9ucygtKQo+ID4KPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2Nh
bi9jdHVjYW5mZC9jdHVjYW5mZF9iYXNlLmMgYi9kcml2ZXJzL25ldC9jYW4vY3R1Y2FuZmQvY3R1
Y2FuZmRfYmFzZS5jCj4gPiBpbmRleCBiZjYzOTg3NzI5NjAuLmY5MTA0MjIxODhjMyAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvbmV0L2Nhbi9jdHVjYW5mZC9jdHVjYW5mZF9iYXNlLmMKPiA+ICsr
KyBiL2RyaXZlcnMvbmV0L2Nhbi9jdHVjYW5mZC9jdHVjYW5mZF9iYXNlLmMKPiA+IEBAIC01MDYs
MTEgKzUwNiwxMyBAQCBzdGF0aWMgYm9vbCBjdHVjYW5faXNfdHh0X2J1Zl93cml0YWJsZShzdHJ1
Y3QgY3R1Y2FuX3ByaXYgKnByaXYsIHU4IGJ1ZikKPiA+ICAgKiBAYnVmOiAgICAgVFhUIEJ1ZmZl
ciBpbmRleCB0byB3aGljaCBmcmFtZSBpcyBpbnNlcnRlZCAoMC1iYXNlZCkKPiA+ICAgKiBAaXNm
ZGY6ICAgVHJ1ZSAtIENBTiBGRCBGcmFtZSwgRmFsc2UgLSBDQU4gMi4wIEZyYW1lCj4gPiAgICoK
PiA+IC0gKiBSZXR1cm46IFRydWUgLSBGcmFtZSBpbnNlcnRlZCBzdWNjZXNzZnVsbHkKPiA+IC0g
KiAgICAgIEZhbHNlIC0gRnJhbWUgd2FzIG5vdCBpbnNlcnRlZCBkdWUgdG8gb25lIG9mOgo+ID4g
LSAqICAgICAgICAgICAgICAgICAgIDEuIFRYVCBCdWZmZXIgaXMgbm90IHdyaXRhYmxlIChpdCBp
cyBpbiB3cm9uZyBzdGF0ZSkKPiA+IC0gKiAgICAgICAgICAgICAgICAgICAyLiBJbnZhbGlkIFRY
VCBidWZmZXIgaW5kZXgKPiA+IC0gKiAgICAgICAgICAgICAgICAgICAzLiBJbnZhbGlkIGZyYW1l
IGxlbmd0aAo+ID4gKyAqIFJldHVybjoKPiA+ICsgKiAqIFRydWUgLSBGcmFtZSBpbnNlcnRlZCBz
dWNjZXNzZnVsbHkKPiA+ICsgKiAqIEZhbHNlIC0gRnJhbWUgd2FzIG5vdCBpbnNlcnRlZCBkdWUg
dG8gb25lIG9mOgo+ID4gKyAqCj4gPiArICogICAqIFRYVCBCdWZmZXIgaXMgbm90IHdyaXRhYmxl
IChpdCBpcyBpbiB3cm9uZyBzdGF0ZSkKPiA+ICsgKiAgICogSW52YWxpZCBUWFQgYnVmZmVyIGlu
ZGV4Cj4gPiArICogICAqIEludmFsaWQgZnJhbWUgbGVuZ3RoCj4gPiAgICovCj4gPiAgc3RhdGlj
IGJvb2wgY3R1Y2FuX2luc2VydF9mcmFtZShzdHJ1Y3QgY3R1Y2FuX3ByaXYgKnByaXYsIGNvbnN0
IHN0cnVjdCBjYW5mZF9mcmFtZSAqY2YsIHU4IGJ1ZiwKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJvb2wgaXNmZGYpCj4KPiBUaGUgbnVtYmVyZWQgbGlzdCBpcyBub3QgYSBwcm9i
bGVtIEFGQUlLLiBEaWQgeW91IHNlZSBhbiBpc3N1ZSB3aXRoIGl0Pwo+IEFuZCBoYXZpbmcgdGhl
IGJsYW5rIGxpbmUganVzdCBiZWZvcmUgdGhlICJGYWxzZSIgbGlzdCBjYXVzaW5nIHVuZGVzaXJh
YmxlCj4gaHRtbCBvdXRwdXQ6Cj4KPiBSZXR1cm4KPgo+ICAqIFRydWUgLSBGcmFtZSBpbnNlcnRl
ZCBzdWNjZXNzZnVsbHkKPgo+ICAqIEZhbHNlIC0gRnJhbWUgd2FzIG5vdCBpbnNlcnRlZCBkdWUg
dG8gb25lIG9mOgo+Cj4gRGVzY3JpcHRpb24KPgo+ICAqIFRYVCBCdWZmZXIgaXMgbm90IHdyaXRh
YmxlIChpdCBpcyBpbiB3cm9uZyBzdGF0ZSkKPgo+ICAqIEludmFsaWQgVFhUIGJ1ZmZlciBpbmRl
eAo+Cj4gICogSW52YWxpZCBmcmFtZSBsZW5ndGgKPgo+IFRoZSAiRGVzY3JpcHRpb24iIGxpbmUg
c2hvdWxkIG5vdCBiZSB0aGVyZS4KPgo+IElNTyBhbGwgd2Ugd2FudCB0byBkbyBpcyBjb252ZXJ0
IHRoZSBUcnVlIGFuZCBGYWxzZSBsaW5lcyBpbnRvCj4gYSBidWxsZXRlZCBsaXN0IGFuZCB0aGVu
IHRoZSBodG1sIG91dHB1dCB3aWxsIGxvb2sgbGlrZSB0aGlzOgo+Cj4gUmV0dXJuCj4KPiAgKiBU
cnVlIC0gRnJhbWUgaW5zZXJ0ZWQgc3VjY2Vzc2Z1bGx5Cj4KPiAgKiBGYWxzZSAtIEZyYW1lIHdh
cyBub3QgaW5zZXJ0ZWQgZHVlIHRvIG9uZSBvZjoKPiAgICAgICAgIDEuIFRYVCBCdWZmZXIgaXMg
bm90IHdyaXRhYmxlIChpdCBpcyBpbiB3cm9uZyBzdGF0ZSkKPiAgICAgICAgIDIuIEludmFsaWQg
VFhUIGJ1ZmZlciBpbmRleAo+ICAgICAgICAgMy4gSW52YWxpZCBmcmFtZSBsZW5ndGgKPgo+Cj4g
LS0KPiB+UmFuZHkKCkhpIFJhbmR5LAoKVGhhbmsgeW91IGZvciB0aGUgZmVlZGJhY2ssIEkgYXBv
bG9naXplIGFib3V0IHRoZSBpc3N1ZXMgd2l0aCB0aGlzCmxhdGVzdCBwYXRjaCB2ZXJzaW9uOgoK
MS4gSSBub3cgc2VlIHRoYXQgQmFnYXMgaGFzIGFscmVhZHkgZml4ZWQgdGhlIEdQVSBhbmQgSTND
IGRyaXZlcnMuLi4gSQphcG9sb2dpemUgZm9yIHRoZSBkdXBsaWNhdGUgZWZmb3J0LgoKMi4gRm9y
IHRoZSBDQU4gZHJpdmVyLCBJIHVuZGVyc3RhbmQgeW91ciBwb2ludCBhYm91dCB0aGUgYmxhbmsg
bGluZQpjYXVzaW5nIHVud2FudGVkIGlzc3VlcyB3aXRoIHRoZSBIVE1MLiBJJ2xsIGNvcnJlY3Qg
dGhpcy4KCjMuIFJlIHRoZSBudW1iZXJlZCBsaXN0PiBJIHdhcyBiZWluZyBvdmVybHkgYnJvYWQg
aW4gbXkgY29udmVyc2lvbiB0bwpidWxsZXQgZm9ybWF0LiBJIHdpbGwgYmFjayB0aGlzIG91dC4K
CkknbGwgc2VuZCBhIHYzIHRoYXQgZm9jdXNlcyBvbmx5IG9uIHRoZSBDQU4gZHJpdmVyIGZpeCB3
aXRoIHRoZQpjb3JyZWN0IGZvcm1hdHRpbmcgeW91IGRlc2NyaWJlZCAoY29udmVydCBUcnVlL0Zh
bHNlIHRvIGJ1bGxldHMgd2hpbGUKa2VlcGluZyB0aGUgbnVtYmVyZWQgc3ViIGxpc3QgaW50YWN0
KS4KClRoYW5rIHlvdSBmb3IgdGhlIGd1aWRhbmNlCgpCZXN0LAoKRmVsaXBlCgotLSAKbGludXgt
aTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
