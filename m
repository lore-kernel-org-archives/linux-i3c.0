Return-Path: <SRS0=zb1T=RC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2604C43381
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Feb 2019 13:09:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 807A420C01
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Feb 2019 13:09:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KMA6zk0T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 807A420C01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DRSwkgClY+JkBylEaUfFbeZY2TsMCC3lIoqir8sdznc=; b=KMA6zk0Tta1/55
	rwBppUH0znOp9c07HgGxaVykNmp8qTo87vtAxKsDBSuU1nWaYOUyhQBN8zi23jP8n2XApzRJXUAlP
	zem16P+GlARzhiRm140C18c/RLRV3GPPRGQb8oiqhFJvmNbki/5MYChMDZjv1dJ+a/h5dip4msvVk
	mrQfSNUkrfoRH8hJ2J/8Lg+Zu1Si2o0S2sjsQWdP4A5Kdrnq6vv/xrV7cy2SfrSv4oX7fgRxUKJMs
	bNVy+bNT5olq1fEBmq/kyuJuY1zc03k8iCe+foTO6CLa/Quej04zjEUanL1TBKelebofuDVrTLbuG
	+1pwYT9l/HgEjnkkULbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyyxj-0000Co-W1; Wed, 27 Feb 2019 13:09:27 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyyxh-0000CB-5s
 for linux-i3c@lists.infradead.org; Wed, 27 Feb 2019 13:09:26 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 67C4D27F908;
 Wed, 27 Feb 2019 13:09:21 +0000 (GMT)
Date: Wed, 27 Feb 2019 14:09:18 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: vitor <vitor.soares@synopsys.com>
Subject: Re: [PATCH v2 1/3] i3c: Drop support for I2C 10 bit addresing
Message-ID: <20190227140918.7ad6829e@collabora.com>
In-Reply-To: <6bed8050-74ea-5dcf-e750-62fa6c1580ef@synopsys.com>
References: <20190226142846.28294-1-pgaj@cadence.com>
 <20190226142846.28294-2-pgaj@cadence.com>
 <7607a23a-725d-b45a-a221-8a48bda301bd@synopsys.com>
 <20190227131004.66ed9fa1@collabora.com>
 <6bed8050-74ea-5dcf-e750-62fa6c1580ef@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_050925_483695_1650FF58 
