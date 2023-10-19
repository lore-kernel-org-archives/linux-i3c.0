Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706C1CDB483
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Oct 2023 06:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I1XeuhJWMsGDeZqZi5YONbdNIQFQ5LNYGHEE4M4QZtY=; b=JsRxJyeTfE72Sj
	/oiVL0tE4qdUDRMAqhrQMSZirEJrNZJ7+fCDKmejX7CPAlLP3JxbvoUnd1G6p+tC4jYzGdEoTFeyb
	Aow8pep2O2OsU52rEmETt93pSBs+kidPHKevxgysBBLfNLqgVQQ05zaryMDL1G7ajuDfdvMOaNlNT
	wnlrZddQIKxQ6esarKeqM8655Ekk6M+4sKdCEulr/gHjX0qPONAE9yXDtqBu3sj8ftHI+wBph7biI
	0F6QgaQN3bYkMOQLyofxU0LZQxQkuNKQVvQwz3mfbcfNV9y/i0c6UdCSlo1ZiucEswFBSPMCcwSGs
	LuDD88Me4s0sVDdizyeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtMX8-00GVmo-2q;
	Thu, 19 Oct 2023 06:29:26 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtMX6-00GVlR-1i
	for linux-i3c@lists.infradead.org;
	Thu, 19 Oct 2023 06:29:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 686D21BF209;
	Thu, 19 Oct 2023 06:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697696959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hBt1h1Kqzm6IuFVzkjAP6Bod2gcSjnAEsTh8WsDQW+Y=;
	b=j0GI8bvBwAaZ2zM1B3cTzCy0Jv55rxzHDlyv1qSHtgTmX2kZuUlsbZEHTpDnnwaEacjmdB
	iRrKQPJFAnWLWKjvKf1fiHoUWiQjPIDAzestnqWR+1Z8SibH8ZvI0CZ37v+qmmi8qWD3ya
	fmXNoSTxkblCQqbvGnEGddW0JsZgyVw1uCCsBx5ff/frvQOHlfAhUH6exUMuVU61GQy22b
	v9SH0dh++idyoJqEXZJnE9h6iPIoBclGL7XIYmzTR4r/U9D/8CwClSRidS4IpRzWyGSmkt
	ahSg9w6PsVQCjTj9NYUznGNiyO9hLHRzyV0Vo2TOnW3g3pJHuBJqDA7etV+tkw==
Date: Thu, 19 Oct 2023 08:29:16 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 Resent 3/6] i3c: master: svc: fix ibi may not return
 mandatory data byte
Message-ID: <20231019082916.25a536fd@xps-13>
In-Reply-To: <20231018155926.3305476-4-Frank.Li@nxp.com>
References: <20231018155926.3305476-1-Frank.Li@nxp.com>
	<20231018155926.3305476-4-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_232924_708046_367924C1 
