Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D58CF6497
	for <linux-i3c@archiver.kernel.org>; Mon, 30 Sep 2024 08:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKkA5kpWTrgyZTRNsoS94XDSnoO/DIyt8sv7SPS4Hqs=; b=YnZM2qVnUwbxwj
	xGBrdVI9tm7cl99PvcpbrlWg3sITDLoPORl9zTaq8BbEuLdDGegPRx2Zn90yBxG45bybXNPS2EKDU
	OfAa1XBYLi5mUawY+GZS6e6OuKbyBN7ODMlAlBFPG773UKxUxGn/6IuXRXgfbOwr1dlHfrlviFMuk
	e1aFXAJo2VJftEwRVV2nhQnJzpEo9pTUb7/dMn5ckSSsRheWZneJ/P3xx+y+GwXsPjhRmb4zoD0Lv
	Mz5xr+5PUIOeu+xn6SY5I297vpvDv9q6hPU1NXXRATH+epFfBf2/M/INZXA/Gn8SoCqZjs5vNDN9n
	Js4yIIqzxtGDRYsp4mMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svBnn-0000000GKjw-46nB;
	Mon, 30 Sep 2024 08:30:43 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svBnj-0000000GKha-3y22
	for linux-i3c@lists.infradead.org;
	Mon, 30 Sep 2024 08:30:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76828FF802;
	Mon, 30 Sep 2024 08:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727685034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Mdqi1Xmoy3AoIdWeODoh8dPxI2E7qwD3AC5VGT5P6M=;
	b=b3TKAh5Y/reLTMhM+9ZLF4XbDVuAs5Qv+dn9zEiVdSHJRNT/2piL2yVvkJSBeCJ56ygbbs
	mdGCb+pxjTzNX00R7Sg7V4IKOKPg98AZ56oqcnHlpFbkOCu5Nze4HBhytsEExy0eJaKCZX
	/kybWfyYlszQOahc+pV5XUAzIy6FkYePqO1uZ6nYH1zl5+QzgDJEZwhzTJtTSCPmMPt8Iv
	ZxlTy/RonJwW3AK2wKPy1Cu44h4xkrNkBMa4eH+C3AcxLw/Vbr5LWWB0pgUcuZCSrXuyE1
	HWnMo75awzycwCBXsBLtC4cAP1H3Rgon+jZy73mBks+O5Vg4QURUqKg6STRhvQ==
Date: Mon, 30 Sep 2024 10:30:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, conor.culhane@silvaco.com,
 alexandre.belloni@bootlin.com, jun.li@nxp.com, xiaoning.wang@nxp.com,
 linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: master: svc: Fix pm_runtime_set_suspended() with
 runtime pm enabled
Message-ID: <20240930103033.2414dcdd@xps-13>
In-Reply-To: <ZvWRp1Bs5XP+mVOx@lizhi-Precision-Tower-5810>
References: <20240923034122.3007984-1-ruanjinjie@huawei.com>
	<ZvWRp1Bs5XP+mVOx@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_013040_781157_1E41AD68 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

SGksCgpGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIFRodSwgMjYgU2VwIDIwMjQgMTI6NTM6NTkg
LTA0MDA6Cgo+IE9uIE1vbiwgU2VwIDIzLCAyMDI0IGF0IDExOjQxOjIyQU0gKzA4MDAsIEppbmpp
ZSBSdWFuIHdyb3RlOgo+ID4gSXQgaXMgbm90IHZhbGlkIHRvIGNhbGwgcG1fcnVudGltZV9zZXRf
c3VzcGVuZGVkKCkgZm9yIGRldmljZXMKPiA+IHdpdGggcnVudGltZSBQTSBlbmFibGVkIGJlY2F1
c2UgaXQgcmV0dXJucyAtRUFHQUlOIGlmIGl0IGlzIGVuYWJsZWQKPiA+IGFscmVhZHkgYW5kIHdv
cmtpbmcuIFNvLCBjYWxsIHBtX3J1bnRpbWVfZGlzYWJsZSgpIGJlZm9yZSB0byBmaXggaXQuCj4g
Pgo+ID4gRml4ZXM6IDA1YmUyM2VmNzhmNyAoImkzYzogbWFzdGVyOiBzdmM6IGFkZCBydW50aW1l
IHBtIHN1cHBvcnQiKQo+ID4gU2lnbmVkLW9mZi1ieTogSmluamllIFJ1YW4gPHJ1YW5qaW5qaWVA
aHVhd2VpLmNvbT4gIAoKTWlzc2luZyBDYzogc3RhYmxlLgoKPiAKPiBSZXZpZXdlZC1ieTogRnJh
bmsgTGkgPEZyYW5rLkxpQG54cC5jb20+CgpXaXRoIHRoZSB0YWcgYWRkZWQsCgpSZXZpZXdlZC1i
eTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5rcywKTWlx
dcOobAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1p
M2MK
