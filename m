Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A69D0E6D8
	for <linux-i3c@archiver.kernel.org>; Mon, 21 Oct 2024 10:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2XftxEug2wv7K4q59YfIfFfMtnSIfr0ZSBLIE+avebk=; b=QN7lCtOeX+8Frj
	kRRafVYdGDFFHV3DByNwzxyRhuQZ4OE79RATiZPQlLonMmdLz4L9hB77cTRiGQgaKC/fuVs0csLKa
	nNRkg+1gDutltsrslGgvLBL+XYhy1FDfzTfEzJHFUyoh0ssDjJGYgkBnGXzF15diOQxZky5ilmlQ+
	Wk23F/dDYKshPxW/SNBEs7U7DB16+iQb+PvCqCnAVC0t1u5xdheKkoJeU6gAb+BYVA78AU/Xs6AvA
	QFRvkhjGYubDjyoa+3kwemvUO8ZKz/NbbGAHAAcTzfYq0Pkr7WqZ/W8l9nS8Ubb9T69zm7KiwiuOd
	kl+nExna9xYZM/UAUgAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pNq-00000006qPf-2Kx6;
	Mon, 21 Oct 2024 10:11:30 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pFZ-00000006nx4-3Iln
	for linux-i3c@lists.infradead.org;
	Mon, 21 Oct 2024 10:03:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBF6EE000B;
	Mon, 21 Oct 2024 10:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729504976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S8hHCgpoOkTMwA30aYC+/MsqUIFcDcJbYYJ8xXVx8LI=;
	b=kRja9ykd6cIbvf6QthwtRvEHQaKfbfvmWw8WvqI6LyO+sbMQj9TRtgD5LyfLRPlhIzbq18
	PwNa9q94GbmGDXLh7L51Gg33NWGlBapWHaSJGka8wCmWmPf4zhzUC8UbrkpsEgc4RSfKaM
	T7XpI2nvSQRjiVfUf4tqIEUMlUF9kYWCpqttMAOdzrB/DwfJwz1WNHXUad/WiYjKRiMEVa
	csVJPCVfHScjgDi6lhpuM4HmcLfYM1w7LyZaqoVFYoBlnmjmWYWbX6RfUqgox48ozvQb1V
	fxZR9f7LjAKtLvcSiqFydU/1Fc1fWaHEMSZ1FkUWYZCp2oovaL87OX7oAX9uDA==
Date: Mon, 21 Oct 2024 12:02:54 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 bbrezillon@kernel.org, boris.brezillon@collabora.com,
 conor.culhane@silvaco.com, gregkh@linuxfoundation.org, imx@lists.linux.dev,
 pthombar@cadence.com, ravindra.yashvant.shinde@nxp.com
Subject: Re: [PATCH v7 2/3] i3c: master: Extend address status bit to 4 and
 add I3C_ADDR_SLOT_EXT_DESIRED
Message-ID: <20241021120254.76831170@xps-13>
In-Reply-To: <20241008-i3c_dts_assign-v7-2-96ec93d1f34c@nxp.com>
References: <20241008-i3c_dts_assign-v7-0-96ec93d1f34c@nxp.com>
	<20241008-i3c_dts_assign-v7-2-96ec93d1f34c@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_030258_307860_AE945BE8 