X-CRM114-Status: GOOD (  18.01  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFdlZCwgMTggT2N0IDIwMjMgMTE6
NTk6MjMgLTA0MDA6Cgo+IE1TVEFUVVNbUlhQRU5EXSBpcyBvbmx5IHVwZGF0ZWQgYWZ0ZXIgdGhl
IGRhdGEgdHJhbnNmZXIgY3ljbGUgc3RhcnRlZC4gVGhpcwo+IGNyZWF0ZXMgYW4gaXNzdWUgd2hl
biB0aGUgSTNDIGNsb2NrIGlzIHNsb3csIGFuZCB0aGUgQ1BVIGlzIHJ1bm5pbmcgZmFzdAo+IGVu
b3VnaCB0aGF0IE1TVEFUVVNbUlhQRU5EXSBtYXkgbm90IGJlIHVwZGF0ZWQgd2hlbiB0aGUgY29k
ZSByZWFjaCBjaGVja2luZwo+IHBvaW50LiBBcyBhIHJlc3VsdCwgbWFuZGF0b3J5IGRhdGEgYXJl
IGJlaW5nIG1pc3NlZC4KCnJlYWNoZXMKCmNhbiBiZSBtaXNzZWQKCj4gQWRkIGEgd2FpdCBmb3Ig
TVNUQVRVU1tDT01QTEVURV0gdG8gZW5zdXJlIHRoYXQgYWxsIG1hbmRhdG9yeSBkYXRhIGlzCj4g
YWxyZWFkeSBpbiBGSUZPLgo+IAo+IEZpeGVzOiBkZDNjNTI4NDZkNTkgKCJpM2M6IG1hc3Rlcjog
c3ZjOiBBZGQgU2lsdmFjbyBJM0MgbWFzdGVyIGRyaXZlciIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtl
cm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KPiAt
LS0KPiAKPiBOb3RlczoKPiAgICAgQ2hhbmdlIGZyb20gdjEgdG8gdjIKPiAgICAgLSB1cGRhdGUg
Y29tbWl0IG1lc3NhZ2UKPiAgICAgICBpdCBhbHNvIHdvcmtzIHdpdGhvdXQgbWFuZGF0b3J5IGJ5
dGVzCgpUaGlzIGNvdWxkIGJlIG1lbnRpb25lZCBpbiB0aGUgY29tbWl0IGxvZz8KCj4gCj4gIGRy
aXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIHwgOCArKysrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21h
c3Rlci9zdmMtaTNjLW1hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVy
LmMKPiBpbmRleCBhYmViZWY2NjZiMmJiLi5kZDA2YjdjOTMzM2YxIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9pM2MvbWFz
dGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiBAQCAtMzMyLDYgKzMzMiw3IEBAIHN0YXRpYyBpbnQgc3Zj
X2kzY19tYXN0ZXJfaGFuZGxlX2liaShzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlciwKPiAg
CXN0cnVjdCBpM2NfaWJpX3Nsb3QgKnNsb3Q7Cj4gIAl1bnNpZ25lZCBpbnQgY291bnQ7Cj4gIAl1
MzIgbWRhdGFjdHJsOwo+ICsJaW50IHJldCwgdmFsOwo+ICAJdTggKmJ1ZjsKPiAgCj4gIAlzbG90
ID0gaTNjX2dlbmVyaWNfaWJpX2dldF9mcmVlX3Nsb3QoZGF0YS0+aWJpX3Bvb2wpOwo+IEBAIC0z
NDEsNiArMzQyLDEzIEBAIHN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfaGFuZGxlX2liaShzdHJ1
Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlciwKPiAgCXNsb3QtPmxlbiA9IDA7Cj4gIAlidWYgPSBz
bG90LT5kYXRhOwo+ICAKPiArCXJldCA9IHJlYWRsX3JlbGF4ZWRfcG9sbF90aW1lb3V0KG1hc3Rl
ci0+cmVncyArIFNWQ19JM0NfTVNUQVRVUywgdmFsLAo+ICsJCQkJCQlTVkNfSTNDX01TVEFUVVNf
Q09NUExFVEUodmFsKSwgMCwgMTAwMCk7Cj4gKwlpZiAocmV0KSB7Cj4gKwkJZGV2X2VycihtYXN0
ZXItPmRldiwgIlRpbWVvdXQgd2hlbiBwb2xsaW5nIGZvciBDT01QTEVURVxuIik7Cj4gKwkJcmV0
dXJuIHJldDsKPiArCX0KPiArCj4gIAl3aGlsZSAoU1ZDX0kzQ19NU1RBVFVTX1JYUEVORChyZWFk
bChtYXN0ZXItPnJlZ3MgKyBTVkNfSTNDX01TVEFUVVMpKSAgJiYKPiAgCSAgICAgICBzbG90LT5s
ZW4gPCBTVkNfSTNDX0ZJRk9fU0laRSkgewo+ICAJCW1kYXRhY3RybCA9IHJlYWRsKG1hc3Rlci0+
cmVncyArIFNWQ19JM0NfTURBVEFDVFJMKTsKCgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1p
M2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
