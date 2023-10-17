Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F7BCDB485
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 14:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sxXPQFVH1YW1fLD5hK/R2A6Lv7nDganA3ZMCH24exJA=; b=PSImi7v3PQxjlD
	0jibnPLQcGRxAIPye+HSIlODhABF21i1SoSZqUv8W9BkWIDuNIZ1baPvS8RKojhMdJbL8Xu7NxYvd
	0B1bAd1BaXIEUp3YGJrns2TCzNOO+4X4TBQwdVEbYRi4MC4xDzMhOzibwCiicr/jI7p7DdFTKrxR3
	rLdK3pUZF0k/25LiIzgi+FsR/OpiDuhJn4aUt1C1i8f93VhOvpb51HXB2DeBvJW4NKtxs2NO3/q/S
	9bYavlM6ulDQ+9oNLjzNn1Ypd5Q96eY9w50/GrycFl3POStlYMHaLEnIjB7Uj6wo5jcqRtBmebhmd
	VPUE6n1l1USMs0SxnP6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslRF-00Ce0w-0E;
	Tue, 17 Oct 2023 14:52:53 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslOM-00CaYL-0z
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 14:50:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9263EE0009;
	Tue, 17 Oct 2023 14:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697554190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EKj1C9R90LP8I9gAVutZrILL7DKw51ojM2nAHRNjCCs=;
	b=TxZk4ixlicRIp/4Ps3f+sezpa4q8mtLWj4oe7Byd36WixDBXRuVjTaFqlgCjCoTUnugI37
	i6fruBhlMXWVotKpuFTJ6mlOOsG9tPqM2PPlxZ8mNcRHlxpyj34GGIrKhnRDyPt9TjePd9
	szT/b4qoKkak9uqtlBk6eVM+e3nAF5b74j5JlxHME1Q8ZchY03hfxvgJ/i5czh+fdeIpMr
	bDGXpvLsZJDCVEUemPt6KYmww2exDJixY78LbNNFfQutfMUxw/cHbvO68bDhRWtKqBbJ39
	75gEG/4SV5SKotlDLU0L47OwgAEoJi2sQAT6AS344MSYIrP7DYBvTT78EliF1g==
Date: Tue, 17 Oct 2023 16:49:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/6] i3c: master: svc: fix race condition in ibi work
 thread
Message-ID: <20231017164946.623abd0d@xps-13>
In-Reply-To: <ZS6cRULPrwWjCL02@lizhi-Precision-Tower-5810>
References: <20231016153232.2851095-1-Frank.Li@nxp.com>
	<20231016153232.2851095-2-Frank.Li@nxp.com>
	<20231017161658.2de6d9f3@xps-13>
	<ZS6cRULPrwWjCL02@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_074954_525391_A7725935 
X-CRM114-Status: GOOD (  12.96  )
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

SGkgRnJhbmssCgpGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIFR1ZSwgMTcgT2N0IDIwMjMgMTA6
Mzc6NTcgLTA0MDA6Cgo+IE9uIFR1ZSwgT2N0IDE3LCAyMDIzIGF0IDA0OjE2OjU4UE0gKzAyMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBGcmFuaywKPiA+IAo+ID4gRnJhbmsuTGlAbnhw
LmNvbSB3cm90ZSBvbiBNb24sIDE2IE9jdCAyMDIzIDExOjMyOjI3IC0wNDAwOgo+ID4gICAKPiA+
ID4gVGhlIGliaSB3b3JrIHRocmVhZCBvcGVyYXRlcyBhc3luY2hyb25vdXNseSB3aXRoIG90aGVy
IHRyYW5zZmVycywgc3VjaCBhcwo+ID4gPiBzdmNfaTNjX21hc3Rlcl9wcml2X3hmZXJzKCkuIElu
dHJvZHVjZXMgbXV0ZXggcHJvdGVjdGlvbiB0byBlbnN1cmUgdGhlICAKPiA+IAo+ID4gSW50cm9k
dWNlCj4gPiAgIAo+ID4gPiBjb21wbGV0aW9uIG9mIHRoZSBlbnRpcmUgaTNjL2kyYyB0cmFuc2Fj
dGlvbi4gIAo+ID4gCj4gPiBEaWQgeW91IGV4cGVyaWVuY2UgZmF1bHR5IGNvbmRpdGlvbnMgb3Ig
d2FzIGl0IHJlcG9ydGVkIHRoYW5rcyB0bwo+ID4gc3RhdGljIGFuYWx5c2lzPyAgCj4gCj4gWWVz
LCBJIG1ldC4gQnV0IGl0IG5lZWRzIG15IHNsYXZlIHBhcnQgcGF0Y2hlcywgd2hpY2ggd2lsbCBi
ZSByZWFkeSBzZW50Cj4gb3V0IHJldmlldyBzb29uLgoKSSBiZWxpZXZlIHNldmVyYWwgb2YgdGhl
ICJmaXhlcyIgaW4gdGhpcyBzZXJpZXMgYXJlIHJlbGF0ZWQgdG8gbmV3ZXIKdXNlcyAodHlwaWNh
bGx5IHlvdXIgaTNjIHNsYXZlIHN1cHBvcnQpIHdoaWNoIHdlcmUgbm90IGluIHRoZSBzY29wZSBv
Zgp0aGUgb3JpZ2luYWwgc3VibWlzc2lvbi4gQXMgdGhlc2UgbmV3IGZlYXR1cmVzIGFyZSBub3Qg
c3VwcG9zZWQgdG8gYmUKYmFja3BvcnRlZCBpbiBzdGFibGUga2VybmVscyBhbmQgYmVjYXVzZSB0
aGVzZSBhcmUgbmV3IGNvcm5lciBjYXNlcyx5b3UKbWF5IGRyb3AgdGhlIENDOi9GaXhlcyB0YWdz
IHRvIGF2b2lkIHVzZWxlc3MgYmFja3BvcnRzLgoKU29tZSBvZiB0aGVtIGhvd2V2ZXIgYXJlIHJl
YWwgZml4ZXMgZm9yIHNpdHVhdGlvbnMgd2UgbWF5IGhhcHBlbiB3aXRoCnRoZSBjdXJyZW50IGxl
dmVsIG9mIHN1cHBvcnQsIHBsZWFzZSBrZWVwIHRoZSB0YWdzIGluIHRoZXNlLCBhbmQgbW92ZQp0
aGVtIGFsbCB0byB0aGUgYmVnaW5uaW5nIG9mIHlvdXIgc2VyaWVzLgoKVGhhbmtzLApNaXF1w6hs
CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
