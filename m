Return-Path: <SRS0=zb1T=RC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD119C43381
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Feb 2019 12:53:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB83B2075B
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Feb 2019 12:53:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WjJrLjnB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="h2Z0clDt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB83B2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MwegIDs0HeSZG8SLPdHx7YunMyJrIv1+nofN2w1Szas=; b=WjJrLjnBMp3a11
	m9wu3LxZ8YbKfTWRphR53ezondOHG+BsDSvI/U28RZJ1x0fDxj//fP5Nu9IqSMS/uvNC/r6QxCv3p
	0e/POQ1bClLiq86XGOlvocxMjoKkngk6UHajqCbt3I8qyb7kmk6R/FgZvkK+kZXfNDtpt0dyNr7cE
	br4NjitcLSZq6RQyRzduWkYAcm4u0HIhngficvVqtcOtPexDaECOJUYtk8HxHEyioZi7dYlVbmoUF
	07EAu4ywXEKH9IiaRanVG1GBjy6WS9eh3OiCQGWjL8Zq1XrSIcPUGvCc0XWzu6rdh5e/ZxmaaaMEK
	pNXNfkwtdKTzPLwtiSdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyyiE-0004Fb-7T; Wed, 27 Feb 2019 12:53:26 +0000
Received: from smtprelay.synopsys.com ([198.182.47.9])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyyiC-0004FF-0W
 for linux-i3c@lists.infradead.org; Wed, 27 Feb 2019 12:53:25 +0000
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com
 [10.13.135.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id DF01D24E24F4;
 Wed, 27 Feb 2019 04:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1551272002; bh=Rvu61eY2DvNUsQCIBZW4dn+Y5id66lQ596EiUY6KZnM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To:From;
 b=h2Z0clDtX5op3F6h8XhVXM2e9hAS03zSWozAkej6kHaQYkIjQI9O74sAomUQKtghf
 Bv9G7gc2qHYBS/DjQ4OZhw0tdNEhTZOURmaD1whH3c0fjnIQUFiuBlMnnJwJjxi3ul
 HXmaswzNJtBNfSS2Db4jYZupr+xzAa0bYz7t1ur5BM90YN4fJdHwRUmDiDwlBg87Sw
 syoi39PA4HIHSiRozYVWCoVhPs/AYw6nbyb2V5G1AVsrW/GmWqksnxNt9kMqGyLlPX
 uERIrnaK/5GQlj+1j56NexrAtmC9+Oe8Pb/8KVeYWfCYqOEo/2XFEcL5VkM/d6bvDo
 fLD8LsvwIcI6A==
Received: from US01WXQAHTC1.internal.synopsys.com
 (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 7F62BA005D;
 Wed, 27 Feb 2019 12:53:21 +0000 (UTC)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 Feb 2019 04:52:50 -0800
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 DE02WEHTCA.internal.synopsys.com (10.225.19.92) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 Feb 2019 13:52:47 +0100
Received: from [10.0.2.15] (10.107.25.89) by DE02WEHTCB.internal.synopsys.com
 (10.225.19.80) with Microsoft SMTP Server (TLS) id 14.3.408.0;
 Wed, 27 Feb 2019 13:52:47 +0100
Subject: Re: [PATCH v2 1/3] i3c: Drop support for I2C 10 bit addresing
To: Boris Brezillon <boris.brezillon@collabora.com>,
 vitor <vitor.soares@synopsys.com>
References: <20190226142846.28294-1-pgaj@cadence.com>
 <20190226142846.28294-2-pgaj@cadence.com>
 <7607a23a-725d-b45a-a221-8a48bda301bd@synopsys.com>
 <20190227131004.66ed9fa1@collabora.com>
From: vitor <vitor.soares@synopsys.com>
Message-ID: <6bed8050-74ea-5dcf-e750-62fa6c1580ef@synopsys.com>
Date: Wed, 27 Feb 2019 12:52:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190227131004.66ed9fa1@collabora.com>
Content-Language: en-US
X-Originating-IP: [10.107.25.89]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_045324_068562_3CA8D6B8 
X-CRM114-Status: GOOD (  24.49  )
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

SGksCgpPbiAyNy8wMi8xOSAxMjoxMCwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IEhpIFZpdG9y
LAo+Cj4gT24gV2VkLCAyNyBGZWIgMjAxOSAxMjowNTozMCArMDAwMAo+IHZpdG9yIDx2aXRvci5z
b2FyZXNAc3lub3BzeXMuY29tPiB3cm90ZToKPgo+PiBPbiAyNi8wMi8xOSAxNDoyOCwgUHJ6ZW15
c2xhdyBHYWogd3JvdGU6Cj4+PiBUaGlzIHBhdGNoIGRyb3BwcyBzdXBwb3J0IGZvciBJMkMgZGV2
aWNlcyB3aXRoIDEwIGJpdCBhZGRyZXNzaW5nLiBXaGVuIEkyQwo+Pj4gZGV2aWNlIHdpdGggMTAg
Yml0IGFkZHJlc3MgaXMgZGVmaW5lZCBpbiBEVCwgSTNDIG1hc3RlciByZWdpc3RyYXRpb24gZmFp
bHMuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUHJ6ZW15c2xhdyBHYWogPHBnYWpAY2FkZW5jZS5j
b20+Cj4+Pgo+Pj4gLS0tCj4+Pgo+Pj4gTWFpbiBjaGFuZ2VzIGJldHdlZW4gdjEgYW5kIHYyIGFy
ZToKPj4+IC0gQWRkIGVycm9yIG1lc3NhZ2Ugd2hlbiByZWdpc3RlcmluZyBJMkMgZGV2aWNlIHdp
dGggMTAgYml0IGFkZHJlc3MuCj4+Pgo+Pj4gLS0tCj4+PiAgZHJpdmVycy9pM2MvbWFzdGVyLmMg
fCA5ICsrKysrKysrKwo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPj4+Cj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIu
Ywo+Pj4gaW5kZXggMmRjNjI4ZC4uOGMxZTM2NSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvaTNj
L21hc3Rlci5jCj4+PiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+Pj4gQEAgLTE5NjIsNiAr
MTk2MiwxNSBAQCBvZl9pM2NfbWFzdGVyX2FkZF9pMmNfYm9hcmRpbmZvKHN0cnVjdCBpM2NfbWFz
dGVyX2NvbnRyb2xsZXIgKm1hc3RlciwKPj4+ICAJaWYgKHJldCkKPj4+ICAJCXJldHVybiByZXQ7
Cj4+PiAgCj4+PiArCS8qIFRoZSBJM0MgU3BlY2lmaWNhdGlvbiBkb2VzIG5vdCBjbGVhcmx5IHNh
eSBJMkMgZGV2aWNlcyB3aXRoIDEwLWJpdAo+Pj4gKwkgKiBhZGRyZXNzIGFyZSBzdXBwb3J0ZWQu
IFRoZXNlIGRldmljZXMgY2FuJ3QgYmUgcGFzc2VkIHByb3Blcmx5IHRocm91Z2gKPj4+ICsJICog
REVGU0xWUyBjb21tYW5kLgo+Pj4gKwkgKi8gIAo+PiBJTU8gd2UganVzdCBuZWVkIHRvIHNheSAx
MC1iaXQgYWRkcmVzcyBub3QgdXNlZCBvciBub3Qgc3VwcG9ydGVkIGluIGkzYy4KPiBJJ2QgbGlr
ZSB0byBrZWVwIGEgY2xlYXIgY29tbWVudCBvbiB3aHkgaXQgY2Fubm90IHN1cHBvcnRlZCByaWdo
dCBub3cKPiBldmVuIHRob3VnaCB0aGUgc3BlYyBpcyB1bmNsZWFyIGFib3V0IHRoYXQuIElmIHRo
ZSBzcGVjIGlzIHVwZGF0ZWQgdG8KPiBzdGF0ZSB0aGF0IEkyQyBkZXZzIHVzaW5nIGV4dGVuZGVk
IGFkZHJlc3NlcyBhcmUgZm9yYmlkZGVuLCB0aGVuIHdlJ2xsCj4gdXBkYXRlIHRoaXMgY29tbWVu
dCBhY2NvcmRpbmdseS4KCkknbSBub3Qgc3VyZSBpZiB0aGUgdGVybXMgYXJlbid0IHRoZSBzYW1l
LCBidXQgbGV0J3Mga2VlcCB0aGUgY29tbWVudC4KCj4KPj4+ICsJaWYgKGJvYXJkaW5mby0+YmFz
ZS5mbGFncyAmIEkyQ19DTElFTlRfVEVOKSB7Cj4+PiArCQlkZXZfZXJyKCZtYXN0ZXItPmRldiwg
IkkyQyBkZXZpY2Ugd2l0aCAxMCBiaXQgYWRkcmVzcyBub3Qgc3VwcG9ydGVkLiIpOwo+Pj4gKwkJ
cmV0dXJuIC1FTk9UU1VQUDsKPj4+ICsJfQo+Pj4gKwo+Pj4gIAkvKiBMVlIgaXMgZW5jb2RlZCBp
biByZWdbMl0uICovCj4+PiAgCWJvYXJkaW5mby0+bHZyID0gcmVnWzJdOwo+Pj4gICAgCj4+IEFs
c28gbmVlZCB0byBjaGFuZ2U6Cj4+Cj4+ICNkZWZpbmUgSTJDX01BWF9BRERSwqDCoMKgIMKgwqDC
oCDCoMKgwqAgR0VOTUFTSyg5LCAwKQo+PiB0bwo+PiAjZGVmaW5lIEkyQ19NQVhfQUREUsKgwqDC
oCDCoMKgwqAgwqDCoMKgIEdFTk1BU0soNiwgMCkKPj4gaW4gbWFzdGVyLmggZmlsZQo+IFllcCwg
eW91IGNhbiByZWR1Y2UgdGhlIGFkZHJlc3Mgc3BhY2UuCj4KPj4gTm90IHN1cmUgYWJvdXQ6Cj4+
IHVuc2lnbmVkIGxvbmcgYWRkcnNsb3RzWygoSTJDX01BWF9BRERSICsgMSkgKiAyKSAvIEJJVFNf
UEVSX0xPTkddOwo+PiBAQm9yaXMgY2FuIHlvdSBjaGVjayB0aGlzIHBhcnQ/Cj4gVGhpcyBwYXJ0
IGlzIHN0aWxsIHZhbGlkLCBubyBuZWVkIHRvIHVwZGF0ZSBpdCBhcyB5b3UgYWxyZWFkeSB1cGRh
dGVkCj4gSTJDX01BWF9BRERSLgo+Cj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3Lgo+Cj4gQm9yaXMK
CkFsc28gd2UgY2FuIG1ha2UgaTJjX2FsZ29yaXRobS5mdW5jdGlvbmFsaXR5ID0gSTJDX0ZVTkNf
U01CVVNfRU1VTCB8IEkyQ19GVU5DX0kyQywgYW5kIGluIHRoaXMgd2F5IHdlIHdvbid0IG5lZWQg
LT5pMmNfZnVuYygpIGFuZCBhdm9pZCB0aGUgSTJDX0ZVTkNfMTBCSVRfQUREUiBmbGFnIG9uIGhv
c3QgY29udHJvbGxlciBzaWRlLgoKQmVzdCByZWdhcmRzLApWaXRvciBTb2FyZXMKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1pM2MgbWFpbGlu
ZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
