Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9B5CDB474
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 15:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4dPOdcdkdmPF9ffbmZEUK3+hW7aWNDKgrc7Yk0hxaY=; b=wpo81aBKkk8BWS
	gC6AyT4N/um54Z0f0YX6ArrnAsy5U36Ghmu0wm0CYBjC3Hr/inaPmyKgq3QzheYrB7Ef+/Hy8DYci
	XVAuv88X7TeZf0iWiVWfF6daUXU+ciOVXUkGQg0CWDFvoUTjSufgkxRuVIBKslTZJtpV9fZ4b1nPx
	RfDJ68YyQJb9bpkEDrhmHwXNRWu2gf1GXfGyyjZqqS8NbD+4AgLtLwNosRcu5IWoribFWUiUbPijq
	15uyGrWu9kfEk9fw5f69zVHbZJlrPnhg6AkjoVhATYXz6GiO2arcCNEayPh06XnLv3KNWCiw2C466
	RMloGObpK+QcMpyzv0XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslui-00CjP1-1c;
	Tue, 17 Oct 2023 15:23:20 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsluf-00CjNg-2R
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 15:23:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7F301BF208;
	Tue, 17 Oct 2023 15:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697556191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bVpv3WCrcUghzXlwdsPDnGHWlQrs/lOsKY8Fyqs4GAM=;
	b=DIhz5rgPZ36rK8mD+gdaQxrgw0fY9/A9YOcPdTjc33JOXHZBlVR7ziGYL/IkzSV2WD8qsu
	o1+OMbjIyKh+jUnWN2FsTxHXsjJ6GrdABSJjnpZAx85w1dOCOmdUm+Ffrza3nA/b1VzFUq
	/EAa/1gP+xXSmYOh8MpxexztnBM7aw5LyUGfVRuSji7LGLDmZeZG3YZndJhxXHTis5wQ5a
	TL3mIJQjVYQOOrJCV2PhoIXJ/r88LrVfprNviuTNsUtgNzl8aqwcXruVnzx9yCdHvkHvVt
	UxZDlDn/zDQPuPEUffcwqonekT4QHbxLUYfdaHyn735jx0AQOsd2Zr5+txiXFQ==
Date: Tue, 17 Oct 2023 17:23:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/6] i3c: master: svc: fix race condition in ibi work
 thread
Message-ID: <20231017172309.2a251393@xps-13>
In-Reply-To: <ZS6j/tpqEppFADk1@lizhi-Precision-Tower-5810>
References: <20231016153232.2851095-1-Frank.Li@nxp.com>
	<20231016153232.2851095-2-Frank.Li@nxp.com>
	<20231017161658.2de6d9f3@xps-13>
	<ZS6cRULPrwWjCL02@lizhi-Precision-Tower-5810>
	<20231017164946.623abd0d@xps-13>
	<ZS6j/tpqEppFADk1@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_082317_931889_09535955 
X-CRM114-Status: GOOD (  22.51  )
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

SGkgRnJhbmssCgpGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIFR1ZSwgMTcgT2N0IDIwMjMgMTE6
MTA6NTQgLTA0MDA6Cgo+IE9uIFR1ZSwgT2N0IDE3LCAyMDIzIGF0IDA0OjQ5OjQ2UE0gKzAyMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBGcmFuaywKPiA+IAo+ID4gRnJhbmsubGlAbnhw
LmNvbSB3cm90ZSBvbiBUdWUsIDE3IE9jdCAyMDIzIDEwOjM3OjU3IC0wNDAwOgo+ID4gICAKPiA+
ID4gT24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgMDQ6MTY6NThQTSArMDIwMCwgTWlxdWVsIFJheW5h
bCB3cm90ZTogIAo+ID4gPiA+IEhpIEZyYW5rLAo+ID4gPiA+IAo+ID4gPiA+IEZyYW5rLkxpQG54
cC5jb20gd3JvdGUgb24gTW9uLCAxNiBPY3QgMjAyMyAxMTozMjoyNyAtMDQwMDoKPiA+ID4gPiAg
ICAgCj4gPiA+ID4gPiBUaGUgaWJpIHdvcmsgdGhyZWFkIG9wZXJhdGVzIGFzeW5jaHJvbm91c2x5
IHdpdGggb3RoZXIgdHJhbnNmZXJzLCBzdWNoIGFzCj4gPiA+ID4gPiBzdmNfaTNjX21hc3Rlcl9w
cml2X3hmZXJzKCkuIEludHJvZHVjZXMgbXV0ZXggcHJvdGVjdGlvbiB0byBlbnN1cmUgdGhlICAg
IAo+ID4gPiA+IAo+ID4gPiA+IEludHJvZHVjZQo+ID4gPiA+ICAgICAKPiA+ID4gPiA+IGNvbXBs
ZXRpb24gb2YgdGhlIGVudGlyZSBpM2MvaTJjIHRyYW5zYWN0aW9uLiAgICAKPiA+ID4gPiAKPiA+
ID4gPiBEaWQgeW91IGV4cGVyaWVuY2UgZmF1bHR5IGNvbmRpdGlvbnMgb3Igd2FzIGl0IHJlcG9y
dGVkIHRoYW5rcyB0bwo+ID4gPiA+IHN0YXRpYyBhbmFseXNpcz8gICAgCj4gPiA+IAo+ID4gPiBZ
ZXMsIEkgbWV0LiBCdXQgaXQgbmVlZHMgbXkgc2xhdmUgcGFydCBwYXRjaGVzLCB3aGljaCB3aWxs
IGJlIHJlYWR5IHNlbnQKPiA+ID4gb3V0IHJldmlldyBzb29uLiAgCj4gPiAKPiA+IEkgYmVsaWV2
ZSBzZXZlcmFsIG9mIHRoZSAiZml4ZXMiIGluIHRoaXMgc2VyaWVzIGFyZSByZWxhdGVkIHRvIG5l
d2VyCj4gPiB1c2VzICh0eXBpY2FsbHkgeW91ciBpM2Mgc2xhdmUgc3VwcG9ydCkgd2hpY2ggd2Vy
ZSBub3QgaW4gdGhlIHNjb3BlIG9mCj4gPiB0aGUgb3JpZ2luYWwgc3VibWlzc2lvbi4gQXMgdGhl
c2UgbmV3IGZlYXR1cmVzIGFyZSBub3Qgc3VwcG9zZWQgdG8gYmUKPiA+IGJhY2twb3J0ZWQgaW4g
c3RhYmxlIGtlcm5lbHMgYW5kIGJlY2F1c2UgdGhlc2UgYXJlIG5ldyBjb3JuZXIgY2FzZXMseW91
Cj4gPiBtYXkgZHJvcCB0aGUgQ0M6L0ZpeGVzIHRhZ3MgdG8gYXZvaWQgdXNlbGVzcyBiYWNrcG9y
dHMuICAKPiAKPiBJIGRvbid0IHRoaW5rIHNvLiBUaGUgaXNzdWUgZXhpc3RzLiBKdXN0IGRpZmZp
Y3VsdCB0byBmaW5kIGl0LiBJZiB0aGVyZSBhcmUKPiBpM2MgZGV2aWNlIHRoYXQgdXNlIElCSSBm
cmVxdWVudGx5LiBUaGUgcHJvYmxlbSBzaG91bGQgYmUgdHJpZ2dlci4gTXkgY2FzZQo+IGp1c3Qg
bWFrZSBpdCBlYXN5IHRvIHRyaWdnZXIgdGhlIHByb2JsZW0uCj4gCj4gSW4gcHJldmlvdXMgZXhp
c3RlZCBjb2RlLCBJQkkgaXMgc3VwcG9ydGVkLgo+IAo+IEkgdGhpbmsgaXQgaXMgdHlwaWNhbCBj
YXNlLCB3aGljaCBuZWVkIENDL0ZpeGVzLgoKSSBhbSBub3QgdGFsa2luZyBhYm91dCB0aGlzIHBh
dGNoIGluIHBhcnRpY3VsYXIuCgo+IAo+IEZyYW5rCj4gCj4gPiAKPiA+IFNvbWUgb2YgdGhlbSBo
b3dldmVyIGFyZSByZWFsIGZpeGVzIGZvciBzaXR1YXRpb25zIHdlIG1heSBoYXBwZW4gd2l0aAo+
ID4gdGhlIGN1cnJlbnQgbGV2ZWwgb2Ygc3VwcG9ydCwgcGxlYXNlIGtlZXAgdGhlIHRhZ3MgaW4g
dGhlc2UsIGFuZCBtb3ZlCj4gPiB0aGVtIGFsbCB0byB0aGUgYmVnaW5uaW5nIG9mIHlvdXIgc2Vy
aWVzLgo+ID4gCj4gPiBUaGFua3MsCj4gPiBNaXF1w6hsICAKCgpUaGFua3MsCk1pcXXDqGwKCi0t
IApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