X-CRM114-Status: GOOD (  27.16  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Przemyslaw Gaj <pgaj@cadence.com>, linux-i3c@lists.infradead.org,
 rafalc@cadence.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyNyBGZWIgMjAxOSAxMjo1Mjo0MiArMDAwMAp2aXRvciA8dml0b3Iuc29hcmVzQHN5
bm9wc3lzLmNvbT4gd3JvdGU6Cgo+IEhpLAo+IAo+IE9uIDI3LzAyLzE5IDEyOjEwLCBCb3JpcyBC
cmV6aWxsb24gd3JvdGU6Cj4gPiBIaSBWaXRvciwKPiA+Cj4gPiBPbiBXZWQsIDI3IEZlYiAyMDE5
IDEyOjA1OjMwICswMDAwCj4gPiB2aXRvciA8dml0b3Iuc29hcmVzQHN5bm9wc3lzLmNvbT4gd3Jv
dGU6Cj4gPiAgCj4gPj4gT24gMjYvMDIvMTkgMTQ6MjgsIFByemVteXNsYXcgR2FqIHdyb3RlOiAg
Cj4gPj4+IFRoaXMgcGF0Y2ggZHJvcHBzIHN1cHBvcnQgZm9yIEkyQyBkZXZpY2VzIHdpdGggMTAg
Yml0IGFkZHJlc3NpbmcuIFdoZW4gSTJDCj4gPj4+IGRldmljZSB3aXRoIDEwIGJpdCBhZGRyZXNz
IGlzIGRlZmluZWQgaW4gRFQsIEkzQyBtYXN0ZXIgcmVnaXN0cmF0aW9uIGZhaWxzLgo+ID4+Pgo+
ID4+PiBTaWduZWQtb2ZmLWJ5OiBQcnplbXlzbGF3IEdhaiA8cGdhakBjYWRlbmNlLmNvbT4KPiA+
Pj4KPiA+Pj4gLS0tCj4gPj4+Cj4gPj4+IE1haW4gY2hhbmdlcyBiZXR3ZWVuIHYxIGFuZCB2MiBh
cmU6Cj4gPj4+IC0gQWRkIGVycm9yIG1lc3NhZ2Ugd2hlbiByZWdpc3RlcmluZyBJMkMgZGV2aWNl
IHdpdGggMTAgYml0IGFkZHJlc3MuCj4gPj4+Cj4gPj4+IC0tLQo+ID4+PiAgZHJpdmVycy9pM2Mv
bWFzdGVyLmMgfCA5ICsrKysrKysrKwo+ID4+PiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMgYi9kcml2
ZXJzL2kzYy9tYXN0ZXIuYwo+ID4+PiBpbmRleCAyZGM2MjhkLi44YzFlMzY1IDEwMDY0NAo+ID4+
PiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+ID4+PiArKysgYi9kcml2ZXJzL2kzYy9tYXN0
ZXIuYwo+ID4+PiBAQCAtMTk2Miw2ICsxOTYyLDE1IEBAIG9mX2kzY19tYXN0ZXJfYWRkX2kyY19i
b2FyZGluZm8oc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyLAo+ID4+PiAgCWlm
IChyZXQpCj4gPj4+ICAJCXJldHVybiByZXQ7Cj4gPj4+ICAKPiA+Pj4gKwkvKiBUaGUgSTNDIFNw
ZWNpZmljYXRpb24gZG9lcyBub3QgY2xlYXJseSBzYXkgSTJDIGRldmljZXMgd2l0aCAxMC1iaXQK
Ck5pdHBpY2s6IHBsZWFzZSBkbyBub3QgdXNlIG5ldC1zdHlsZSBjb21tZW50cyBpbiB0aGUgSTND
IHN1YnN5c3RlbS4KClVzZQoKLyoKICogYmxhYmxhYmxhCiAqLwoKaW5zdGVhZC4KCj4gPj4+ICsJ
ICogYWRkcmVzcyBhcmUgc3VwcG9ydGVkLiBUaGVzZSBkZXZpY2VzIGNhbid0IGJlIHBhc3NlZCBw
cm9wZXJseSB0aHJvdWdoCj4gPj4+ICsJICogREVGU0xWUyBjb21tYW5kLgo+ID4+PiArCSAqLyAg
ICAKPiA+PiBJTU8gd2UganVzdCBuZWVkIHRvIHNheSAxMC1iaXQgYWRkcmVzcyBub3QgdXNlZCBv
ciBub3Qgc3VwcG9ydGVkIGluIGkzYy4gIAo+ID4gSSdkIGxpa2UgdG8ga2VlcCBhIGNsZWFyIGNv
bW1lbnQgb24gd2h5IGl0IGNhbm5vdCBzdXBwb3J0ZWQgcmlnaHQgbm93Cj4gPiBldmVuIHRob3Vn
aCB0aGUgc3BlYyBpcyB1bmNsZWFyIGFib3V0IHRoYXQuIElmIHRoZSBzcGVjIGlzIHVwZGF0ZWQg
dG8KPiA+IHN0YXRlIHRoYXQgSTJDIGRldnMgdXNpbmcgZXh0ZW5kZWQgYWRkcmVzc2VzIGFyZSBm
b3JiaWRkZW4sIHRoZW4gd2UnbGwKPiA+IHVwZGF0ZSB0aGlzIGNvbW1lbnQgYWNjb3JkaW5nbHku
ICAKPiAKPiBJJ20gbm90IHN1cmUgaWYgdGhlIHRlcm1zIGFyZW4ndCB0aGUgc2FtZSwKCkRvbid0
IHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbiwgc29ycnkuCgo+YnV0IGxldCdzIGtlZXAgdGhlIGNv
bW1lbnQuCj4gCj4gPiAgCj4gPj4+ICsJaWYgKGJvYXJkaW5mby0+YmFzZS5mbGFncyAmIEkyQ19D
TElFTlRfVEVOKSB7Cj4gPj4+ICsJCWRldl9lcnIoJm1hc3Rlci0+ZGV2LCAiSTJDIGRldmljZSB3
aXRoIDEwIGJpdCBhZGRyZXNzIG5vdCBzdXBwb3J0ZWQuIik7Cj4gPj4+ICsJCXJldHVybiAtRU5P
VFNVUFA7Cj4gPj4+ICsJfQo+ID4+PiArCj4gPj4+ICAJLyogTFZSIGlzIGVuY29kZWQgaW4gcmVn
WzJdLiAqLwo+ID4+PiAgCWJvYXJkaW5mby0+bHZyID0gcmVnWzJdOwo+ID4+PiAgICAgIAo+ID4+
IEFsc28gbmVlZCB0byBjaGFuZ2U6Cj4gPj4KPiA+PiAjZGVmaW5lIEkyQ19NQVhfQUREUsKgwqDC
oCDCoMKgwqAgwqDCoMKgIEdFTk1BU0soOSwgMCkKPiA+PiB0bwo+ID4+ICNkZWZpbmUgSTJDX01B
WF9BRERSwqDCoMKgIMKgwqDCoCDCoMKgwqAgR0VOTUFTSyg2LCAwKQo+ID4+IGluIG1hc3Rlci5o
IGZpbGUgIAo+ID4gWWVwLCB5b3UgY2FuIHJlZHVjZSB0aGUgYWRkcmVzcyBzcGFjZS4KPiA+ICAK
PiA+PiBOb3Qgc3VyZSBhYm91dDoKPiA+PiB1bnNpZ25lZCBsb25nIGFkZHJzbG90c1soKEkyQ19N
QVhfQUREUiArIDEpICogMikgLyBCSVRTX1BFUl9MT05HXTsKPiA+PiBAQm9yaXMgY2FuIHlvdSBj
aGVjayB0aGlzIHBhcnQ/ICAKPiA+IFRoaXMgcGFydCBpcyBzdGlsbCB2YWxpZCwgbm8gbmVlZCB0
byB1cGRhdGUgaXQgYXMgeW91IGFscmVhZHkgdXBkYXRlZAo+ID4gSTJDX01BWF9BRERSLgo+ID4K
PiA+IFRoYW5rcyBmb3IgdGhlIHJldmlldy4KPiA+Cj4gPiBCb3JpcyAgCj4gCj4gQWxzbyB3ZSBj
YW4gbWFrZSBpMmNfYWxnb3JpdGhtLmZ1bmN0aW9uYWxpdHkgPSBJMkNfRlVOQ19TTUJVU19FTVVM
IHwgSTJDX0ZVTkNfSTJDLCBhbmQgaW4gdGhpcyB3YXkgd2Ugd29uJ3QgbmVlZCAtPmkyY19mdW5j
KCkgYW5kIGF2b2lkIHRoZSBJMkNfRlVOQ18xMEJJVF9BRERSIGZsYWcgb24gaG9zdCBjb250cm9s
bGVyIHNpZGUuCgpBY2suIExldCdzIHJpcCAtPmkyY19mdW5jKCkgb3V0IGFuZCByZXR1cm4gSTJD
X0ZVTkNfU01CVVNfRU1VTCB8CkkyQ19GVU5DX0kyQyBmb3IgZXZlcnlvbmUuIFdlJ2xsIGFkZCBp
dCBiYWNrIGlmIHNvbWUgZHJpdmVycyB3YW50IHRvCnN1cHBvcnQgU01CVVMgbmF0aXZlbHkgb3Ig
aWYgMTBiaXQgYWRkcmVzc2luZyBhcHBlYXJzIHRvIGJlIG5lZWRlZCBhdApzb21lIHBvaW50LgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtaTNj
IG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
