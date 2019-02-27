Return-Path: <SRS0=zb1T=RC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71239C43381
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Feb 2019 12:10:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 416022075B
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Feb 2019 12:10:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lBY9xx5S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 416022075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vgbyYt2gUp8rH6v76RjpBLhHvDJiIsVvXIlZNlukYdI=; b=lBY9xx5SCAbpDY
	Y6jA64V+EPD7B0BhgdCPhIgCvFlhqiC5Sa4FGOtt8jm2ckWU8bpZ8SbDnuPhwoWToCveH7+IKnbGQ
	yw9wmBGW/ed9DX7srW8Q5WZr+oftyB26ndk5SHwjOlQ0vyROjesqWdRFNSJhhX8Y0rTtlMk9C4/s6
	ZZW5kKExOQKCNnvCzE8cfFL8CbS2KfGIBi44q0SXrsUVmEf555R8GYbUgca4lZjKMdcpiUzYnSJdn
	oqlVxvtvAvlbtAIivdyzo/D0L54D3206Zlo1EBOEWXv9aDSjkLC7ofBTP5EKpbLpWHG50vGoexpTP
	WgWAsgYhho6KOQwYrJ0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyy2P-00062p-QF; Wed, 27 Feb 2019 12:10:13 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyy2M-000620-HC
 for linux-i3c@lists.infradead.org; Wed, 27 Feb 2019 12:10:12 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BE8C527FD90;
 Wed, 27 Feb 2019 12:10:07 +0000 (GMT)
Date: Wed, 27 Feb 2019 13:10:04 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: vitor <vitor.soares@synopsys.com>
Subject: Re: [PATCH v2 1/3] i3c: Drop support for I2C 10 bit addresing
Message-ID: <20190227131004.66ed9fa1@collabora.com>
In-Reply-To: <7607a23a-725d-b45a-a221-8a48bda301bd@synopsys.com>
References: <20190226142846.28294-1-pgaj@cadence.com>
 <20190226142846.28294-2-pgaj@cadence.com>
 <7607a23a-725d-b45a-a221-8a48bda301bd@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_041010_703255_B27915EF 
X-CRM114-Status: GOOD (  20.25  )
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