X-CRM114-Status: GOOD (  13.82  )
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
MTg6MjUgLTA0MDA6Cgo+IEV4dGVuZCB0aGUgYWRkcmVzcyBzdGF0dXMgYml0IHRvIDQgYW5kIGlu
dHJvZHVjZSB0aGUKPiBJM0NfQUREUl9TTE9UX0VYVF9ERVNJUkVEIG1hY3JvIHRvIGluZGljYXRl
IHRoYXQgYSBkZXZpY2UgcHJlZmVycyBhCj4gc3BlY2lmaWMgYWRkcmVzcy4gVGhpcyBpcyBnZW5l
cmFsbHkgc2V0IGJ5IHRoZSAnYXNzaWduZWQtYWRkcmVzcycgaW4gdGhlCj4gZGV2aWNlIHRyZWUg
c291cmNlIChkdHMpIGZpbGUuCj4gCj4gIOKUjOKUgOKUgOKUgOKUgOKUrOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUrOKUgOKUgOKUgOKUrOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUrOKUgOKUgOKUgOKUkAo+ICDilIJTL1Ny4pSCIDcnaDdFIFJuVz0wIOKUgkFD
S+KUgiBFTlREQUEgIOKUgiBUIOKUnOKUgOKUgOKUgOKUgOKUkAo+ICDilJTilIDilIDilIDilIDi
lLTilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilLTilIDilIDilIDilLTi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilLTilIDilIDilIDilJggICAg4pSCCj4gIOKUjOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUmAo+ICDilIIgIOKUjOKUgOKUgOKUrOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUrOKUgOKUgOKUgOKUrOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUrOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUrOKUgOKUgOKUgOKUrOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUkAo+ICDilJTilIDilrrilIJTcuKUgjcnaDdFIFJuVz0xICDilIJBQ0vilII0OGJpdCBVSUQg
QkNSIERDUuKUgkFzc2lnbiA3Yml0IEFkZHLilIJQQVLilIIgQUNLL05BQ0vilIIKPiAgICAg4pSU
4pSA4pSA4pS04pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS04pSA4pSA
4pSA4pS04pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pS04pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS04pSA
4pSA4pSA4pS04pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSYCj4gCj4gU29tZSBtYXN0ZXIg
Y29udHJvbGxlcnMgKHN1Y2ggYXMgSENJKSBuZWVkIHRvIHByZXBhcmUgdGhlIGVudGlyZSBhYm92
ZQo+IHRyYW5zYWN0aW9uIGJlZm9yZSBzZW5kaW5nIGl0IG91dCB0byB0aGUgSTNDIGJ1cy4gVGhp
cyBtZWFucyB0aGF0IGEgNy1iaXQKPiBkeW5hbWljIGFkZHJlc3MgbmVlZHMgdG8gYmUgYWxsb2Nh
dGVkIGJlZm9yZSBrbm93aW5nIHRoZSB0YXJnZXQgZGV2aWNlJ3MKPiBVSUQgaW5mb3JtYXRpb24u
Cj4gCj4gSG93ZXZlciwgc29tZSBJM0MgdGFyZ2V0cyBtYXkgcmVxdWVzdCBzcGVjaWZpYyBhZGRy
ZXNzZXMgKGNhbGxlZCBhcwo+ICJpbml0X2R5bl9hZGRyIiksIHdoaWNoIGlzIHR5cGljYWxseSBz
cGVjaWZpZWQgYnkgdGhlIERULSdzCj4gYXNzaWduZWQtYWRkcmVzcyBwcm9wZXJ0eS4gTG93ZXIg
YWRkcmVzc2VzIGhhdmluZyBoaWdoZXIgSUJJIHByaW9yaXR5LiBJZgo+IGl0IGlzIGF2YWlsYWJs
ZSwgaTNjX2J1c19nZXRfZnJlZV9hZGRyKCkgcHJlZmVyYWJseSByZXR1cm4gYSBmcmVlIGFkZHJl
c3MKPiB0aGF0IGlzIG5vdCBpbiB0aGUgbGlzdCBvZiBkZXNpcmVkIGFkZHJlc3NlcyAoY2FsbGVk
IGFzICJpbml0X2R5bl9hZGRyIikuCj4gVGhpcyBhbGxvd3MgdGhlIGRldmljZSB3aXRoIHRoZSAi
aW5pdF9keW5fYWRkciIgdG8gc3dpdGNoIHRvIGl0cwo+ICJpbml0X2R5bl9hZGRyIiB3aGVuIGl0
IGhvdC1qb2lucyB0aGUgSTNDIGJ1cy4gT3RoZXJ3aXNlLCBpZiB0aGUKPiAiaW5pdF9keW5fYWRk
ciIgaXMgYWxyZWFkeSBpbiB1c2UgYnkgYW5vdGhlciBJM0MgZGV2aWNlLCB0aGUgdGFyZ2V0IGRl
dmljZQo+IHdpbGwgbm90IGJlIGFibGUgdG8gc3dpdGNoIHRvIGl0cyBkZXNpcmVkIGFkZHJlc3Mu
Cj4gCj4gSWYgdGhlIHByZXZpb3VzIHN0ZXAgZmFpbHMsIGZhbGxiYWNrIHJldHVybmluZyBvbmUg
b2YgdGhlIHJlbWFpbmluZwo+IHVuYXNzaWduZWQgYWRkcmVzcywgcmVnYXJkbGVzcyBvZiBpdHMg
c3RhdGUgaW4gdGhlIGRlc2lyZWQgbGlzdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBMaSA8
RnJhbmsuTGlAbnhwLmNvbT4KClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcg
bGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
