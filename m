Return-Path: <SRS0=XpnT=RA=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4079C43381
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Feb 2019 08:56:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B22E52087C
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Feb 2019 08:56:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QxE/PCor"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B22E52087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YIzT5PQkB01CC45bADTrFLNcVQccauSoc6M9Yzwm8n0=; b=QxE/PCor6DkFyD
	9eZBbkY0gNN6MdsLs7S4bphIliroOlWBKQ7tXy/Wg738Fsd4fZvERE1NCQh0aBVGnYyuW9zVBdDNP
	aWSgslYXl2ueajSlBGpg8PXWP3T64xLZANPfbofFO60TRqhouBb6BheU1BEaSPe0EjJ1WRDfmH0AQ
	QNm0yK7eJa4bVi/Apvo6DzMCWzUkn8/PvDK82ThBD/tjgqqgA3A3VsdMTyNzrj9QO3bQw115pbVMg
	tIGbv2UuWk61OvIk3VhBTKr5mi9gmGLc8qGlSg32eFOg6cVacgQkHGSjfzBySqstF13X7jAbPeOlA
	9NXLVfr5K+2KGi93yEsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyC3t-000564-D2; Mon, 25 Feb 2019 08:56:33 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyC3q-00055M-8s
 for linux-i3c@lists.infradead.org; Mon, 25 Feb 2019 08:56:31 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DA2842605D5;
 Mon, 25 Feb 2019 08:56:28 +0000 (GMT)
Date: Mon, 25 Feb 2019 09:56:25 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: vitor <vitor.soares@synopsys.com>
Subject: Re: [PATCH 1/2] i3c: Add support for HDR modes.
Message-ID: <20190225095625.36727da7@collabora.com>
In-Reply-To: <a4d2b1b8-f30f-4c12-a7ab-1bd2bccf1666@synopsys.com>
References: <cover.1544702829.git.pgaj@cadence.com>
 <efb3b8692d3579ab3369cc0f80e237550f3e8209.1544702829.git.pgaj@cadence.com>
 <cb17ee91-bad8-03d4-cc9f-e7095cf17011@synopsys.com>
 <20190222155238.3dc4ab8f@kernel.org>
 <20190222150248.GA28244@global.cadence.com>
 <a4d2b1b8-f30f-4c12-a7ab-1bd2bccf1666@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190225_005630_577256_A96BB498 
X-CRM114-Status: GOOD (  18.58  )
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
Cc: Przemyslaw Gaj <pgaj@cadence.com>, psroka@cadence.com,
 linux-i3c@lists.infradead.org, rafalc@cadence.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkgVml0b3IKCk9uIEZyaSwgMjIgRmViIDIwMTkgMTc6NDE6MzQgKzAwMDAKdml0b3IgPHZpdG9y