SGkgVml0b3IsCgpPbiBXZWQsIDI3IEZlYiAyMDE5IDEyOjA1OjMwICswMDAwCnZpdG9yIDx2aXRv
ci5zb2FyZXNAc3lub3BzeXMuY29tPiB3cm90ZToKCj4gT24gMjYvMDIvMTkgMTQ6MjgsIFByemVt
eXNsYXcgR2FqIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBkcm9wcHMgc3VwcG9ydCBmb3IgSTJDIGRl
dmljZXMgd2l0aCAxMCBiaXQgYWRkcmVzc2luZy4gV2hlbiBJMkMKPiA+IGRldmljZSB3aXRoIDEw
IGJpdCBhZGRyZXNzIGlzIGRlZmluZWQgaW4gRFQsIEkzQyBtYXN0ZXIgcmVnaXN0cmF0aW9uIGZh
aWxzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFByemVteXNsYXcgR2FqIDxwZ2FqQGNhZGVuY2Uu
Y29tPgo+ID4KPiA+IC0tLQo+ID4KPiA+IE1haW4gY2hhbmdlcyBiZXR3ZWVuIHYxIGFuZCB2MiBh
cmU6Cj4gPiAtIEFkZCBlcnJvciBtZXNzYWdlIHdoZW4gcmVnaXN0ZXJpbmcgSTJDIGRldmljZSB3
aXRoIDEwIGJpdCBhZGRyZXNzLgo+ID4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvaTNjL21hc3Rlci5j
IHwgOSArKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVy
LmMKPiA+IGluZGV4IDJkYzYyOGQuLjhjMWUzNjUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2kz
Yy9tYXN0ZXIuYwo+ID4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiA+IEBAIC0xOTYyLDYg
KzE5NjIsMTUgQEAgb2ZfaTNjX21hc3Rlcl9hZGRfaTJjX2JvYXJkaW5mbyhzdHJ1Y3QgaTNjX21h
c3Rlcl9jb250cm9sbGVyICptYXN0ZXIsCj4gPiAgCWlmIChyZXQpCj4gPiAgCQlyZXR1cm4gcmV0
Owo+ID4gIAo+ID4gKwkvKiBUaGUgSTNDIFNwZWNpZmljYXRpb24gZG9lcyBub3QgY2xlYXJseSBz
YXkgSTJDIGRldmljZXMgd2l0aCAxMC1iaXQKPiA+ICsJICogYWRkcmVzcyBhcmUgc3VwcG9ydGVk
LiBUaGVzZSBkZXZpY2VzIGNhbid0IGJlIHBhc3NlZCBwcm9wZXJseSB0aHJvdWdoCj4gPiArCSAq
IERFRlNMVlMgY29tbWFuZC4KPiA+ICsJICovICAKPiAKPiBJTU8gd2UganVzdCBuZWVkIHRvIHNh
eSAxMC1iaXQgYWRkcmVzcyBub3QgdXNlZCBvciBub3Qgc3VwcG9ydGVkIGluIGkzYy4KCkknZCBs
aWtlIHRvIGtlZXAgYSBjbGVhciBjb21tZW50IG9uIHdoeSBpdCBjYW5ub3Qgc3VwcG9ydGVkIHJp
Z2h0IG5vdwpldmVuIHRob3VnaCB0aGUgc3BlYyBpcyB1bmNsZWFyIGFib3V0IHRoYXQuIElmIHRo
ZSBzcGVjIGlzIHVwZGF0ZWQgdG8Kc3RhdGUgdGhhdCBJMkMgZGV2cyB1c2luZyBleHRlbmRlZCBh
ZGRyZXNzZXMgYXJlIGZvcmJpZGRlbiwgdGhlbiB3ZSdsbAp1cGRhdGUgdGhpcyBjb21tZW50IGFj
Y29yZGluZ2x5LgoKPiAKPiA+ICsJaWYgKGJvYXJkaW5mby0+YmFzZS5mbGFncyAmIEkyQ19DTElF
TlRfVEVOKSB7Cj4gPiArCQlkZXZfZXJyKCZtYXN0ZXItPmRldiwgIkkyQyBkZXZpY2Ugd2l0aCAx
MCBiaXQgYWRkcmVzcyBub3Qgc3VwcG9ydGVkLiIpOwo+ID4gKwkJcmV0dXJuIC1FTk9UU1VQUDsK
PiA+ICsJfQo+ID4gKwo+ID4gIAkvKiBMVlIgaXMgZW5jb2RlZCBpbiByZWdbMl0uICovCj4gPiAg
CWJvYXJkaW5mby0+bHZyID0gcmVnWzJdOwo+ID4gICAgCj4gCj4gQWxzbyBuZWVkIHRvIGNoYW5n
ZToKPiAKPiAjZGVmaW5lIEkyQ19NQVhfQUREUsKgwqDCoCDCoMKgwqAgwqDCoMKgIEdFTk1BU0so
OSwgMCkKPiB0bwo+ICNkZWZpbmUgSTJDX01BWF9BRERSwqDCoMKgIMKgwqDCoCDCoMKgwqAgR0VO
TUFTSyg2LCAwKQo+IGluIG1hc3Rlci5oIGZpbGUKClllcCwgeW91IGNhbiByZWR1Y2UgdGhlIGFk
ZHJlc3Mgc3BhY2UuCgo+IAo+IE5vdCBzdXJlIGFib3V0Ogo+IHVuc2lnbmVkIGxvbmcgYWRkcnNs
b3RzWygoSTJDX01BWF9BRERSICsgMSkgKiAyKSAvIEJJVFNfUEVSX0xPTkddOwo+IEBCb3JpcyBj
YW4geW91IGNoZWNrIHRoaXMgcGFydD8KClRoaXMgcGFydCBpcyBzdGlsbCB2YWxpZCwgbm8gbmVl
ZCB0byB1cGRhdGUgaXQgYXMgeW91IGFscmVhZHkgdXBkYXRlZApJMkNfTUFYX0FERFIuCgpUaGFu
a3MgZm9yIHRoZSByZXZpZXcuCgpCb3JpcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWkzYwo=
