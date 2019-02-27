Return-Path: <SRS0=zb1T=RC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD1DC00319
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Feb 2019 12:05:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F88A20C01
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Feb 2019 12:05:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MLIZcWqZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EBSNOpdl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F88A20C01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8ZF3v0rYWQgpmoxRJsetz/vsp7hCesYryyQuNkIB/Y=; b=MLIZcWqZk6f78f
	8XqLWMqP8lwXwPraW3F8RhJkEYyi+qKZ8NJhAqJvNX9O/II0vn7phIT3c6JuoOzEGw/yXWh5DdzBh
	4cDzP00L5mFLmx1jdNl3u1ltzSYS8NmQFOBMrgFoJwbF1Un4H0ZNLe3nSVf0orcIJR5SXy7OmQ8k+
	yoob+lL+6NSbiByX7yrgKmhQT9P8exHelMxXhUyrG1KHWhiixlGPonVePNQVkg1UmoOOh47fr8bq8
	eCR2CR6ekgd0aNbyYjCL903n/mI259owLYo9En1SzZ+L97H7eOJcPiJr4EgTG7ZfZjyyx3mPQyimo
	VYvsx6rnutUo5O9o25/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyxy4-0004YC-Ic; Wed, 27 Feb 2019 12:05:44 +0000
Received: from smtprelay.synopsys.com ([198.182.60.111])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyxxy-0004PA-PG
 for linux-i3c@lists.infradead.org; Wed, 27 Feb 2019 12:05:41 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id 9EE0A10C1282;
 Wed, 27 Feb 2019 04:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1551269137; bh=gsSbET5kTlv2Y2PL/LlW/JH4pg3IFQN1UatuK2BoY50=;
 h=Subject:To:CC:References:From:Date:In-Reply-To:From;
 b=EBSNOpdlFyqhIvOhuROIVGKrLwt2fE/5vfNbZKz5Jul9zFgKaTrD3LPnyHBXo1tNY
 UidT2nXdvvV8hN/8nscBfYS3AfxZPlJdUDITBFMZfGHcZM2wm138vTRWuU4GdxSQOp
 h/xGhlmmOZmQ9swZOmJDQlZb4TnpYme2zQMjXq5bRbJ1EBU8YSVw41tABtwg5IX/lX
 9ElBNgSiSlGjo7XaDrx6vYaCoFGnTCPC1m+Ow1BSuZL/iId5IkC9TaMhjgPPvOCTMV
 f0ZkQCYn+xw3L7WKVi4cyaWKbi+1sWfJ+EU8ICe83a+3tAh0jpDFZSZ474KFGxhrMo
 LfYUtjZKAq5rg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 101C8A0079;
 Wed, 27 Feb 2019 12:05:36 +0000 (UTC)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 Feb 2019 04:05:36 -0800
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 DE02WEHTCA.internal.synopsys.com (10.225.19.92) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 Feb 2019 13:05:34 +0100
Received: from [10.0.2.15] (10.107.25.89) by DE02WEHTCB.internal.synopsys.com
 (10.225.19.80) with Microsoft SMTP Server (TLS) id 14.3.408.0;
 Wed, 27 Feb 2019 13:05:34 +0100
Subject: Re: [PATCH v2 1/3] i3c: Drop support for I2C 10 bit addresing
To: Przemyslaw Gaj <pgaj@cadence.com>, <bbrezillon@kernel.org>
References: <20190226142846.28294-1-pgaj@cadence.com>
 <20190226142846.28294-2-pgaj@cadence.com>
From: vitor <vitor.soares@synopsys.com>
Message-ID: <7607a23a-725d-b45a-a221-8a48bda301bd@synopsys.com>
Date: Wed, 27 Feb 2019 12:05:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190226142846.28294-2-pgaj@cadence.com>
Content-Language: en-US
X-Originating-IP: [10.107.25.89]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_040539_014195_E4C94DD2 
X-CRM114-Status: GOOD (  18.95  )
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
Cc: linux-i3c@lists.infradead.org, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