LnNvYXJlc0BzeW5vcHN5cy5jb20+IHdyb3RlOgoKPiBPbiAyMi8wMi8xOSAxNTowMiwgUHJ6ZW15
c2xhdyBHYWogd3JvdGU6Cj4gPj4+PiAgc3RydWN0IGkzY19pYmlfcGF5bG9hZCB7Cj4gPj4+PiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pM2MvbWFzdGVyLmggYi9pbmNsdWRlL2xpbnV4L2kz
Yy9tYXN0ZXIuaAo+ID4+Pj4gaW5kZXggYWRhOTU2YS4uZmQ1MDQ3MyAxMDA2NDQKPiA+Pj4+IC0t
LSBhL2luY2x1ZGUvbGludXgvaTNjL21hc3Rlci5oCj4gPj4+PiArKysgYi9pbmNsdWRlL2xpbnV4
L2kzYy9tYXN0ZXIuaAo+ID4+Pj4gQEAgLTM4Niw2ICszODYsMTAgQEAgc3RydWN0IGkzY19idXMg
ewo+ID4+Pj4gICAqCQkgIFRoaXMgbWV0aG9kIGlzIG1hbmRhdG9yeS4KPiA+Pj4+ICAgKiBAcHJp
dl94ZmVyczogZG8gb25lIG9yIHNldmVyYWwgcHJpdmF0ZSBJM0MgU0RSIHRyYW5zZmVycwo+ID4+
Pj4gICAqCQlUaGlzIG1ldGhvZCBpcyBtYW5kYXRvcnkuCj4gPj4+PiArICogQHNlbmRfaGRyX2Nt
ZHM6IHNlbmQgb25lIG9yIHNldmVyYWwgSERSIGNvbW1hbmRzLiBJZiB0aGVyZSBpcyBtb3JlIHRo
YW4gb25lCj4gPj4+PiArICoJCSAgIGNvbW1hbmQsIHRoZXkgc2hvdWxkIGlkZWFsbHkgYmUgc2Vu
dCBpbiB0aGUgc2FtZSBIRFIKPiA+Pj4+ICsgKgkJICAgdHJhbnNhY3Rpb24uCj4gPj4+PiArICoJ
CSAgIFRoaXMgbWV0aG9kIGlzIG9wdGlvbmFsLgo+ID4+Pj4gICAqIEBhdHRhY2hfaTJjX2Rldjog
Y2FsbGVkIGV2ZXJ5IHRpbWUgYW4gSTJDIGRldmljZSBpcyBhdHRhY2hlZCB0byB0aGUgYnVzLgo+
ID4+Pj4gICAqCQkgICAgVGhpcyBpcyBhIGdvb2QgcGxhY2UgdG8gYXR0YWNoIG1hc3RlciBjb250
cm9sbGVyIHNwZWNpZmljCj4gPj4+PiAgICoJCSAgICBkYXRhIHRvIEkyQyBkZXZpY2VzLgo+ID4+
Pj4gQEAgLTQ1Nyw2ICs0NjEsOSBAQCBzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyX29wcyB7
Cj4gPj4+PiAgCWludCAoKnByaXZfeGZlcnMpKHN0cnVjdCBpM2NfZGV2X2Rlc2MgKmRldiwKPiA+
Pj4+ICAJCQkgIHN0cnVjdCBpM2NfcHJpdl94ZmVyICp4ZmVycywKPiA+Pj4+ICAJCQkgIGludCBu
eGZlcnMpOwo+ID4+Pj4gKwlpbnQgKCpzZW5kX2hkcl9jbWRzKShzdHJ1Y3QgaTNjX2Rldl9kZXNj
ICpkZXYsCj4gPj4+PiArCQkJICAgICBjb25zdCBzdHJ1Y3QgaTNjX2hkcl9jbWQgKmNtZHMsCj4g
Pj4+PiArCQkJICAgICBpbnQgbmNtZHMpOwo+ID4+Pj4gIAlpbnQgKCphdHRhY2hfaTJjX2Rldiko
c3RydWN0IGkyY19kZXZfZGVzYyAqZGV2KTsKPiA+Pj4+ICAJdm9pZCAoKmRldGFjaF9pMmNfZGV2
KShzdHJ1Y3QgaTJjX2Rldl9kZXNjICpkZXYpOwo+ID4+Pj4gIAlpbnQgKCppMmNfeGZlcnMpKHN0
cnVjdCBpMmNfZGV2X2Rlc2MgKmRldiwgICAgCj4gPj4+IFdpdGggdGhpcyBhcHByb2FjaCB0aGUg
Y29udHJvbGxlciBiZXR3ZWVuIGEgc3RhcnQgYW5kIHN0b3AgY2FuIG9ubHkgdHJhbnNtaXQgaW4g
U0RSIG9yIEhEUi4KPiA+Pj4KPiA+Pj4gVGhpcyBpcyBsaW1pdGVkIGZvciBkZXZpY2VzIHRoYXQg
bmVlZCB0aGUgZm9sbG93aW5nIGZyYW1lOgo+ID4+PiDCoMKgwqAgPFN0YXJ0PjxTRFIgeGZlcj48
UmVwZWF0ZWQgU3RhcnQ+PEhEUiBjb21tYW5kPjxTdG9wPiAgCj4gPiBBY3R1YWxseSwgdGhlcmUg
aXMgcmVwZWF0ZWQgc3RhcnQgYmV0d2VlbiBTRFIgYW5kIEVOVEhEUi4gVGhlcmUgaXMgbm8gcmVw
ZWF0ZWQKPiA+IHN0YXJ0IGJldHdlZW4gRU5USERSIGFuZCBIRFIgY29tbWFuZHMsIEhEUiBjb21t
YW5kIGhhcyB0byBzdGFydCBpbW1lZGV0bHkgYWZ0ZXIKPiA+IEVOVEhEUi4gT2YgY291cnNlLCBo
ZHIgcmVzdGFydCBtYXkgb2NjdXIgYmV0d2VlbiBIRFIgY29tbWFuZHMuICAKPiAKPiBTb3JyeSwg
SSBtZWFudCBhbGwgSERSIGZyYW1lLgoKVGhlbiB0aGUgcHJvcG9zZWQgaW50ZXJmYWNlIHNob3Vs
ZCB3b3JrIGp1c3QgZmluZSwgc2luY2Ugd2UgcGFzcyBhbgphcnJheSBvZiBIRFIgY29tbWFuZHMg
dG8gZXhlY3V0ZS4KCj4gCj4gCj4gPj4gSWYgdGhpcyBpcyBhIHVzZSBjYXNlIHdlIHdhbnQgdG8g
c3VwcG9ydCwgdGhlbiB3ZSBzaG91bGQgcHJvYmFibHkgaGF2ZQo+ID4+IHNvbWV0aGluZyBtb3Jl
IGdlbmVyaWMgdGhhbiB3aGF0IHdlIGN1cnJlbnRseSBoYXZlLgo+ID4+Cj4gPj4gU29tZXRoaW5n
IGxpa2UKPiA+Pgo+ID4+IGVudW0gaTNjX3hmZXJfdHlwZSB7Cj4gPj4gCUkzQ19DQ0NfWEZFUiwK
PiA+PiAJSTNDX1NEUl9YRkVSLAo+ID4+IAlJM0NfSERSX1hGRVIsCj4gPj4gfQo+ID4+Cj4gPj4g
c3RydWN0IGkzY194ZmVyIHsKPiA+PiAJZW51bSBpM2NfeGZlcl90eXBlIHR5cGU7Cj4gPj4gCXVu
aW9uIHsKPiA+PiAJCXN0cnVjdCBpM2NfY2NjX2NtZCBjY2M7Cj4gPj4gCQlzdHJ1Y3QgaTNjX3By
aXZfeGZlciBzZHI7Cj4gPj4gCQlzdHJ1Y3QgaTNjX2hkcl9jbWQgaGRyOwo+ID4+IAl9Owo+ID4+
IH0gIAo+IAo+IEBCb3JpczogSSByZW1lbWJlciB5b3UgZG9uJ3Qgd2FudCB0byBleHBvc2UgQ0ND
IGNvbW1hbmRzLCBJIHRoaW5rIGF0IGxlYXN0IGZvciBub3cgd2Ugc2hvdWxkbid0IGV4cG9zZSB0
b28uCj4gCj4gRG8geW91IGFncmVlPwoKV2VsbCwgaWYgd2Ugd2FudCB0byBoYXZlIGEgZ2VuZXJp
YyBpbnRlcmZhY2UgYW5kIG5vdCBmb3JjZSBhbGwgZHJpdmVycwp0byBpbXBsZW1lbnQgb25lIGhv
b2sgcGVyIHRyYW5zZmVyIHR5cGUsIHdlIHNob3VsZCBhbHNvIGhhdmUgQ0NDCmNvbW1hbmRzIGlu
IHRoaXMgZW51bS4gV2UgY2FuIHN0aWxsIG1ha2Ugc3VyZSB0aGUgdXNlciBkb2VzIG5vdCBwYXNz
CkNDQyBjb21tYW5kcyBiZWZvcmUgZm9yd2FyZGluZyB0aGUgcmVxdWVzdCB0byB0aGUgY29udHJv
bGxlci4KCkFueXdheSwgYXMgZm9yIGFsbCB0aGUgb3RoZXIgY2hhbmdlcyBwcm9wb3NlZCBzbyBm
YXIsIEknZCBsaWtlIHRvIHNlZSBhCnJlYWwgdXNlIGNhc2UgZm9yIHRoaXMgU0RSL0hEUlsvQ0ND
XSBtaXguIERvIHlvdSBoYXZlIGEgZGV2aWNlIHNwZWMKZGVzY3JpYmluZyBzdWNoIGEgc2VxdWVu
Y2U/CgpSZWdhcmRzLAoKQm9yaXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1pM2MK
