Return-Path: <SRS0=XpnT=RA=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFED4C43381
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Feb 2019 12:57:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48FF8213A2
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Feb 2019 12:57:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a4mdkySD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hX26dpyT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48FF8213A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hYgK0BarW2AIUYGOi8rJlzGv0gIgALzlBBPwsUGjorA=; b=a4mdkySDzqT2fd
	xIPoh5ZdDAqO5jDOZvNYwoTcXNeAuW/7oFFe/N6m/fhBoOFzSJFxd4hsUa+mS32v5eLvdF55yvPdE
	OxwkLGAUGfz4wBAsAwBQ78PEQ3vpkZa+u0yMe+aPieLQsGllaqS93LZbDIirh4HTVaYB1nntADgrA
	Lykl3uW8MavG4rjIAUjX27NCgCEN5DV9g3jAb3UiGDYM6k0IXfkcCEojJfAdqXROF9ChhaBMySwhu
	eLawMWI3zIZ3SqTt3hT3CULHr9d7zfOqsjhA3aaqSi70v8W7Z9aEV2MYmo+qHkH6K8eS40JucFbE3
	XeRFmw9EQ8Wm3KqIQjsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyFoa-0001jz-Qh; Mon, 25 Feb 2019 12:57:00 +0000
Received: from us01smtprelay-2.synopsys.com ([198.182.60.111]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyFoX-0001jA-96
 for linux-i3c@lists.infradead.org; Mon, 25 Feb 2019 12:56:59 +0000
Received: from mailhost.synopsys.com (dc2-mailhost1.synopsys.com
 [10.12.135.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id 8239810C1A53;
 Mon, 25 Feb 2019 04:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1551099410; bh=wHwaaHxdFTAKdb1i7eD0/5FzGsNV1C4x1rK5XVK2HTc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To:From;
 b=hX26dpyTql890WUnT1gVo26o3oHwJbXYnHtkRftXmTyw99F24p37l0Q0wLPPrGJkS
 5u54GRlMdFnLB3Aemj9xs3LaUbPCCAH0ULTp5iEjvnCF4ZcLpukcv3NYoxEK4M1Kb+
 ZZOu1eyA6Pjhiaw2qR0vx5BUECTv/vK1hiF/VmxoyP3sDfRekWmDvkjfRlReeb2T56
 ujFtdEecKE08RTV6adaktqR/9+Wsmezvf1iDLFHwWld9dm3qGvpSdqlzyPcUCMyGAm
 zmP/eeItW9HocEBBD6TIW8gNraCfX7J1UVqXrVOPFIoENY5nqRMc8Hr7Y2rJJRA1mn
 h8BgkKt+hDl9g==
Received: from us01wehtc1.internal.synopsys.com
 (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id E3272A0094;
 Mon, 25 Feb 2019 12:56:49 +0000 (UTC)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 us01wehtc1.internal.synopsys.com (10.12.239.235) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 25 Feb 2019 04:56:49 -0800
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 DE02WEHTCA.internal.synopsys.com (10.225.19.92) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 25 Feb 2019 13:56:47 +0100
Received: from [10.0.2.15] (10.107.25.89) by DE02WEHTCB.internal.synopsys.com
 (10.225.19.80) with Microsoft SMTP Server (TLS) id 14.3.408.0;
 Mon, 25 Feb 2019 13:56:47 +0100
Subject: Re: [PATCH 1/2] i3c: Add support for HDR modes.
To: Boris Brezillon <boris.brezillon@collabora.com>,
 vitor <vitor.soares@synopsys.com>
References: <cover.1544702829.git.pgaj@cadence.com>
 <efb3b8692d3579ab3369cc0f80e237550f3e8209.1544702829.git.pgaj@cadence.com>
 <cb17ee91-bad8-03d4-cc9f-e7095cf17011@synopsys.com>
 <20190222155238.3dc4ab8f@kernel.org>
 <20190222150248.GA28244@global.cadence.com>
 <a4d2b1b8-f30f-4c12-a7ab-1bd2bccf1666@synopsys.com>
 <20190225095625.36727da7@collabora.com>
From: vitor <vitor.soares@synopsys.com>
Message-ID: <6a5570ee-9d40-2c91-4b32-5e030ce94d07@synopsys.com>
Date: Mon, 25 Feb 2019 12:56:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190225095625.36727da7@collabora.com>
Content-Language: en-US
X-Originating-IP: [10.107.25.89]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190225_045657_331025_C7A1CBDE 
X-CRM114-Status: GOOD (  22.47  )
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

CgpPbiAyNS8wMi8xOSAwODo1NiwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IEhpIFZpdG9yCj4K
PiBPbiBGcmksIDIyIEZlYiAyMDE5IDE3OjQxOjM0ICswMDAwCj4gdml0b3IgPHZpdG9yLnNvYXJl
c0BzeW5vcHN5cy5jb20+IHdyb3RlOgo+Cj4+IE9uIDIyLzAyLzE5IDE1OjAyLCBQcnplbXlzbGF3
IEdhaiB3cm90ZToKPj4+Pj4+ICBzdHJ1Y3QgaTNjX2liaV9wYXlsb2FkIHsKPj4+Pj4+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L2kzYy9tYXN0ZXIuaCBiL2luY2x1ZGUvbGludXgvaTNjL21h
c3Rlci5oCj4+Pj4+PiBpbmRleCBhZGE5NTZhLi5mZDUwNDczIDEwMDY0NAo+Pj4+Pj4gLS0tIGEv
aW5jbHVkZS9saW51eC9pM2MvbWFzdGVyLmgKPj4+Pj4+ICsrKyBiL2luY2x1ZGUvbGludXgvaTNj
L21hc3Rlci5oCj4+Pj4+PiBAQCAtMzg2LDYgKzM4NiwxMCBAQCBzdHJ1Y3QgaTNjX2J1cyB7Cj4+
Pj4+PiAgICoJCSAgVGhpcyBtZXRob2QgaXMgbWFuZGF0b3J5Lgo+Pj4+Pj4gICAqIEBwcml2X3hm
ZXJzOiBkbyBvbmUgb3Igc2V2ZXJhbCBwcml2YXRlIEkzQyBTRFIgdHJhbnNmZXJzCj4+Pj4+PiAg
ICoJCVRoaXMgbWV0aG9kIGlzIG1hbmRhdG9yeS4KPj4+Pj4+ICsgKiBAc2VuZF9oZHJfY21kczog
c2VuZCBvbmUgb3Igc2V2ZXJhbCBIRFIgY29tbWFuZHMuIElmIHRoZXJlIGlzIG1vcmUgdGhhbiBv
bmUKPj4+Pj4+ICsgKgkJICAgY29tbWFuZCwgdGhleSBzaG91bGQgaWRlYWxseSBiZSBzZW50IGlu
IHRoZSBzYW1lIEhEUgo+Pj4+Pj4gKyAqCQkgICB0cmFuc2FjdGlvbi4KPj4+Pj4+ICsgKgkJICAg
VGhpcyBtZXRob2QgaXMgb3B0aW9uYWwuCj4+Pj4+PiAgICogQGF0dGFjaF9pMmNfZGV2OiBjYWxs
ZWQgZXZlcnkgdGltZSBhbiBJMkMgZGV2aWNlIGlzIGF0dGFjaGVkIHRvIHRoZSBidXMuCj4+Pj4+
PiAgICoJCSAgICBUaGlzIGlzIGEgZ29vZCBwbGFjZSB0byBhdHRhY2ggbWFzdGVyIGNvbnRyb2xs
ZXIgc3BlY2lmaWMKPj4+Pj4+ICAgKgkJICAgIGRhdGEgdG8gSTJDIGRldmljZXMuCj4+Pj4+PiBA
QCAtNDU3LDYgKzQ2MSw5IEBAIHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXJfb3BzIHsKPj4+
Pj4+ICAJaW50ICgqcHJpdl94ZmVycykoc3RydWN0IGkzY19kZXZfZGVzYyAqZGV2LAo+Pj4+Pj4g
IAkJCSAgc3RydWN0IGkzY19wcml2X3hmZXIgKnhmZXJzLAo+Pj4+Pj4gIAkJCSAgaW50IG54ZmVy
cyk7Cj4+Pj4+PiArCWludCAoKnNlbmRfaGRyX2NtZHMpKHN0cnVjdCBpM2NfZGV2X2Rlc2MgKmRl
diwKPj4+Pj4+ICsJCQkgICAgIGNvbnN0IHN0cnVjdCBpM2NfaGRyX2NtZCAqY21kcywKPj4+Pj4+
ICsJCQkgICAgIGludCBuY21kcyk7Cj4+Pj4+PiAgCWludCAoKmF0dGFjaF9pMmNfZGV2KShzdHJ1
Y3QgaTJjX2Rldl9kZXNjICpkZXYpOwo+Pj4+Pj4gIAl2b2lkICgqZGV0YWNoX2kyY19kZXYpKHN0
cnVjdCBpMmNfZGV2X2Rlc2MgKmRldik7Cj4+Pj4+PiAgCWludCAoKmkyY194ZmVycykoc3RydWN0
IGkyY19kZXZfZGVzYyAqZGV2LCAgICAKPj4+Pj4gV2l0aCB0aGlzIGFwcHJvYWNoIHRoZSBjb250
cm9sbGVyIGJldHdlZW4gYSBzdGFydCBhbmQgc3RvcCBjYW4gb25seSB0cmFuc21pdCBpbiBTRFIg
b3IgSERSLgo+Pj4+Pgo+Pj4+PiBUaGlzIGlzIGxpbWl0ZWQgZm9yIGRldmljZXMgdGhhdCBuZWVk
IHRoZSBmb2xsb3dpbmcgZnJhbWU6Cj4+Pj4+IMKgwqDCoCA8U3RhcnQ+PFNEUiB4ZmVyPjxSZXBl
YXRlZCBTdGFydD48SERSIGNvbW1hbmQ+PFN0b3A+ICAKPj4+IEFjdHVhbGx5LCB0aGVyZSBpcyBy
ZXBlYXRlZCBzdGFydCBiZXR3ZWVuIFNEUiBhbmQgRU5USERSLiBUaGVyZSBpcyBubyByZXBlYXRl
ZAo+Pj4gc3RhcnQgYmV0d2VlbiBFTlRIRFIgYW5kIEhEUiBjb21tYW5kcywgSERSIGNvbW1hbmQg
aGFzIHRvIHN0YXJ0IGltbWVkZXRseSBhZnRlcgo+Pj4gRU5USERSLiBPZiBjb3Vyc2UsIGhkciBy
ZXN0YXJ0IG1heSBvY2N1ciBiZXR3ZWVuIEhEUiBjb21tYW5kcy4gIAo+PiBTb3JyeSwgSSBtZWFu
dCBhbGwgSERSIGZyYW1lLgo+IFRoZW4gdGhlIHByb3Bvc2VkIGludGVyZmFjZSBzaG91bGQgd29y
ayBqdXN0IGZpbmUsIHNpbmNlIHdlIHBhc3MgYW4KPiBhcnJheSBvZiBIRFIgY29tbWFuZHMgdG8g
ZXhlY3V0ZS4KCkkgdGhpbmsgaXQgaXMgbm90IGNsZWFyIHlldC4gV2hlbiBJIHJlZmVycmVkIDxI
RFIgY29tbWFuZD4gSSBtZWFudCBhbGwgSERSIGZyYW1lIChFTlRIRFJ4LCBIRFIgY29tbWFuZCwg
SERSIENSQykuCgo+Pj4+IElmIHRoaXMgaXMgYSB1c2UgY2FzZSB3ZSB3YW50IHRvIHN1cHBvcnQs
IHRoZW4gd2Ugc2hvdWxkIHByb2JhYmx5IGhhdmUKPj4+PiBzb21ldGhpbmcgbW9yZSBnZW5lcmlj
IHRoYW4gd2hhdCB3ZSBjdXJyZW50bHkgaGF2ZS4KPj4+Pgo+Pj4+IFNvbWV0aGluZyBsaWtlCj4+
Pj4KPj4+PiBlbnVtIGkzY194ZmVyX3R5cGUgewo+Pj4+IAlJM0NfQ0NDX1hGRVIsCj4+Pj4gCUkz
Q19TRFJfWEZFUiwKPj4+PiAJSTNDX0hEUl9YRkVSLAo+Pj4+IH0KPj4+Pgo+Pj4+IHN0cnVjdCBp
M2NfeGZlciB7Cj4+Pj4gCWVudW0gaTNjX3hmZXJfdHlwZSB0eXBlOwo+Pj4+IAl1bmlvbiB7Cj4+
Pj4gCQlzdHJ1Y3QgaTNjX2NjY19jbWQgY2NjOwo+Pj4+IAkJc3RydWN0IGkzY19wcml2X3hmZXIg
c2RyOwo+Pj4+IAkJc3RydWN0IGkzY19oZHJfY21kIGhkcjsKPj4+PiAJfTsKPj4+PiB9ICAKPj4g
QEJvcmlzOiBJIHJlbWVtYmVyIHlvdSBkb24ndCB3YW50IHRvIGV4cG9zZSBDQ0MgY29tbWFuZHMs
IEkgdGhpbmsgYXQgbGVhc3QgZm9yIG5vdyB3ZSBzaG91bGRuJ3QgZXhwb3NlIHRvby4KPj4KPj4g
RG8geW91IGFncmVlPwo+IFdlbGwsIGlmIHdlIHdhbnQgdG8gaGF2ZSBhIGdlbmVyaWMgaW50ZXJm
YWNlIGFuZCBub3QgZm9yY2UgYWxsIGRyaXZlcnMKPiB0byBpbXBsZW1lbnQgb25lIGhvb2sgcGVy
IHRyYW5zZmVyIHR5cGUsIHdlIHNob3VsZCBhbHNvIGhhdmUgQ0NDCj4gY29tbWFuZHMgaW4gdGhp
cyBlbnVtLiBXZSBjYW4gc3RpbGwgbWFrZSBzdXJlIHRoZSB1c2VyIGRvZXMgbm90IHBhc3MKPiBD
Q0MgY29tbWFuZHMgYmVmb3JlIGZvcndhcmRpbmcgdGhlIHJlcXVlc3QgdG8gdGhlIGNvbnRyb2xs
ZXIuCgpJJ20gb2sgd2l0aCB0aGlzLiBTdGlsbCB0aGVyZSBpcyBzb21lIENDQyBjb21tYW5kcyB0
aGF0IG1pZ2h0IGJlIGV4cG9zZSBmb3IgZGV2aWNlcyBhbmQgd2UgY2FuIGRlY2lkZSBpdCBsYXRl
ci4KCj4gQW55d2F5LCBhcyBmb3IgYWxsIHRoZSBvdGhlciBjaGFuZ2VzIHByb3Bvc2VkIHNvIGZh
ciwgSSdkIGxpa2UgdG8gc2VlIGEKPiByZWFsIHVzZSBjYXNlIGZvciB0aGlzIFNEUi9IRFJbL0ND
Q10gbWl4LiBEbyB5b3UgaGF2ZSBhIGRldmljZSBzcGVjCj4gZGVzY3JpYmluZyBzdWNoIGEgc2Vx
dWVuY2U/CgpGcm9tIG15IGtub3dsZWRnZSB0aGVyZSBpcyBubyBkZXZpY2VzIEhEUiBjYXBhYmxl
IG9uIHRoZSBtYXJrZXQgdGh1cyBJIGNhbm5vdCBhcmd1ZSB3aXRoIHJlYWwgdXNlIGNhc2UuCgpC
dXQgcGVyIGkzYyBzcGVjIHYxLjAgdGhlcmUgaXMgbm8gbWVudGlvbiB0aGF0IEhEUiBmcmFtZSBz
aGFsbCBiZWdpbiB3aXRoIGEgU1RBUlQgY29uZGl0aW9uIChub3QgUkVQRUFURUQgU1RBUlQpLgpT
bywgdGhlIHF1ZXN0aW9uIGlzIHdoeSBkbyBub3Qgc3VwcG9ydCBpdCBpbnN0ZWFkIG9mIGxpbWl0
aW5nIGl0PwoKV2UgZG9uJ3Qga25vdyB0aGUgaW1wbGVtZW50YXRpb24gb2YgdGhlIGRldmljZSBh
bmQgc29tZSBvZiB0aGVtIG1heWJlIG5lZWQgdGhlIHByZXZpb3VzIHRyYW5zZmVyIChpbiBTRFIp
IHRvIGRvIHRoZSBuZXh0IG9uZSAoaW4gSERSKS4KCmFuZCBzdXBwb3J0aW5nIGl0IHdlIGFyZSBj
b3ZlciBtb3JlIHVzZSBjYXNlcy4KPiBSZWdhcmRzLAo+Cj4gQm9yaXMKCkJlc3QgcmVnYXJkcywK
Vml0b3IgU29hcmVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