CgpPbiAyNi8wMi8xOSAxNDoyOCwgUHJ6ZW15c2xhdyBHYWogd3JvdGU6Cj4gVGhpcyBwYXRjaCBk
cm9wcHMgc3VwcG9ydCBmb3IgSTJDIGRldmljZXMgd2l0aCAxMCBiaXQgYWRkcmVzc2luZy4gV2hl
biBJMkMKPiBkZXZpY2Ugd2l0aCAxMCBiaXQgYWRkcmVzcyBpcyBkZWZpbmVkIGluIERULCBJM0Mg
bWFzdGVyIHJlZ2lzdHJhdGlvbiBmYWlscy4KPgo+IFNpZ25lZC1vZmYtYnk6IFByemVteXNsYXcg
R2FqIDxwZ2FqQGNhZGVuY2UuY29tPgo+Cj4gLS0tCj4KPiBNYWluIGNoYW5nZXMgYmV0d2VlbiB2
MSBhbmQgdjIgYXJlOgo+IC0gQWRkIGVycm9yIG1lc3NhZ2Ugd2hlbiByZWdpc3RlcmluZyBJMkMg
ZGV2aWNlIHdpdGggMTAgYml0IGFkZHJlc3MuCj4KPiAtLS0KPiAgZHJpdmVycy9pM2MvbWFzdGVy
LmMgfCA5ICsrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+
IGluZGV4IDJkYzYyOGQuLjhjMWUzNjUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVy
LmMKPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+IEBAIC0xOTYyLDYgKzE5NjIsMTUgQEAg
b2ZfaTNjX21hc3Rlcl9hZGRfaTJjX2JvYXJkaW5mbyhzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9s
bGVyICptYXN0ZXIsCj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gIAo+ICsJLyogVGhl
IEkzQyBTcGVjaWZpY2F0aW9uIGRvZXMgbm90IGNsZWFybHkgc2F5IEkyQyBkZXZpY2VzIHdpdGgg
MTAtYml0Cj4gKwkgKiBhZGRyZXNzIGFyZSBzdXBwb3J0ZWQuIFRoZXNlIGRldmljZXMgY2FuJ3Qg
YmUgcGFzc2VkIHByb3Blcmx5IHRocm91Z2gKPiArCSAqIERFRlNMVlMgY29tbWFuZC4KPiArCSAq
LwoKSU1PIHdlIGp1c3QgbmVlZCB0byBzYXkgMTAtYml0IGFkZHJlc3Mgbm90IHVzZWQgb3Igbm90
IHN1cHBvcnRlZCBpbiBpM2MuCgo+ICsJaWYgKGJvYXJkaW5mby0+YmFzZS5mbGFncyAmIEkyQ19D
TElFTlRfVEVOKSB7Cj4gKwkJZGV2X2VycigmbWFzdGVyLT5kZXYsICJJMkMgZGV2aWNlIHdpdGgg
MTAgYml0IGFkZHJlc3Mgbm90IHN1cHBvcnRlZC4iKTsKPiArCQlyZXR1cm4gLUVOT1RTVVBQOwo+
ICsJfQo+ICsKPiAgCS8qIExWUiBpcyBlbmNvZGVkIGluIHJlZ1syXS4gKi8KPiAgCWJvYXJkaW5m
by0+bHZyID0gcmVnWzJdOwo+ICAKCkFsc28gbmVlZCB0byBjaGFuZ2U6CgojZGVmaW5lIEkyQ19N
QVhfQUREUsKgwqDCoCDCoMKgwqAgwqDCoMKgIEdFTk1BU0soOSwgMCkKdG8KI2RlZmluZSBJMkNf
TUFYX0FERFLCoMKgwqAgwqDCoMKgIMKgwqDCoCBHRU5NQVNLKDYsIDApCmluIG1hc3Rlci5oIGZp
bGUKCk5vdCBzdXJlIGFib3V0Ogp1bnNpZ25lZCBsb25nIGFkZHJzbG90c1soKEkyQ19NQVhfQURE
UiArIDEpICogMikgLyBCSVRTX1BFUl9MT05HXTsKQEJvcmlzIGNhbiB5b3UgY2hlY2sgdGhpcyBw
YXJ0PwoKQmVzdCByZWdhcmRzLApWaXRvciBTb2FyZXMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1pM2MK
