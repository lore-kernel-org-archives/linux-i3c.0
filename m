Return-Path: <SRS0=ySRA=Z7=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D290BC43603
	for <linux-i3c@archiver.kernel.org>; Mon,  9 Dec 2019 09:48:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4E3324680
	for <linux-i3c@archiver.kernel.org>; Mon,  9 Dec 2019 09:48:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YPOwU1+3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4E3324680
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2xs9lxTI05VLgkPGxwVfdMhiX7Ygxw3JyqcpafwY43Y=; b=YPOwU1+3n2my60
	+zR0qDN1zTOwlTUWmF/yD97PkfSlNLOYUZPXoMOGj2XyFAk2Tye3H5K6WO2A0ryCBDnaAZJNz3FKj
	pp+ixVRc46tXEcUuuAvU8WeCXCczdLlAgSuVly3aG48DuF8gyJKNp1U9FExfSanDj79RsbRCJRnV1
	Fooa6URvSFRcT6RL+lhQ8GfV/dwFqyMdtSZA9F/GHf7PvO+7Mvt8dRvn8wcs0q0iM12tPNzCWLAef
	1Dm1G/0dakd0OW0aicxzCbhOQ71CqeD34Jk1LAnnLJSYTlDp/66MY4yrpSDs6HDAeWYEGVcFF/3mJ
	2Cxj5EFgwnUsJZTn9F5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieFeI-0001U1-16; Mon, 09 Dec 2019 09:48:14 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieFdN-0000lW-JE
 for linux-i3c@lists.infradead.org; Mon, 09 Dec 2019 09:47:19 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E258228D701;
 Mon,  9 Dec 2019 09:47:14 +0000 (GMT)
Date: Mon, 9 Dec 2019 10:47:11 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?UHJ6ZW15c8WCYXc=?= Gaj <pgaj@cadence.com>
Subject: Re: [PATCH] i3c: make sure the PID is set before registering the
 device
Message-ID: <20191209104711.5a549d31@collabora.com>
In-Reply-To: <20191208141834.10310-1-pgaj@cadence.com>
References: <20191208141834.10310-1-pgaj@cadence.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_014717_801399_A9949793 
X-CRM114-Status: GOOD (  12.90  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, vitor.soares@synopsys.com,
 rafalc@cadence.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gU3VuLCA4IERlYyAyMDE5IDE1OjE4OjM0ICswMTAwClByemVteXPFgmF3IEdhaiA8cGdhakBj
YWRlbmNlLmNvbT4gd3JvdGU6Cgo+IEZyb206IFByemVteXNsYXcgR2FqIDxwZ2FqQGNhZGVuY2Uu
Y29tPgo+IAo+IFByb3Zpc2lvbmVkIElEIChQSUQpIGlzIHRoZSB2YWx1ZSB3aXRoIHdoaWNoIGRl
dmljZSBkcml2ZXJzIGFyZQo+IG1hdGNoZWQuIEkgY2hlY2sgdGhlIHZhbHVlIGJlZm9yZSByZWdp
c3RlcmluZyB0aGUgZGV2aWNlLgo+IAoKQ2FuIHRoaXMgc2l0dWF0aW9uIChoYXZpbmcgYSBkZXZp
Y2Ugd2l0aCBhIERBIGJ1dCB3aXRob3V0IGEgdmFsaWQgUElEKQpoYXBwZW4gcmlnaHQgbm93IG9y
IGlzIHRoaXMgc29tZXRoaW5nIHlvdSBuZWVkIHRvIHN1cHBvcnQgc2Vjb25kYXJ5Cm1hc3RlcnMg
d2hvIHJlY2VpdmUgZGV2aWNlIERBICh0aHJvdWdoIERFRlNWTFMpIHdpdGhvdXQgYmVpbmcgYWJs
ZSB0bwpxdWVyeSBleHRyYSBpbmZvcm1hdGlvbiB1bnRpbCB0aGV5IG93biB0aGUgYnVzPwoKPiBT
aWduZWQtb2ZmLWJ5OiBQcnplbXlzbGF3IEdhaiA8cGdhakBjYWRlbmNlLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9pM2MvbWFzdGVyLmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rl
ci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiBpbmRleCAwNDM2OTE2NTYyNDUuLjA3ZWE4YjBi
NzczNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+ICsrKyBiL2RyaXZlcnMv
aTNjL21hc3Rlci5jCj4gQEAgLTE0NDksNyArMTQ0OSw4IEBAIGkzY19tYXN0ZXJfcmVnaXN0ZXJf
bmV3X2kzY19kZXZzKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3RlcikKPiAgCQly
ZXR1cm47Cj4gIAo+ICAJaTNjX2J1c19mb3JfZWFjaF9pM2NkZXYoJm1hc3Rlci0+YnVzLCBkZXNj
KSB7Cj4gLQkJaWYgKGRlc2MtPmRldiB8fCAhZGVzYy0+aW5mby5keW5fYWRkciB8fCBkZXNjID09
IG1hc3Rlci0+dGhpcykKPiArCQlpZiAoZGVzYy0+ZGV2IHx8ICFkZXNjLT5pbmZvLmR5bl9hZGRy
IHx8Cj4gKwkJICAgIGRlc2MgPT0gbWFzdGVyLT50aGlzIHx8ICFkZXNjLT5pbmZvLnBpZCkKPiAg
CQkJY29udGludWU7Cj4gIAo+ICAJCWRlc2MtPmRldiA9IGt6YWxsb2Moc2l6ZW9mKCpkZXNjLT5k
ZXYpLCBHRlBfS0VSTkVMKTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
aTNjCg==
